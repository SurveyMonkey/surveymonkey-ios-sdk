/*
 * Copyright (C) SurveyMonkey
 */

#import "ViewController.h"
#import <surveymonkey-ios-sdk/SurveyMonkeyiOSSDK/SurveyMonkeyiOSSDK.h>

#define FEEDBACK_QUESTION_ID @"813797519"
#define FEEDBACK_FIVE_STARS_ROW_ID @"9082377273"
#define FEEDBACK_FOUR_STARS_ROW_ID @"9082377274"
#define SAMPLE_APP @"Sample App"
#define SURVEY_HASH @"LBQK27G"

//Set to Angry Birds -- change to your app
#define APP_ID @"343200656"

@interface ViewController () <SMFeedbackDelegate, UIAlertViewDelegate>
@property (nonatomic, strong) SMFeedbackViewController * feedbackController;
@property (weak, nonatomic) IBOutlet UIButton *takeSurveyButton;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     * Initialize your SMFeedbackViewController like this, pass the survey code from your Mobile SDK Collector on SurveyMonkey.com
     */
    _feedbackController = [[SMFeedbackViewController alloc] initWithSurvey:SURVEY_HASH];
    /*
     * Setting the feedback controller's delegate allows you to detect when a user has completed your survey and to
     * capture and consume their response in the form of an SMRespondent object
     */
    _feedbackController.delegate = self;
    [[UINavigationBar appearance] setTintColor:[UIColor greenColor]];
    [_feedbackController scheduleInterceptFromViewController:self withAppTitle:SAMPLE_APP];
}
- (IBAction)didTapTakeSurvey:(id)sender {
    [_feedbackController presentFromViewController:self animated:YES completion:nil];
}

- (void)respondentDidEndSurvey:(SMRespondent *)respondent error:(NSError *) error {
    if (respondent != nil) {
        SMQuestionResponse * questionResponse = respondent.questionResponses[0];
        NSString * questionID = questionResponse.questionID;
        if ([questionID isEqualToString:FEEDBACK_QUESTION_ID]) {
            SMAnswerResponse * answerResponse = questionResponse.answers[0];
            NSString * rowID = answerResponse.rowID;
            if ([rowID isEqualToString:FEEDBACK_FIVE_STARS_ROW_ID] || [rowID isEqualToString:FEEDBACK_FOUR_STARS_ROW_ID]) {
                [self showAlertWithBody:NSLocalizedString(@"Please rate us in the app store!", @"") hasRateButton:YES];
            }
            else {
                [self showAlertWithBody:NSLocalizedString(@"We'll address the issues you encountered as quickly as possible!", @"") hasRateButton:NO];
            }
        }
    }
    else {
        /*
         * Handle error returned when a response is not successfully collected
         */
    }
    
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
    }
    else if(buttonIndex == 1)
    {
        NSString *appStoreURL = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@?mt=8", APP_ID];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appStoreURL]];
    }
}

- (void) showAlertWithBody:(NSString *)body hasRateButton:(BOOL)hasRateButton {
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:NSLocalizedString(@"Thanks for your feedback!", @"Heading for feedback prompt")
                                                     message:body
                                                    delegate:self
                                           cancelButtonTitle: NSLocalizedString(@"Cancel", @"Title of cancel button on app store rating prompt")
                                           otherButtonTitles: nil];
    if (hasRateButton) {
        [alert addButtonWithTitle:NSLocalizedString(@"Rate Us", @"Title of rate us button on app store rating prompt")];
    }
    [alert show];
}

@end
