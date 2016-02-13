// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AFMNote.h instead.

#import <CoreData/CoreData.h>
#import "AFMNamedEntity.h"

extern const struct AFMNoteAttributes {
	__unsafe_unretained NSString *photo;
	__unsafe_unretained NSString *text;
} AFMNoteAttributes;

extern const struct AFMNoteRelationships {
	__unsafe_unretained NSString *notebook;
} AFMNoteRelationships;

@class AFMNotebook;

@interface AFMNoteID : AFMNamedEntityID {}
@end

@interface _AFMNote : AFMNamedEntity {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) AFMNoteID* objectID;

@property (nonatomic, strong) NSData* photo;

//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) AFMNotebook *notebook;

//- (BOOL)validateNotebook:(id*)value_ error:(NSError**)error_;

@end

@interface _AFMNote (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhoto;
- (void)setPrimitivePhoto:(NSData*)value;

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (AFMNotebook*)primitiveNotebook;
- (void)setPrimitiveNotebook:(AFMNotebook*)value;

@end
