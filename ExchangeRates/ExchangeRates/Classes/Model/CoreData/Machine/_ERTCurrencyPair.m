// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ERTCurrencyPair.m instead.

#import "_ERTCurrencyPair.h"

const struct ERTCurrencyPairAttributes ERTCurrencyPairAttributes = {
	.baseCurrencyName = @"baseCurrencyName",
	.transactionCurrencyName = @"transactionCurrencyName",
};

const struct ERTCurrencyPairRelationships ERTCurrencyPairRelationships = {
	.exchangeRates = @"exchangeRates",
};

@implementation ERTCurrencyPairID
@end

@implementation _ERTCurrencyPair

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ERTCurrencyPair" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ERTCurrencyPair";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ERTCurrencyPair" inManagedObjectContext:moc_];
}

- (ERTCurrencyPairID*)objectID {
	return (ERTCurrencyPairID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic baseCurrencyName;

@dynamic transactionCurrencyName;

@dynamic exchangeRates;

- (NSMutableSet*)exchangeRatesSet {
	[self willAccessValueForKey:@"exchangeRates"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"exchangeRates"];

	[self didAccessValueForKey:@"exchangeRates"];
	return result;
}

@end

