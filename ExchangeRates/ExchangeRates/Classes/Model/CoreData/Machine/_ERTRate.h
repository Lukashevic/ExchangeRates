// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ERTRate.h instead.

#import <CoreData/CoreData.h>

extern const struct ERTRateAttributes {
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *rateValue;
} ERTRateAttributes;

extern const struct ERTRateRelationships {
	__unsafe_unretained NSString *currencyPair;
} ERTRateRelationships;

@class ERTCurrencyPair;

@interface ERTRateID : NSManagedObjectID {}
@end

@interface _ERTRate : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ERTRateID* objectID;

@property (nonatomic, strong) NSDate* date;

//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* rateValue;

@property (atomic) double rateValueValue;
- (double)rateValueValue;
- (void)setRateValueValue:(double)value_;

//- (BOOL)validateRateValue:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ERTCurrencyPair *currencyPair;

//- (BOOL)validateCurrencyPair:(id*)value_ error:(NSError**)error_;

@end

@interface _ERTRate (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;

- (NSNumber*)primitiveRateValue;
- (void)setPrimitiveRateValue:(NSNumber*)value;

- (double)primitiveRateValueValue;
- (void)setPrimitiveRateValueValue:(double)value_;

- (ERTCurrencyPair*)primitiveCurrencyPair;
- (void)setPrimitiveCurrencyPair:(ERTCurrencyPair*)value;

@end
