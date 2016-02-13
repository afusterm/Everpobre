// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AFMNamedEntity.m instead.

#import "_AFMNamedEntity.h"

const struct AFMNamedEntityAttributes AFMNamedEntityAttributes = {
	.creationDate = @"creationDate",
	.modificationDate = @"modificationDate",
	.name = @"name",
};

@implementation AFMNamedEntityID
@end

@implementation _AFMNamedEntity

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"NamedEntity" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"NamedEntity";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"NamedEntity" inManagedObjectContext:moc_];
}

- (AFMNamedEntityID*)objectID {
	return (AFMNamedEntityID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic creationDate;

@dynamic modificationDate;

@dynamic name;

@end

