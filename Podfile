source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target 'myPlay' do
  # network
  pod 'Alamofire', '~> 4.0'
  pod 'SwiftyJSON'
  pod 'Kingfisher', '~> 3.0'
  # database
  pod 'CoreStore'
  # layout
  pod 'SnapKit', '~> 3.0'
  pod 'ReactiveCocoa', '5.0.0-alpha.6'
  pod 'Spring', :git => 'https://github.com/MengTo/Spring.git', :branch => 'swift3'
  pod 'ChameleonFramework/Swift', :git => 'https://github.com/ViccAlexander/Chameleon.git'
  # UI elements
  pod 'Eureka', '~> 2.0.0-beta.1'
  pod 'MGSwipeTableCell'
  pod 'SVProgressHUD', :git => 'https://github.com/SVProgressHUD/SVProgressHUD.git'
  pod 'FontBlaster'
  # General
  pod 'PermissionScope'
  pod 'SwifterSwift'
  pod 'Bolts-Swift'

  abstract_target 'Tests' do
    inherit! :search_paths
    target 'myPlayTests'
    target 'myPlayUITests'

    pod 'Quick'
    pod 'Nimble'
  end
end
