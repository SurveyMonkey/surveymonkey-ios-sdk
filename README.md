## SurveyMonkey Feedback SDK for iOS

The SurveyMonkey Feedback SDK allows app developers to integrate SurveyMonkey surveys and responses into their apps. The SDK allows your users to provide qualitative feedback about their in-app experience and lets your app respond to their feedback on the fly. You can use it to direct your app's biggest fans to the App Store to rate your app, while directing users experiencing bugs to the proper reporting channels. You can even use the SDK to offer promo codes or other incentives to users based on their response to a feedback survey. The SDK allows developers to reshape their users' in-app experience through direct feedback -- and the possibilities are endless.

#### Example - A Simple 5-Star Rating Survey
<img src=https://raw.githubusercontent.com/SurveyMonkey/surveymonkey-ios-sdk/master/images/intercept.png  width=220 height=400 />
<img src=https://raw.githubusercontent.com/SurveyMonkey/surveymonkey-ios-sdk/master/images/sample_survey.png  width=220 height=400 />
<img src=https://raw.githubusercontent.com/SurveyMonkey/surveymonkey-ios-sdk/master/images/positive_feedback.png  width=220 height=400 />

Checkout our [API reference](http://surveymonkey.github.io/surveymonkey-ios-sdk/) for more information about specific features and classes.

We strive to fix bugs and add new features as quickly as possible. Please watch our Github repo to stay up to date.

To download the SDK, either clone the SDK
```bash
git clone https://github.com/SurveyMonkey/surveymonkey-ios-sdk.git
```
Or download the [latest release](https://github.com/SurveyMonkey/surveymonkey-ios-sdk/releases)

*Note:* We'll be adding cocoapods integration in the coming months


### Setting up your SDK Collector

To use the SurveyMonkey Feedback SDK, you must first create a survey on [ SurveyMonkey.com](https://www.surveymonkey.com).

1. Once you have created your SurveyMonkey survey, navigate to the **Collect** tab and select **+ New Collector > SDK** from the menu on the righthand side.
2. Click **Generate** - The code you generate is your **Survey Hash**, you'll use this to point the SDK to your survey in the steps below.

### Integrating with XCode

1. In the project navigation sidebar, right-click on the **Frameworks** group and select **"Add files to [ProjectName]"**
2. Navigate to the **surveymonkey-ios-sdk** directory that is contained in your cloned version of the **surveymonkey-ios-sdk** and select the **SurveyMonkeyiOSSDK.framework** file
3. Make sure that **"Copy items if necessary"** is checked and all targets that will use the SDK are selected


That's it!

### Integrating the SurveyMonkey SDK with your app
For a detailed example, take a look at the **Simple Survey** sample project in our Github repo


#### Important
Usage of the respondent data returned by the SurveyMonkey Feedback SDK requires that your class implement <SMFeedbackDelegate> and the `– respondentDidEndSurvey:error:` method therein


The survey respondent data is returned as an SMResponse. Here's an example implementation of `- respondentDidEndSurvey:error:`:
```objc
- (void)respondentDidEndSurvey:(SMRespondent *)respondent error:(NSError *) error {
    if (respondent != nil) {
        SMQuestionResponse * questionResponse = respondent.questionResponses[0];
        NSString * questionID = questionResponse.questionID;
        if ([questionID isEqualToString:FEEDBACK_QUESTION_ID]) {
            SMAnswerResponse * answerResponse = questionResponse.answers[0];
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

#### Getting Started
1. `#import <SurveyMonkeyiOSSDK/SurveyMonkeyiOSSDK.h>`
2. Depending on your usage, add a property to your interface:
```objc
@property (nonatomic, strong) SMFeedbackViewController * feedbackController;
```
2. Initialize the SDK and set its delegate like so:
```objc
_feedbackController = [[SMFeedbackViewController alloc] initWithSurvey:{SAMPLE_SURVEY_HASH}];
_feedbackController.delegate = self;
```
If you are a **Platinum** user and want to include custom variables with each survey response, create a flat NSDictionary with your custom variables and use:
```objc
_feedbackController = [[SMFeedbackViewController alloc] initWithSurvey:{SAMPLE_SURVEY_HASH} andCustomVariables:{SAMPLE_CUSTOM_VARIABLES_DICTIONARY}];
```

#### The Intercept Modal
To kick off the SurveyMonkey Feedback SDK Intercept process, call:
```objc
[_feedbackController scheduleInterceptFromViewController:self withAppTitle:{SAMPLE_APP_NAME}];
```
from your main activity. This will check to see if the user should be prompted to take your survey (i.e. `if (timeSinceLastSurveyPrompt > maxTimeIntervalBetweenSurveyPrompts)`). The copy of the prompts, as well as the time intervals, can be customized, see our [docs](http://surveymonkey.github.io/surveymonkey-ios-sdk/) for more information.


#### Presenting a Survey to the User
To present a survey for the user to take, call
```objc
[_feedbackController presentFromViewController:self animated:YES completion:nil];
```

#### Issues and Bugs
Please submit any issues with the SDK to us via Github issues
