// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AFMPhoto.m instead.

#import "_AFMPhoto.h"

@implementation AFMPhotoID
@end

@implementation _AFMPhoto

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Photo";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Photo" inManagedObjectContext:moc_];
}

- (AFMPhotoID*)objectID {
	return (AFMPhotoID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic imageData;

@dynamic notes;

@end

@implementation AFMPhotoAttributes 
+ (NSString *)imageData {
	return @"imageData";
}
@end

@implementation AFMPhotoRelationships 
+ (NSString *)notes {
	return @"notes";
}
@end

