#import "AFMNote.h"
#import "AFMLocation.h"

@interface AFMNote () <CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *locationManager;
+(NSArray *) observableKeyNames;
@end

@implementation AFMNote

@synthesize locationManager = _locationManager;

-(BOOL) hasLocation {
    return (self.location != nil);
}

+(NSArray *) observableKeyNames {
    return @[@"creationDate", @"name", @"notebook", @"photo", @"location"];
}


+(instancetype) noteWithName:(NSString *) name
                    notebook:(AFMNotebook *) notebook
                     context:(NSManagedObjectContext *) context {
    AFMNote *note = [NSEntityDescription insertNewObjectForEntityForName:[AFMNote entityName]
                                                  inManagedObjectContext:context];
    note.creationDate = [NSDate date];
    note.modificationDate = [NSDate date];
    note.notebook = notebook;
    note.name = name;
    
    return note;
}

#pragma mark - Init

-(void) awakeFromInsert {
    [super awakeFromInsert];
    
    // ver si hay permiso para acceder a la localización
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    if (((status == kCLAuthorizationStatusAuthorized) ||
        (status == kCLAuthorizationStatusNotDetermined)) &&
        [CLLocationManager locationServicesEnabled]) {
        // tenemos localización
        self.locationManager = [CLLocationManager new];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        [self.locationManager startUpdatingLocation];
        
        // Solo me interesan datos recientes
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self zapLocationManager];
        });
    }
}

#pragma mark - CLLocationManagerDelegate

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    // Lo paramos. Consume muchísima batería
    [self zapLocationManager];
    
    if (![self hasLocation]) {
        // Pillamos la útlima localización
        CLLocation *loc = [locations lastObject];
        
        // AFMLocation
        self.location = [AFMLocation locationWithCLLocation: loc
                                                    forNote:self];
    } else {
        NSLog(@"No deberíamos llegar nunca");
    }
}

-(void) zapLocationManager {
    [self.locationManager stopUpdatingLocation];
    self.locationManager.delegate = nil;
    self.locationManager = nil;
}

@end
