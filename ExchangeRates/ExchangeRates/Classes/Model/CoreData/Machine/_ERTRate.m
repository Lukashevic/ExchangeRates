// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ERTRate.m instead.

#import "_ERTRate.h"

const struct ERTRateAttributes ERTRateAttributes = {
	.date = @"date",
	.rateValue = @"rateValue",
};

const struct ERTRateRelationships ERTRateRelationships = {
	.currencyPair = @"currencyPair",
};

@implementation ERTRateID
@end

@implementation _ERTRate

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ERTRate" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ERTRate";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ERTRate" inManagedObjectContext:moc_];
}

- (ERTRateID*)objectID {
	return (ERTRateID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"rateValueValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"rateValue"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic date;

@dynamic rateValue;

- (double)rateValueValue {
	NSNumber *result = [self rateValue];
	return [result doubleValue];
}

- (void)setRateValueValue:(double)value_ {
	[self setRateValue:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveRateValueValue {
	NSNumber *result = [self primitiveRateValue];
	return [result doubleValue];
}

- (void)setPrimitiveRateValueValue:(double)value_ {
	[self setPrimitiveRateValue:[NSNumber numberWithDouble:value_]];
}

@dynamic currencyPair;

@end

