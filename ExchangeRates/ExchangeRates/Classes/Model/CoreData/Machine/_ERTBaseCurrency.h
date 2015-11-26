// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ERTBaseCurrency.h instead.

#import <CoreData/CoreData.h>

extern const struct ERTBaseCurrencyAttributes {
	__unsafe_unretained NSString *date;
} ERTBaseCurrencyAttributes;

extern const struct ERTBaseCurrencyRelationships {
	__unsafe_unretained NSString *newRelationship;
	__unsafe_unretained NSString *rates;
} ERTBaseCurrencyRelationships;

@class ERTCurrencyPair;
@class ERTRate;

@interface ERTBaseCurrencyID : NSManagedObjectID {}
@end

@interface _ERTBaseCurrency : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ERTBaseCurrencyID* objectID;

@property (nonatomic, strong) NSDate* date;

//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ERTCurrencyPair *newRelationship;

//- (BOOL)validateNewRelationship:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *rates;

- (NSMutableSet*)ratesSet;

@end

@interface _ERTBaseCurrency (RatesCoreDataGeneratedAccessors)
- (void)addRates:(NSSet*)value_;
- (void)removeRates:(NSSet*)value_;
- (void)addRatesObject:(ERTRate*)value_;
- (void)removeRatesObject:(ERTRate*)value_;

@end

@interface _ERTBaseCurrency (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;

- (ERTCurrencyPair*)primitiveNewRelationship;
- (void)setPrimitiveNewRelationship:(ERTCurrencyPair*)value;

- (NSMutableSet*)primitiveRates;
- (void)setPrimitiveRates:(NSMutableSet*)value;

@end
