#import "_AFMPhoto.h"
#import <UIKit/UIKit.h>

@interface AFMPhoto : _AFMPhoto {}

@property (nonatomic, strong) UIImage *image;

+(instancetype) photoWithImage:(UIImage *) image
                       context:(NSManagedObjectContext *) context;

@end
