/*
 * Copyright (C) SurveyMonkey
 */

#import "SMJSONSerializable.h"

/**
 *  The SMQuestionResponse object represents a complete response to a given survey question
 *
 *  The SMQuestionResponse object includes relevant question attributes as well as an array of 
 *  SMAnswerResponse objects representing representing the respondent's answer(s) to this question.
 */
@interface SMQuestionResponse : NSObject<SMJSONSerializableProtocol>
/** @name Question Attributes */

/** ID of page where this question is located */
@property (nonatomic, strong) NSString *pageID;

/** Index of page where this question is located (starting at 0)*/
@property (nonatomic, assign) NSUInteger pageIndex;

/** ID of question that was answered */
@property (nonatomic, strong) NSString *questionID;

/** Global index of question in survey */
@property (nonatomic, assign) NSUInteger questionSurveyIndex;

/** Index of question within its page (starting at 0) */
@property (nonatomic, assign) NSUInteger questionPageIndex;

/** Question Prompt - for example "How old are you" */
@property (nonatomic, strong) NSString *questionValue;

/** @name Question Responses */

/** Array of SMAnswerResponse objects representing the
 respondent's answer to this question*/
@property (nonatomic, strong) NSArray *answers;

@end
