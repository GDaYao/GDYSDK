Pod::Spec.new do |s|
  s.name = "GDYSDK"
  s.version = "0.1.1"
  s.summary = "GDYSDK personal cretae SDK"
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"GDY"=>"jaeda1418154979@gmail.com"}
  s.homepage = "https://github.com/GDaYao/GDYSDK"
  s.description = "TODO: Add long description of the pod here."
  s.frameworks = ["UIKit", "MapKit"]
  s.source = { :path => '.' }

  s.ios.deployment_target    = '8.0'
  s.ios.vendored_framework   = 'ios/GDYSDK.framework'
end
