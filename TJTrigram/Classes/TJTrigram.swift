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
        
//        var excludes: [String] = []
//        
//        for word in allWords {
//            if !sharedWords.contains(word) {
//                excludes.append(word)
//            }
//        }
//        print(excludes)
//        // ["バー！", "れて良", "11巻", "セ、セ", "タぁあ", "って良", "ンリエ", "サｧぁ", "！！タ", "ルミナ", "、シエ", "ｧぁあ", "説11", "1巻の", "期決ま", "！！ヴ", "タバサ", "シャナ", "アンリ", "！セ、", "2巻の", "セイバ", "シ、シ", "エッタ", "ヴィル", "ルヘル", "ヘルミ", "！シ、", "ター！", "2期決", "、セイ", "！タバ", "！！ア", "ミナぁ", "エスタ", "リエッ", "まって", "2期放", "ィルヘ", "スター", "ナぁあ", "！ヴィ", "イバー", "期放送", "！シャ", "送され", "決まっ", "！！セ", "説12", "ッタぁ", "放送さ", "バサｧ", "シエス", "ャナぁ", "12巻", "！アン"]
        
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
