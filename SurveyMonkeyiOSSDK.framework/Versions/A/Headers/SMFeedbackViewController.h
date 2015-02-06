/*
 * Copyright (C) SurveyMonkey
 */

#import <UIKit/UIKit.h>
#import "SMRespondent.h"

/**
 *  The FeedbackDelegate protocol defines the methods a delegate of a SMFeedbackViewController object should implement.
 *  The delegate responds to the event of a respondent ending a survey-taking session. All of the methods defined in this protocol are optional.
 */
@protocol SMFeedbackDelegate <NSObject>

@optional
/** @name Responding to Events */


/**
  Sent to the delegate when a respondent ends a survey-taking session.
 
  @param respondent The respondent object returned when a survey is ended.
  @param error      The error object returned (see error codes below) -- will be nil if survey was completed successfully.
 
 
#Server Error Codes
 
  | Error                              |Code| Description                                                                               |
  |------------------------------------|:--:|:------------------------------------------------------------------------------------------|
  | ERROR_CODE_TOKEN                   | 1  | Could not retrieve your respondent. Be sure you're using an SDK Collector.                |
  | ERROR_CODE_BAD_CONNECTION          | 2  | There was an error connecting to the server.                                              |
  | ERROR_CODE_RESPONSE_PARSE_FAILED   | 3  | There was an error parsing the response from the server.                                  |
  | ERROR_CODE_COLLECTOR_CLOSED        | 4  | The collector for this survey has been closed.                                            |
  | ERROR_CODE_RETRIEVING_RESPONSE     | 5  | There was a problem retrieving the user's response to this survey.                        |
  | ERROR_CODE_SURVEY_DELETED          | 6  | This survey has been deleted.                                                             |
  | ERROR_CODE_RESPONSE_LIMIT_HIT      | 7  | Response limit exceeded for your plan. Upgrade to access more responses through the SDK.  |
  | ERROR_CODE_RESPONDENT_EXITED_SURVEY| 8  | The user canceled out of the survey.                                                      |
  | ERROR_CODE_NONEXISTENT_LINK        | 9  | Custom link no longer exists.                                                             |
  | ERROR_CODE_INTERNAL_SERVER_ERROR   | 10 | Internal server error                                                                     |
 
#Client Error Codes
 
 | Error                              |Code| Description                                                                               |
 |------------------------------------|:--:|:------------------------------------------------------------------------------------------|
 | ERROR_CODE_USER_CANCELED           |  1 | The user canceled out of the survey.                                                      |
 */
- (void)respondentDidEndSurvey:(SMRespondent *)respondent error:(NSError *) error;

@end

/**
 *  Use the SMFeedbackViewController class to present a survey to the user.
 *
 *  Use the properties and methods defined in this class to set the URL and delegate. You must set a delegate in order to respond to the respondentDidEndSurvey event.
 *  The delegate should conform to the FeedbackDelegate protocol. 
 *
 *  Other implementation details, such as how and when to display the SMFeedbackViewController, are left up to you.
 */
@interface SMFeedbackViewController : UIViewController

/** @name Initializing a SMFeedbackViewController Object */

/**
 *  Initialize the feedback view controller with the collectorHash from your Mobile SDK Collector
 *
 *  @param collectorHash The collector hash that points to your Mobile SDK Collector
 */

-(id)initWithSurvey:(NSString *) collectorHash;

/** @name Setting Properties */


/**
 *  The receiver’s delegate or nil if it doesn’t have a delegate.
 */
@property (nonatomic, weak) id<SMFeedbackDelegate> delegate;


/** @name Displaying the survey */

/**
 *  Display the SMFeedbackViewController to the user.
 *
 *  @param viewController The view controller from which to launch the SMFeedbackViewController
 *  @param flag Pass YES to animate the presentation; otherwise, pass NO.
 *  @param completion The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
 */
-(void)presentFromViewController:(UIViewController *)viewController animated: (BOOL)flag completion:(void (^)(void))completion;
@end
