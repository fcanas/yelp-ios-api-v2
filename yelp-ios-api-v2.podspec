#
# Be sure to run `pod spec lint yelp-ios-api-v2.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
Pod::Spec.new do |s|
  s.name         = "yelp-ios-api-v2"
  s.version      = "0.0.1"
  s.summary      = "An easy to use iOS client for Yelp Search v2."
  s.homepage     = "https://github.com/fcanas/yelp-ios-api-v2"
  s.license      = 'MIT'
  s.author       = { "Fabian Canas" => "fcanas@gmail.com" }
  s.source       = { :git => "https://github.com/fcanas/yelp-ios-api-v2.git"}#, :tag => "0.0.1" 
  s.platform     = :ios, '5.0'
  s.source_files = 'yelp-ios-api-v2'
  s.framework  = 'MapKit'
  s.framework  = 'CoreLocation'
  s.requires_arc = true
  s.dependency 'AFNetworking', '>=1.2'
  s.dependency 'AFOAuth1Client'
end
