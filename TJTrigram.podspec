#
# Be sure to run `pod lib lint TJTrigram.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "TJTrigram"
  s.version          = "0.1.0"
  s.summary          = "Measure the degree of similarity between texts."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "Measure the degree of similarity between texts and return it."
  s.homepage         = "https://github.com/tanjo/TJTrigram"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "tanjo" => "tanjo@users.noreply.github.com" }
  s.source           = { :git => "https://github.com/tanjo/TJTrigram.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/tanjoin'

  s.ios.deployment_target = '8.0'

  s.source_files = 'TJTrigram/Classes/**/*'
  
  # s.resource_bundles = {
  #   'TJTrigram' => ['TJTrigram/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
