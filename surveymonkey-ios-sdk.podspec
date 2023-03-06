version = "2.1.1"

Pod::Spec.new do |s|
  s.name             = "surveymonkey-ios-sdk"
  s.version          = version
  s.summary          = "The SurveyMonkey Mobile Feedback SDK for iOS"
  s.homepage         = "https://github.com/SurveyMonkey/surveymonkey-ios-sdk"
  s.license          = 'MIT'
  s.author           = { "Team SDK" => "dev-team-sdk@surveymonkey.com" }
  s.source           = { :http => "https://github.com/SurveyMonkey/surveymonkey-ios-sdk/releases/download/v#{s.version}/SurveyMonkeyiOSSDK.zip"}
  s.platform     = :ios, '11.0'
  s.ios.vendored_frameworks = 'SurveyMonkeyiOSSDK.xcframework'
end