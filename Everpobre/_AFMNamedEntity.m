// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AFMNamedEntity.m instead.

#import "_AFMNamedEntity.h"

@implementation AFMNamedEntityID
@end

@implementation _AFMNamedEntity

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
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

@implementation AFMNamedEntityAttributes 
+ (NSString *)creationDate {
	return @"creationDate";
}
+ (NSString *)modificationDate {
	return @"modificationDate";
}
+ (NSString *)name {
	return @"name";
}
@end

