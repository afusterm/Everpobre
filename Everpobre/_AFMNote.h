// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AFMNote.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

#import "AFMNamedEntity.h"

NS_ASSUME_NONNULL_BEGIN

@class AFMLocation;
@class AFMNotebook;
@class AFMPhoto;

@interface AFMNoteID : AFMNamedEntityID {}
@end

@interface _AFMNote : AFMNamedEntity
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) AFMNoteID *objectID;

@property (nonatomic, strong, nullable) NSString* text;

@property (nonatomic, strong, nullable) AFMLocation *location;

@property (nonatomic, strong) AFMNotebook *notebook;

@property (nonatomic, strong, nullable) AFMPhoto *photo;

@end

@interface _AFMNote (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (AFMLocation*)primitiveLocation;
- (void)setPrimitiveLocation:(AFMLocation*)value;

- (AFMNotebook*)primitiveNotebook;
- (void)setPrimitiveNotebook:(AFMNotebook*)value;

- (AFMPhoto*)primitivePhoto;
- (void)setPrimitivePhoto:(AFMPhoto*)value;

@end

@interface AFMNoteAttributes: NSObject 
+ (NSString *)text;
@end

@interface AFMNoteRelationships: NSObject
+ (NSString *)location;
+ (NSString *)notebook;
+ (NSString *)photo;
@end

NS_ASSUME_NONNULL_END
