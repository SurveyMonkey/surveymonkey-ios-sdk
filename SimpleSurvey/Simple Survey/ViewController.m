/*
 * Copyright (C) SurveyMonkey
 */

#import "ViewController.h"
#import <SurveyMonkeyiOSSDK/SurveyMonkeyiOSSDK.h>

#define FEEDBACK_QUESTION_ID @"813797519"
#define FEEDBACK_FIVE_STARS_ROW_ID @"9082377273"
#define FEEDBACK_FOUR_STARS_ROW_ID @"9082377274"
#define SAMPLE_APP @"Sample App"
#define SURVEY_HASH @"LBQK27G"

//Set to Angry Birds 2 -- change to your app
#define APP_ID @"880047117"

@interface ViewController () <SMFeedbackDelegate>
@property (nonatomic, strong) SMFeedbackViewController * feedbackController;
@property (weak, nonatomic) IBOutlet UIButton *takeSurveyButton;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getFeedbackController];
    [[UINavigationBar appearance] setTintColor:[UIColor greenColor]];
    [_feedbackController scheduleInterceptFromViewController:self withAppTitle:SAMPLE_APP];
}

- (IBAction)didTapTakeSurvey:(id)sender {
    SMFeedbackViewController *feedbackViewController = [self getFeedbackController];
    [feedbackViewController presentFromViewController:self animated:YES completion:nil];
}

- (SMFeedbackViewController *)getFeedbackController {
    if (_feedbackController == nil) {
        /*
         * Initialize your SMFeedbackViewController like this, pass the survey code from your Mobile SDK Collector on SurveyMonkey.com
         */
        _feedbackController = [[SMFeedbackViewController alloc] initWithSurvey:SURVEY_HASH];
        /*
         * Setting the feedback controller's delegate allows you to detect when a user has completed your survey and to
         * capture and consume their response in the form of an SMRespondent object
         */
        _feedbackController.delegate = self;
    }
    return _feedbackController;
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
    self.feedbackController = nil;
    
}

- (void) showAlertWithBody:(NSString *)body hasRateButton:(BOOL)hasRateButton {
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Thanks for your feedback!", @"Heading for feedback prompt")
                                         message:body
                                         preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* cancel = [UIAlertAction
                        actionWithTitle:NSLocalizedString(@"Cancel", @"Title of cancel button on app store rating prompt")
                        style:UIAlertActionStyleCancel
                        handler:^(UIAlertAction * action)
                        {
                            // Respond to cancel button press.
                        }];
    
    UIAlertAction* rate = [UIAlertAction
                    actionWithTitle:NSLocalizedString(@"Rate Us", @"Title of rate us button on app store rating prompt")
                    style:UIAlertActionStyleDefault
                    handler:^(UIAlertAction * action)
                    {
                        // Respond to rate button press.
                        // (Note: This url will not open on a simulator. It must be run on a physical device.)
                        NSString *appStoreURL = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/apple-store/id%@", APP_ID];
                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appStoreURL] options:@{} completionHandler:nil];
                    }];
    
    [alertController addAction: cancel];
    
    if (hasRateButton) {
        [alertController addAction: rate];
    }
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
