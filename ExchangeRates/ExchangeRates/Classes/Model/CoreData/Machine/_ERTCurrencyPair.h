// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ERTCurrencyPair.h instead.

#import <CoreData/CoreData.h>

extern const struct ERTCurrencyPairAttributes {
	__unsafe_unretained NSString *baseCurrencyName;
	__unsafe_unretained NSString *transactionCurrencyName;
} ERTCurrencyPairAttributes;

extern const struct ERTCurrencyPairRelationships {
	__unsafe_unretained NSString *exchangeRates;
} ERTCurrencyPairRelationships;

@class ERTBaseCurrency;

@interface ERTCurrencyPairID : NSManagedObjectID {}
@end

@interface _ERTCurrencyPair : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ERTCurrencyPairID* objectID;

@property (nonatomic, strong) NSString* baseCurrencyName;

//- (BOOL)validateBaseCurrencyName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* transactionCurrencyName;

//- (BOOL)validateTransactionCurrencyName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *exchangeRates;

- (NSMutableSet*)exchangeRatesSet;

@end

@interface _ERTCurrencyPair (ExchangeRatesCoreDataGeneratedAccessors)
- (void)addExchangeRates:(NSSet*)value_;
- (void)removeExchangeRates:(NSSet*)value_;
- (void)addExchangeRatesObject:(ERTBaseCurrency*)value_;
- (void)removeExchangeRatesObject:(ERTBaseCurrency*)value_;

@end

@interface _ERTCurrencyPair (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveBaseCurrencyName;
- (void)setPrimitiveBaseCurrencyName:(NSString*)value;

- (NSString*)primitiveTransactionCurrencyName;
- (void)setPrimitiveTransactionCurrencyName:(NSString*)value;

- (NSMutableSet*)primitiveExchangeRates;
- (void)setPrimitiveExchangeRates:(NSMutableSet*)value;

@end
