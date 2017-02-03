source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

abstract_target 'All' do

  pod 'APIKit', '~> 3.0'

  target 'CleanQiitaClient' do
  end

  target 'DataLayer' do
    pod 'ObjectMapper'
  end

  target 'DomainLayer' do
    pod "PromiseKit", "~> 4.0"
  end

  target 'PresentationLayer' do
    pod 'Kingfisher'
    pod "PromiseKit", "~> 4.0"
  end

  target 'Networking' do
    pod 'ObjectMapper'
  end

  target 'Utility' do
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
