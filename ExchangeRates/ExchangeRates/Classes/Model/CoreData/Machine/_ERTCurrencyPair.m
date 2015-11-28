// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ERTCurrencyPair.m instead.

#import "_ERTCurrencyPair.h"

const struct ERTCurrencyPairAttributes ERTCurrencyPairAttributes = {
	.baseCurrencyName = @"baseCurrencyName",
	.lastUpdate = @"lastUpdate",
	.selectedPair = @"selectedPair",
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

	if ([key isEqualToString:@"selectedPairValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"selectedPair"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic baseCurrencyName;

@dynamic lastUpdate;

@dynamic selectedPair;

- (BOOL)selectedPairValue {
	NSNumber *result = [self selectedPair];
	return [result boolValue];
}

- (void)setSelectedPairValue:(BOOL)value_ {
	[self setSelectedPair:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveSelectedPairValue {
	NSNumber *result = [self primitiveSelectedPair];
	return [result boolValue];
}

- (void)setPrimitiveSelectedPairValue:(BOOL)value_ {
	[self setPrimitiveSelectedPair:[NSNumber numberWithBool:value_]];
}

@dynamic transactionCurrencyName;

@dynamic exchangeRates;

- (NSMutableSet*)exchangeRatesSet {
	[self willAccessValueForKey:@"exchangeRates"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"exchangeRates"];

	[self didAccessValueForKey:@"exchangeRates"];
	return result;
}

@end

