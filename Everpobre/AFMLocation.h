#import "_AFMLocation.h"

@import CoreLocation;

@class AFMNote;

@interface AFMLocation : _AFMLocation<MKAnnotation>
+(instancetype) locationWithCLLocation:(CLLocation *) location
                               forNote:(AFMNote *) note;
@end
