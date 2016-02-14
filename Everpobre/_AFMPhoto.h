// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AFMPhoto.h instead.

#import <CoreData/CoreData.h>

extern const struct AFMPhotoAttributes {
	__unsafe_unretained NSString *imageData;
} AFMPhotoAttributes;

extern const struct AFMPhotoRelationships {
	__unsafe_unretained NSString *notes;
} AFMPhotoRelationships;

@class AFMNote;

@interface AFMPhotoID : NSManagedObjectID {}
@end

@interface _AFMPhoto : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) AFMPhotoID* objectID;

@property (nonatomic, strong) NSData* imageData;

//- (BOOL)validateImageData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) AFMNote *notes;

//- (BOOL)validateNotes:(id*)value_ error:(NSError**)error_;

@end

@interface _AFMPhoto (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitiveImageData;
- (void)setPrimitiveImageData:(NSData*)value;

- (AFMNote*)primitiveNotes;
- (void)setPrimitiveNotes:(AFMNote*)value;

@end
