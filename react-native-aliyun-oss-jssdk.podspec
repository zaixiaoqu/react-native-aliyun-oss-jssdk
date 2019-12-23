require 'json'
package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name          = package['name']
  s.version       = package["version"]
  s.summary       = package['description']
  s.authors      = { package["author"]["name"] => package["author"]["email"] }
  s.license       = package['license']
  s.homepage      = package['homepage']
  s.source       = { :git => package["repository"]["url"] }
  s.platform      = :ios, '8.0'

  s.source_files = "ios/**/*.{h,m,swift}"

  s.dependency 'React'

  s.vendored_frameworks = "ios/AliyunSDK/AliyunOSSiOS.framework"
  s.ios.frameworks = 'SystemConfiguration','CoreTelephony'
  s.osx.frameworks = 'SystemConfiguration','CoreTelephony'
  s.library   = 'resolv'

end
