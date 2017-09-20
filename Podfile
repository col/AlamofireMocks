platform :ios, '9.0'

workspace 'AlamofireMocks.xcworkspace'

target 'AlamofireMocks' do
  use_frameworks!

  pod 'Alamofire'

  target 'AlamofireMocksTests' do
    inherit! :search_paths
    # Pods for testing
  end
end

target 'AlamofireMocksExample' do
  project 'Example/AlamofireMocksExample.xcodeproj'
  use_frameworks!

  pod 'Alamofire'
end
