source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!
inhibit_all_warnings!

target 'Rubicon' do
    pod 'AlamofireObjectMapper', '~> 4.0'
    pod 'SDWebImage', '~> 4.0'
end

post_install do |installer|
    installer.aggregate_targets.each do |target|
        installer.pods_project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4.0'
            end
        end
    end
end
