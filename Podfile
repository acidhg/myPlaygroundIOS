source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

def shared_pods
  # network
  pod 'Alamofire', '~> 4.0'
  pod 'SwiftyJSON'
  # pod 'Kingfisher', '~> 3.0'
  # database
  pod "SugarRecord/CoreData"
  pod 'RealmSwift'
  pod 'Firebase/Core'
  pod 'Firebase/Database'
  pod 'Firebase/Auth'
  # layout
  pod 'SnapKit', '~> 3.0'
  # pod 'ReactiveCocoa', '5.0.0-alpha.6'
  # pod 'Spring', :git => 'https://github.com/MengTo/Spring.git', :branch => 'swift3'
  # pod 'ChameleonFramework/Swift', :git => 'https://github.com/ViccAlexander/Chameleon.git'
  # UI elements
  # pod 'Eureka', '~> 2.0.0-beta.1'
  # pod 'MGSwipeTableCell'
  # pod 'SVProgressHUD', :git => 'https://github.com/SVProgressHUD/SVProgressHUD.git'
  # pod 'FontBlaster'
  # General
  # pod 'PermissionScope'
  # pod 'SwifterSwift'
  # pod 'Bolts-Swift'
end
def test_pods
  pod 'Quick'
  pod 'Nimble'
end

target 'myPlay' do
  shared_pods

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '3.0'
      end
    end
  end
end
target 'myPlayTests' do
  shared_pods
  test_pods
end
target 'myPlayUITests' do
  shared_pods
  test_pods
end
