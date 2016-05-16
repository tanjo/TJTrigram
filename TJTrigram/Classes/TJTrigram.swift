//
//  TJTrigram.swift
//

import UIKit

public class TJTrigram: NSObject {
    
    public var content: String? {
        didSet {
            guard let content = self.content else {
                return
            }
            self.container = self.split(content)
        }
    }
    var container: [String] = []
    
    // MARK: - Initializer
    
    public convenience init(content: String) {
        self.init()
        self.content = content
        self.container = self.split(content)
    }
    
    private override init() {
        super.init()
    }
    
    // MARK: - Public methods
    
    private func result(target: String) -> ([String], [String]) {
        let targetContainer = self.split(target)
        
        var sharedTrigram: [String] = []
        
        for ownedWord in self.container {
            for targetWord in targetContainer {
                if ownedWord == targetWord {
                    sharedTrigram.append(ownedWord)
                }
            }
        }
        return (Array(Set(sharedTrigram)), Array(Set(self.container + targetContainer)))
    }
    
    public func result(target: String) -> Double {
        let (sharedWords, allWords) = self.result(target)
        
        return Double(sharedWords.count) / Double(allWords.count)
    }
    
    // MARK: - Private methods
    
    private func split(target: String?) -> [String] {
        guard let target = target where target.characters.count > 2 else {
            return []
        }
        var container: [String] = []
        for i in 0..<target.characters.count - 2 {
            let startIndex = target.startIndex.advancedBy(i)
            let endIndex = target.startIndex.advancedBy(i + 2)
            container.append(target.substringWithRange(startIndex...endIndex))
        }
        return container
    }
}
