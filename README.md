## SurveyMonkey Mobile Feedback SDK for iOS

The SurveyMonkey Mobile Feedback SDK for iOS allows app developers to integrate SurveyMonkey surveys and respondent data into their apps. Checkout our [documentation site](http://surveymonkey.github.io/surveymonkey-ios-sdk/) for more information.

We strive to fix bugs and add new features as quickly as possible. Please watch our Github repo to stay up to date.

To download the SDK, either clone the SDK
```bash
git clone https://github.com/SurveyMonkey/surveymonkey-ios-sdk.git
```
Or download the [latest release](https://github.com/SurveyMonkey/surveymonkey-ios-sdk/releases)

### Integrating with XCode

1. In the project navigation sidebar, right-click on the **Frameworks** group and select **"Add files to [ProjectName]"**
2. Navigate to the **surveymonkey-ios-sdk** directory that is contained in your cloned version of the **surveymonkey-ios-sdk** and select the **SurveyMonkeyiOSSDK.framework** file
3. Make sure that **"Copy items if necessary"** is checked and all targets that will use the SDK are selected


That's it!

###Integrating the SurveyMonkey SDK with your app
For a detailed example, take a look at the **Simple Survey** sample project in our Github repo


####Important
Usage of the respondent data returned by the SurveyMonkey Mobile Feedback SDK requires that your class implement <SMFeedbackDelegate> and the `– respondentDidEndSurvey:error:` method therein


The survey respondent data is returned as an SMSDKResponse. Here's an example implementation of `- respondentDidEndSurvey:error:`:
```objc
- (void)respondentDidEndSurvey:(SMSDKRespondent *)respondent error:(NSError *) error {
    if (respondent != nil) {
        SMSDKQuestionResponse * questionResponse = respondent.questionResponses[0];
        NSString * questionID = questionResponse.questionID;
        if ([questionID isEqualToString:FEEDBACK_QUESTION_ID]) {
            SMSDKAnswerResponse * answerResponse = questionResponse.answers[0];
            NSString * rowID = answerResponse.rowID;
            if ([rowID isEqualToString:FEEDBACK_FIVE_STARS_ROW_ID] || [rowID isEqualToString:FEEDBACK_FOUR_STARS_ROW_ID]) {
                [_statusLabel setText:@"Thanks! Please rate us in the app store!"];
            }
            else {
                [_statusLabel setText:@"Thanks for taking our survey. We'll address the issues you encountered as quickly as possible!"];
            }
        }
    }
    else {
      NSLog(@"%@", error.description);
    }

}
```

####Getting Started
1. `#import <SurveyMonkeyiOSSDK/SurveyMonkeyiOSSDK.h>`
2. Depending on your usage, add a property to your interface:
```objc
@property (nonatomic, strong) SMSDKFeedbackViewController * feedbackController;
```
2. Initialize the SDK and set its delegate like so:
```objc
_feedbackController = [[SMSDKFeedbackViewController alloc] initWithSurvey:{SAMPLE_SURVEY_HASH}];
_feedbackController.delegate = self;
```

####The Intercept Modal
To kick off the SurveyMonkey Mobile Feedback SDK Intercept process, call:
```objc
[_feedbackController presentInterceptFromViewController:self withAppTitle:{SAMPLE_APP_NAME}];
```
from your main activity. This will check to see if the user should be prompted to take your survey (i.e. `if (timeSinceLastSurveyPrompt > maxTimeIntervalBetweenSurveyPrompts)`). The copy of the prompts, as well as the time intervals, can be customized, see our [docs](http://surveymonkey.github.io/surveymonkey-ios-sdk/) for more information.


####Presenting a Survey to the User
To present a survey for the user to take, call
```objc
[_feedbackController presentFromViewController:self animated:YES completion:nil];
```

####Issues and Bugs
Please submit any issues with the SDK to us via Github issues, for more critical bugs, email [support@surveymonkey.com](mailto:support@surveymonkey.com)
