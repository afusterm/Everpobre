// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AFMMapSnapshot.m instead.

#import "_AFMMapSnapshot.h"

@implementation AFMMapSnapshotID
@end

@implementation _AFMMapSnapshot

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"MapSnapshot" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"MapSnapshot";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"MapSnapshot" inManagedObjectContext:moc_];
}

- (AFMMapSnapshotID*)objectID {
	return (AFMMapSnapshotID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic snapshotData;

@dynamic location;

@end

@implementation AFMMapSnapshotAttributes 
+ (NSString *)snapshotData {
	return @"snapshotData";
}
@end

@implementation AFMMapSnapshotRelationships 
+ (NSString *)location {
	return @"location";
}
@end

