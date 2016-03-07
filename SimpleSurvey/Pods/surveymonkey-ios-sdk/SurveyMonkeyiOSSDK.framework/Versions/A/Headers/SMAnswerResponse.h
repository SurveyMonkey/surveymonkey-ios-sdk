/*
 * Copyright (C) SurveyMonkey
 */

#import "SMJSONSerializable.h"
/**
 *  The SMAnswerResponse object represents a single answer to a survey question. A single survey question can have multiple SMAnswerResponse objects associated with it.
 */
@interface SMAnswerResponse : NSObject<SMJSONSerializableProtocol>
/** @name Text Response Answer Attribute */

/** Text response string */
@property (nonatomic, strong) NSString *textResponse;

/** @name Default Answer Attributes */

/** ID of row answered */
@property (nonatomic, strong) NSString *rowID;
/** Index of row in question's design*/
@property (nonatomic, assign) NSUInteger rowIndex;
/** User-facing text representing this row in the survey */
@property (nonatomic, strong) NSString *rowValue;

/** @name Matrix and Rating Answer Attributes */

/** ID of column answered */
@property (nonatomic, strong) NSString *columnID;
/** Index of column in question's design (going left to right) */
@property (nonatomic, assign) NSUInteger columnIndex;
/** User-facing text representing this column in the survey*/
@property (nonatomic, strong) NSString *columnValue;

/** @name Matrix-of-Dropdown Answer Attributes */

/** ID of choice in a column's dropdown*/
@property (nonatomic, strong) NSString *columnDropdownID;

/** Index of choice in a column's dropdown*/
@property (nonatomic, assign) NSUInteger columnDropdownIndex;

/** User-facing text representing this column's dropdown in the survey*/
@property (nonatomic, strong) NSString *columnDropdownValue;

@end
