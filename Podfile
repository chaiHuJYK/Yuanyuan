source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
target 'Yuanyuan' do
 # pod ‘AFNetworking’, ‘~> 3.1.0’ 
 # pod ‘TostChaiHu’, :git => ‘https://github.com/chaiHuJYK/TostChaiHu.git’
  pod ‘TostChaiHu’, :path => ‘../TostChaiHu’
end


post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '3.0'
     end
    end
  end