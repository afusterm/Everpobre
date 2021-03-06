// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AFMNamedEntity.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@interface AFMNamedEntityID : NSManagedObjectID {}
@end

@interface _AFMNamedEntity : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) AFMNamedEntityID *objectID;

@property (nonatomic, strong) NSDate* creationDate;

@property (nonatomic, strong) NSDate* modificationDate;

@property (nonatomic, strong) NSString* name;

@end

@interface _AFMNamedEntity (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCreationDate;
- (void)setPrimitiveCreationDate:(NSDate*)value;

- (NSDate*)primitiveModificationDate;
- (void)setPrimitiveModificationDate:(NSDate*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

@end

@interface AFMNamedEntityAttributes: NSObject 
+ (NSString *)creationDate;
+ (NSString *)modificationDate;
+ (NSString *)name;
@end

NS_ASSUME_NONNULL_END
