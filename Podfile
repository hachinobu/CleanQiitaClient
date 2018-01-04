source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

abstract_target 'All' do

  pod 'APIKit', '~> 3.0'
  pod 'HydraAsync'
  pod 'Nuke', '~> 6.0'
  
  target 'CleanQiitaClient' do
  end

  target 'DataLayer' do
  end

  target 'DomainLayer' do
  end

  target 'PresentationLayer' do
  end

  target 'Networking' do
  end

  target 'Utility' do
  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if target.name == 'APIKit'
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '3.0'
            end
        end
    end
end
