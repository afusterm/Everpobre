// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AFMNotebook.m instead.

#import "_AFMNotebook.h"

@implementation AFMNotebookID
@end

@implementation _AFMNotebook

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Notebook" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Notebook";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Notebook" inManagedObjectContext:moc_];
}

- (AFMNotebookID*)objectID {
	return (AFMNotebookID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic notes;

- (NSMutableSet<AFMNote*>*)notesSet {
	[self willAccessValueForKey:@"notes"];

	NSMutableSet<AFMNote*> *result = (NSMutableSet<AFMNote*>*)[self mutableSetValueForKey:@"notes"];

	[self didAccessValueForKey:@"notes"];
	return result;
}

@end

@implementation AFMNotebookRelationships 
+ (NSString *)notes {
	return @"notes";
}
@end

