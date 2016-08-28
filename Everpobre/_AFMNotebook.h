// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AFMNotebook.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

#import "AFMNamedEntity.h"

NS_ASSUME_NONNULL_BEGIN

@class AFMNote;

@interface AFMNotebookID : AFMNamedEntityID {}
@end

@interface _AFMNotebook : AFMNamedEntity
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) AFMNotebookID *objectID;

@property (nonatomic, strong, nullable) NSSet<AFMNote*> *notes;
- (nullable NSMutableSet<AFMNote*>*)notesSet;

@end

@interface _AFMNotebook (NotesCoreDataGeneratedAccessors)
- (void)addNotes:(NSSet<AFMNote*>*)value_;
- (void)removeNotes:(NSSet<AFMNote*>*)value_;
- (void)addNotesObject:(AFMNote*)value_;
- (void)removeNotesObject:(AFMNote*)value_;

@end

@interface _AFMNotebook (CoreDataGeneratedPrimitiveAccessors)

- (NSMutableSet<AFMNote*>*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet<AFMNote*>*)value;

@end

@interface AFMNotebookRelationships: NSObject
+ (NSString *)notes;
@end

NS_ASSUME_NONNULL_END
