#
# Be sure to run `pod lib lint HJProgress.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HJProgress'
  s.version          = '1.0.0'
  s.summary          = 'A short description of HJProgress.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Nevergive-up/HJProgress.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mr.Heng' => '1219876794@qq.com' }
  s.source           = { :git => 'https://github.com/Nevergive-up/HJProgress.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  
  s.requires_arc          = true
  s.static_framework      = true
  s.swift_version         = '5.0'
  s.ios.deployment_target = '10.0'

  s.source_files = 'HJProgress/Classes/**/*'
  
  # s.resource_bundles = {
  #   'HJProgress' => ['HJProgress/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
#  s.dependency 'SnapKit'
   
end
