Pod::Spec.new do |s|
  s.name             = "surveymonkey-ios-sdk"
  s.version          = "1.0.8"
  s.summary          = "The SurveyMonkey Mobile Feedback SDK for iOS"
  s.homepage         = "https://github.com/SurveyMonkey/surveymonkey-ios-sdk"
  s.license          = 'MIT'
  s.author           = { "Ben Leiken" => "benl@surveymonkey.com" }
  s.source           = { :git => "https://github.com/SurveyMonkey/surveymonkey-ios-sdk.git", :tag => s.version.to_s }
  s.platform     = :ios, '7.1'
  s.requires_arc = true
  s.vendored_frameworks = 'SurveyMonkeyiOSSDK.framework'
end
