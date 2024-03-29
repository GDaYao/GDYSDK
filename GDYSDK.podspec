#
# Be sure to run `pod lib lint GDYSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GDYSDK'
  s.version          = '0.1.13' # please remeber to change README.md of version.
  s.summary          = 'GDYSDK personal cretae SDK'
  
  
  s.description      = <<-DESC
  TODO: Add long description of the pod here.
  DESC
  
  s.homepage         = 'https://github.com/GDaYao/GDYSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'GDY' => 'jaeda1418154979@gmail.com' }
  s.source           = { :git => 'https://github.com/GDaYao/GDYSDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  
  s.ios.deployment_target = '8.0'
  
  #  s.source_files = 'GDYSDK/Classes/**/*'
  #  s.public_header_files = 'GDYSDK/Classes/**/*.h'
  
  #s.xcconfig = { "LIBRARY_SEARCH_PATHS" => '$(inherited)', "HEADER_SEARCH_PATHS" => '$(inherited)', "OTHER_CFLAGS" => '$(inherited)', "OTHER_LDFLAGS" => '$(inherited)', "GCC_PREPROCESSOR_DEFINITIONS" => '$(inherited)' }
  
  # s.resource_bundles = {
  #   'GDYSDK' => ['GDYSDK/Assets/*.png']
  # }
  #s.dependency 'AFNetworking', '3.2.1'
  s.frameworks = 'UIKit', 'MapKit'
  
  
  
  s.subspec 'Core' do |core|
    core.libraries = 'sqlite3'
    core.source_files = 'GDYSDK/Classes/Core/**/*'
    core.public_header_files = 'GDYSDK/Classes/Core/**/*.h'
    core.dependency 'AFNetworking','3.2.1'
    #core.dependency 'MBProgressHUD'
    #core.resource_bundles = {
    #    'GDYSDK-Core' => ['GDYSDK/Assets/Core/*.png', 'GDYSDK/Assets/Core/*.xib', 'GDYSDK/Assets/Core/LocalizedStrings/*.lproj/*']
    #}
    #core.frameworks = 'CoreTelephony', 'GameController', 'MediaPlayer', 'GameKit', 'StoreKit', 'SystemConfiguration', 'Security'
    core.xcconfig = { "FRAMEWORK_SEARCH_PATHS" => '$(inherited)', "LIBRARY_SEARCH_PATHS" => '$(inherited)', "HEADER_SEARCH_PATHS" => '$(inherited)', "OTHER_CFLAGS" => '$(inherited)', "OTHER_LDFLAGS" => '$(inherited)', "GCC_PREPROCESSOR_DEFINITIONS" => '$(inherited)' }
    
  end
  
  s.subspec 'BaseUI' do |baseui|
    baseui.libraries = 'sqlite3'
    baseui.source_files = 'GDYSDK/Classes/BaseUI/**/*'
    baseui.public_header_files = 'GDYSDK/Classes/BaseUI/**/*.h'
    #core.dependency 'AFNetworking','3.2.1'
    #core.dependency 'MBProgressHUD'
    #core.resource_bundles = {
    #    'GDYSDK-Core' => ['GDYSDK/Assets/Core/*.png', 'GDYSDK/Assets/Core/*.xib', 'GDYSDK/Assets/Core/LocalizedStrings/*.lproj/*']
    #}
    #core.frameworks = 'CoreTelephony', 'GameController', 'MediaPlayer', 'GameKit', 'StoreKit', 'SystemConfiguration', 'Security'
    #      core.xcconfig = { "FRAMEWORK_SEARCH_PATHS" => '$(inherited)', "LIBRARY_SEARCH_PATHS" => '$(inherited)', "HEADER_SEARCH_PATHS" => '$(inherited)', "OTHER_CFLAGS" => '$(inherited)', "OTHER_LDFLAGS" => '$(inherited)', "GCC_PREPROCESSOR_DEFINITIONS" => '$(inherited)' }
    
  end
  
  s.subspec 'PublicHeader' do |publicheader|
    publicheader.libraries = 'sqlite3'
    publicheader.source_files = 'GDYSDK/Classes/PublicHeader/**/*'
    publicheader.public_header_files = 'GDYSDK/Classes/PublicHeader/**/*.h'
    #core.dependency 'AFNetworking','3.2.1'
    #core.dependency 'MBProgressHUD'
    #core.resource_bundles = {
    #    'GDYSDK-Core' => ['GDYSDK/Assets/Core/*.png', 'GDYSDK/Assets/Core/*.xib', 'GDYSDK/Assets/Core/LocalizedStrings/*.lproj/*']
    #}
    #core.frameworks = 'CoreTelephony', 'GameController', 'MediaPlayer', 'GameKit', 'StoreKit', 'SystemConfiguration', 'Security'
    #      core.xcconfig = { "FRAMEWORK_SEARCH_PATHS" => '$(inherited)', "LIBRARY_SEARCH_PATHS" => '$(inherited)', "HEADER_SEARCH_PATHS" => '$(inherited)', "OTHER_CFLAGS" => '$(inherited)', "OTHER_LDFLAGS" => '$(inherited)', "GCC_PREPROCESSOR_DEFINITIONS" => '$(inherited)' }
    
  end
  
  s.subspec 'FunctionMethod' do |functionmethod|
    functionmethod.libraries = 'sqlite3'
    functionmethod.source_files = 'GDYSDK/Classes/FunctionMethod/**/*'
    functionmethod.public_header_files = 'GDYSDK/Classes/FunctionMethod/**/*.h'
  end
  
  s.subspec 'iOSSysFuncMethod' do |iossysfuncmethod|
    
    iossysfuncmethod.libraries = 'sqlite3'
    iossysfuncmethod.source_files = 'GDYSDK/Classes/iOSSysFuncMethod/**/*'
    iossysfuncmethod.public_header_files = 'GDYSDK/Classes/iOSSysFuncMethod/**/*.h'
    
    end
  
  
  
  
  
  
end
