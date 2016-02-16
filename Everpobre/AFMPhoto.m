#import "AFMPhoto.h"

@interface AFMPhoto ()

// Private interface goes here.

@end

@implementation AFMPhoto

#pragma mark - Properties

-(void) setImage:(UIImage *)image {
    // sincronizar con imageData
    self.imageData = UIImageJPEGRepresentation(image, 0.9);
}

-(UIImage*) image {
    return [UIImage imageWithData:self.imageData];
}

#pragma mark - Class methods

+(instancetype) photoWithImage:(UIImage *) image
                       context:(NSManagedObjectContext *) context {
    AFMPhoto *p = [NSEntityDescription insertNewObjectForEntityForName:[AFMPhoto entityName]
                                                inManagedObjectContext:context];
    p.imageData = UIImageJPEGRepresentation(image, 0.9);
    
    return p;
}

@end
