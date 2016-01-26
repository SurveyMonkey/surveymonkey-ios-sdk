/*
 * Copyright (C) SurveyMonkey
 */

#import <Foundation/Foundation.h>

//Server Error Codes
#define ERROR_CODE_TOKEN 1
#define ERROR_CODE_BAD_CONNECTION 2
#define ERROR_CODE_RESPONSE_PARSE_FAILED 3
#define ERROR_CODE_COLLECTOR_CLOSED 4
#define ERROR_CODE_RETRIEVING_RESPONSE 5
#define ERROR_CODE_SURVEY_DELETED 6
#define ERROR_CODE_RESPONSE_LIMIT_HIT 7
#define ERROR_CODE_RESPONDENT_EXITED_SURVEY 8
#define ERROR_CODE_NONEXISTENT_LINK 9
#define ERROR_CODE_INTERNAL_SERVER_ERROR 10

//Client Error Codes
#define ERROR_CODE_USER_CANCELED 1


@interface SMError : NSError

+ (SMError *)sdkServerErrorFromCode:(NSInteger)statusCode errorObject:(NSError *) error;

+ (SMError *)sdkClientErrorFromCode:(NSInteger)statusCode errorObject:(NSError *) error;

@end
