// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AFMNotebook.h instead.

#import <CoreData/CoreData.h>
#import "AFMNamedEntity.h"

extern const struct AFMNotebookRelationships {
	__unsafe_unretained NSString *notes;
} AFMNotebookRelationships;

@class AFMNote;

@interface AFMNotebookID : AFMNamedEntityID {}
@end

@interface _AFMNotebook : AFMNamedEntity {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) AFMNotebookID* objectID;

@property (nonatomic, strong) NSSet *notes;

- (NSMutableSet*)notesSet;

@end

@interface _AFMNotebook (NotesCoreDataGeneratedAccessors)
- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(AFMNote*)value_;
- (void)removeNotesObject:(AFMNote*)value_;

@end

@interface _AFMNotebook (CoreDataGeneratedPrimitiveAccessors)

- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;

@end
