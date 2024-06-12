version = "2.1.2"

Pod::Spec.new do |s|
  s.name             = "surveymonkey-ios-sdk"
  s.version          = version
  s.summary          = "The SurveyMonkey Mobile Feedback SDK for iOS"
  s.homepage         = "https://github.com/SurveyMonkey/surveymonkey-ios-sdk"
  s.license          = 'MIT'
  s.author           = { "Team SDK" => "dev-team-sdk@surveymonkey.com" }
  s.source           = { :http => "https://github.com/SurveyMonkey/surveymonkey-ios-sdk/releases/download/v#{s.version}/SurveyMonkeyiOSSDK.zip"}
  s.platform     = :ios, '12.0'
  s.ios.vendored_frameworks = 'SurveyMonkeyiOSSDK.xcframework'
end