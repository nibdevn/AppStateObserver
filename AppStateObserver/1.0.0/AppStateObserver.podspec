#
# Be sure to run `pod lib lint AppStateObserver.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AppStateObserver'
  s.version          = '1.0.0'
  s.summary          = 'This is AppStateObserver'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "This is AppStateObserver Changed AppState Receive"

  s.homepage         = 'https://github.com/nibdevn/AppStateObserver'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Nahanwoong' => 'nibdevn@gmail.com' }
  s.source           = { :git => 'https://github.com/nibdevn/AppStateObserver.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_version = '4.2'
  s.source_files = 'AppStateObserver/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AppStateObserver' => ['AppStateObserver/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
