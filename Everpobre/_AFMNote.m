// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AFMNote.m instead.

#import "_AFMNote.h"

const struct AFMNoteAttributes AFMNoteAttributes = {
	.text = @"text",
};

const struct AFMNoteRelationships AFMNoteRelationships = {
	.notebook = @"notebook",
	.photo = @"photo",
};

@implementation AFMNoteID
@end

@implementation _AFMNote

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Note";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Note" inManagedObjectContext:moc_];
}

- (AFMNoteID*)objectID {
	return (AFMNoteID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic text;

@dynamic notebook;

@dynamic photo;

@end

