// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AFMLocation.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class AFMNote;

@interface AFMLocationID : NSManagedObjectID {}
@end

@interface _AFMLocation : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) AFMLocationID *objectID;

@property (nonatomic, strong, nullable) NSString* address;

@property (nonatomic, strong, nullable) NSNumber* latitude;

@property (atomic) double latitudeValue;
- (double)latitudeValue;
- (void)setLatitudeValue:(double)value_;

@property (nonatomic, strong, nullable) NSNumber* longitude;

@property (atomic) double longitudeValue;
- (double)longitudeValue;
- (void)setLongitudeValue:(double)value_;

@property (nonatomic, strong) NSSet<AFMNote*> *notes;
- (NSMutableSet<AFMNote*>*)notesSet;

@end

@interface _AFMLocation (NotesCoreDataGeneratedAccessors)
- (void)addNotes:(NSSet<AFMNote*>*)value_;
- (void)removeNotes:(NSSet<AFMNote*>*)value_;
- (void)addNotesObject:(AFMNote*)value_;
- (void)removeNotesObject:(AFMNote*)value_;

@end

@interface _AFMLocation (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveAddress;
- (void)setPrimitiveAddress:(NSString*)value;

- (NSNumber*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSNumber*)value;

- (double)primitiveLatitudeValue;
- (void)setPrimitiveLatitudeValue:(double)value_;

- (NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber*)value;

- (double)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(double)value_;

- (NSMutableSet<AFMNote*>*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet<AFMNote*>*)value;

@end

@interface AFMLocationAttributes: NSObject 
+ (NSString *)address;
+ (NSString *)latitude;
+ (NSString *)longitude;
@end

@interface AFMLocationRelationships: NSObject
+ (NSString *)notes;
@end

NS_ASSUME_NONNULL_END
