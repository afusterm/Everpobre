// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AFMMapSnapshot.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class AFMLocation;

@interface AFMMapSnapshotID : NSManagedObjectID {}
@end

@interface _AFMMapSnapshot : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) AFMMapSnapshotID *objectID;

@property (nonatomic, strong) NSData* snapshotData;

@property (nonatomic, strong) AFMLocation *location;

@end

@interface _AFMMapSnapshot (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitiveSnapshotData;
- (void)setPrimitiveSnapshotData:(NSData*)value;

- (AFMLocation*)primitiveLocation;
- (void)setPrimitiveLocation:(AFMLocation*)value;

@end

@interface AFMMapSnapshotAttributes: NSObject 
+ (NSString *)snapshotData;
@end

@interface AFMMapSnapshotRelationships: NSObject
+ (NSString *)location;
@end

NS_ASSUME_NONNULL_END
