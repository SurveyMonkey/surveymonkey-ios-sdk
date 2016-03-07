/*
 * Copyright (C) SurveyMonkey
 */

#import "SMJSONSerializable.h"
/**
 *  An enumeration for the two possible survey completion statuses
 */
typedef NS_ENUM(NSUInteger, SMCompletionStatus) {
    /**
     *  Survey completion status for when a survey has been only partially completed by the user.
     */
    SMCompletionStatusPartiallyComplete,
    /**
     *  Survey completion status for when a survey has been completed by the user.
     */
    SMCompletionStatusComplete
};

/**
 *  The SMRespondent object represents a single survey respondent and is returned when a user successfully ends a survey.
 *
 *  The SMRespondent object includes relevant metadata, e.g. survey completion status, as well as an array of SMQuestionResponse objects representing that respondent's response to the given survey.
 */
@interface SMRespondent : NSObject<SMJSONSerializableProtocol>
/** @name Response Attributes */

/** Denotes whether respondent has gone through all pages.  If they've only gone
 through a subset of pages, completionStatus will be SMCompletionStatusPartiallyComplete*/
@property (nonatomic, assign) SMCompletionStatus completionStatus;

/** Date respondent last updated their response */
@property (nonatomic, strong) NSDate * dateModified;

/** Date on which respondent started survey (when respondent was created) */
@property (nonatomic, strong) NSDate *dateStarted;

/** ID for respondent */
@property (nonatomic, strong) NSString *respondentID;

/** @name Response Data */


/** Array of SMQuestionResponse objects representing this respondent's response
 to the survey */
@property (nonatomic, strong) NSArray *questionResponses;
@end
