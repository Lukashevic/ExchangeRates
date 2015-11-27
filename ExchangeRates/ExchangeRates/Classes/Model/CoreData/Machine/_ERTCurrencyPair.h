// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ERTCurrencyPair.h instead.

#import <CoreData/CoreData.h>

extern const struct ERTCurrencyPairAttributes {
	__unsafe_unretained NSString *baseCurrencyName;
	__unsafe_unretained NSString *selectedPair;
	__unsafe_unretained NSString *transactionCurrencyName;
} ERTCurrencyPairAttributes;

extern const struct ERTCurrencyPairRelationships {
	__unsafe_unretained NSString *exchangeRates;
} ERTCurrencyPairRelationships;

@class ERTRate;

@interface ERTCurrencyPairID : NSManagedObjectID {}
@end

@interface _ERTCurrencyPair : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ERTCurrencyPairID* objectID;

@property (nonatomic, strong) NSString* baseCurrencyName;

//- (BOOL)validateBaseCurrencyName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* selectedPair;

@property (atomic) BOOL selectedPairValue;
- (BOOL)selectedPairValue;
- (void)setSelectedPairValue:(BOOL)value_;

//- (BOOL)validateSelectedPair:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* transactionCurrencyName;

//- (BOOL)validateTransactionCurrencyName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *exchangeRates;

- (NSMutableSet*)exchangeRatesSet;

@end

@interface _ERTCurrencyPair (ExchangeRatesCoreDataGeneratedAccessors)
- (void)addExchangeRates:(NSSet*)value_;
- (void)removeExchangeRates:(NSSet*)value_;
- (void)addExchangeRatesObject:(ERTRate*)value_;
- (void)removeExchangeRatesObject:(ERTRate*)value_;

@end

@interface _ERTCurrencyPair (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveBaseCurrencyName;
- (void)setPrimitiveBaseCurrencyName:(NSString*)value;

- (NSNumber*)primitiveSelectedPair;
- (void)setPrimitiveSelectedPair:(NSNumber*)value;

- (BOOL)primitiveSelectedPairValue;
- (void)setPrimitiveSelectedPairValue:(BOOL)value_;

- (NSString*)primitiveTransactionCurrencyName;
- (void)setPrimitiveTransactionCurrencyName:(NSString*)value;

- (NSMutableSet*)primitiveExchangeRates;
- (void)setPrimitiveExchangeRates:(NSMutableSet*)value;

@end
