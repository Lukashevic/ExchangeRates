// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ERTBaseCurrency.m instead.

#import "_ERTBaseCurrency.h"

const struct ERTBaseCurrencyAttributes ERTBaseCurrencyAttributes = {
	.date = @"date",
};

const struct ERTBaseCurrencyRelationships ERTBaseCurrencyRelationships = {
	.currencyPair = @"currencyPair",
	.rates = @"rates",
};

@implementation ERTBaseCurrencyID
@end

@implementation _ERTBaseCurrency

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ERTBaseCurrency" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ERTBaseCurrency";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ERTBaseCurrency" inManagedObjectContext:moc_];
}

- (ERTBaseCurrencyID*)objectID {
	return (ERTBaseCurrencyID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic date;

@dynamic currencyPair;

@dynamic rates;

- (NSMutableSet*)ratesSet {
	[self willAccessValueForKey:@"rates"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"rates"];

	[self didAccessValueForKey:@"rates"];
	return result;
}

@end

