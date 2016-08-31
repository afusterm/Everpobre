#import "AFMMapSnapshot.h"
#import "AFMLocation.h"

@interface AFMMapSnapshot ()

// Private interface goes here.

@end

@implementation AFMMapSnapshot

#pragma mark - Properties

-(UIImage *) image {
    return [UIImage imageWithData:self.snapshotData];
}

-(void) setImage:(UIImage *)image {
    self.snapshotData = UIImageJPEGRepresentation(image, 0.9);
}

#pragma mark - Class Names

+(instancetype) mapSnapshotForLocation:(AFMLocation *) location {
    AFMMapSnapshot *snap = [AFMMapSnapshot insertInManagedObjectContext:location.managedObjectContext];
    snap.location = location;
    
    return snap;
}

-(void) awakeFromInsert {
    [super awakeFromInsert];
    
    [self startObserving];
}

-(void) awakeFromFetch {
    [super awakeFromFetch];
    
    [self startObserving];
}

-(void) willTurnIntoFault {
    [super willTurnIntoFault];
    
    [self startObserving];
}

#pragma mark - KVO

-(void) startObserving {
    [self addObserver:self
           forKeyPath:@"location"
              options:NSKeyValueObservingOptionNew
              context:NULL];
}

-(void) stopObserving {
    [self removeObserver:self
              forKeyPath:@"location"];
}

-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context {
    // Recalculamos el mapsnapshot
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(self.location.latitudeValue,
                                                               self.location.longitudeValue);
    
    MKMapSnapshotOptions *options = [MKMapSnapshotOptions new];
    options.region = MKCoordinateRegionMakeWithDistance(center, 300, 300);
    options.mapType = MKMapTypeHybrid;
    options.size = CGSizeMake(150, 150);
    
    MKMapSnapshotter *shotter = [[MKMapSnapshotter alloc] initWithOptions:options];
    
    [shotter startWithCompletionHandler:^(MKMapSnapshot * _Nullable snapshot, NSError * _Nullable error) {
        if (!error) {
            // Sin error
            self.image = snapshot.image;
        } else {
            // Para evitar que se envíen notificaciones y se entre en un bucle infinito
            [self setPrimitiveLocation:nil];
            [self.managedObjectContext deleteObject:self];
        }
    }];
}

@end
