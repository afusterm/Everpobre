#import "_AFMMapSnapshot.h"

@interface AFMMapSnapshot : _AFMMapSnapshot
@property (nonatomic, strong) UIImage *image;

+(instancetype) mapSnapshotForLocation:(AFMLocation *) location;

@end
