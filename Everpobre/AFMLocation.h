#import "_AFMLocation.h"

@import CoreLocation;

@class AFMNote;

@interface AFMLocation : _AFMLocation
+(instancetype) locationWithCLLocation:(CLLocation *) location
                               forNote:(AFMNote *) note;
@end
