# Uncomment the next line to define a global platform for your project
platform :ios, '12.1'

target 'DanaCatatan' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  # Pods for DanaCatatan
  
  pod 'SnapKit', '~> 5.6.0'
  
  pod 'Alamofire', '~> 5.7.1'
  
  pod 'Kingfisher', '~> 7.11.0'
  
  pod 'MJRefresh', '~> 3.7.6'
  
  pod 'JXGradientKit', '~> 0.0.11'
  
  pod 'UIColor_Hex_Swift', '~> 5.1.9'
  
  pod 'IQKeyboardManagerSwift', '~> 6.5.16'
  
  pod 'YYText', '~> 1.0.7'
  
  pod 'ReachabilitySwift', '~> 5.0.0'
  
  pod 'DeviceKit', '~> 5.2.2'
  
  pod 'SystemServices', '~> 2.0.1'
  
  pod 'SAMKeychain', '~> 1.5.3'
  
  pod 'HandyJSON', '~> 5.0.2'
  
  pod 'AppsFlyerFramework', '~> 6.12.3'
  
  pod 'TYAlertController', '~> 1.2.0'
  
  pod 'MBProgressHUD+WJExtension', '~> 1.3.1'
  
  pod 'lottie-ios', '~> 4.3.1'
  
  pod 'BRPickerView', '~> 2.8.1'
  
  pod 'RxSwift', '~> 6.6.0'
  
  pod 'GKCycleScrollView', '~> 1.2.2'
  
  pod 'SwipeCellKit', '~> 2.7.1'
  
  pod 'DGCharts', '~> 5.1.0'
  
  pod 'MarqueeLabel', '~> 4.5.0'
    
  post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
      config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
    end
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
      end
    end
  end
  
end
