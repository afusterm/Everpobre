// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AFMPhoto.m instead.

#import "_AFMPhoto.h"

const struct AFMPhotoAttributes AFMPhotoAttributes = {
	.imageData = @"imageData",
};

const struct AFMPhotoRelationships AFMPhotoRelationships = {
	.notes = @"notes",
};

@implementation AFMPhotoID
@end

@implementation _AFMPhoto

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
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

