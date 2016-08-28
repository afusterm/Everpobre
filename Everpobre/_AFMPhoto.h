// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AFMPhoto.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class AFMNote;

@interface AFMPhotoID : NSManagedObjectID {}
@end

@interface _AFMPhoto : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) AFMPhotoID *objectID;

@property (nonatomic, strong) NSData* imageData;

@property (nonatomic, strong) AFMNote *notes;

@end

@interface _AFMPhoto (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitiveImageData;
- (void)setPrimitiveImageData:(NSData*)value;

- (AFMNote*)primitiveNotes;
- (void)setPrimitiveNotes:(AFMNote*)value;

@end

@interface AFMPhotoAttributes: NSObject 
+ (NSString *)imageData;
@end

@interface AFMPhotoRelationships: NSObject
+ (NSString *)notes;
@end

NS_ASSUME_NONNULL_END
