#import "AFMLocation.h"
#import "AFMNote.h"

@import AddressBookUI;

@interface AFMLocation ()

// Private interface goes here.

@end

@implementation AFMLocation

+(instancetype) locationWithCLLocation:(CLLocation *) location
                               forNote:(AFMNote *) note {
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[AFMLocation entityName]];
    NSPredicate *latitude = [NSPredicate predicateWithFormat:@"abs(latitude) - abs(%lf) < 0.001",
                             location.coordinate.latitude];
    NSPredicate *longitude = [NSPredicate predicateWithFormat:@"abs(longitude) - abs(%lf) < 0.001",
                              location.coordinate.longitude];
    req.predicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[latitude, longitude]];
    
    NSError *error = nil;
    NSArray *results = [note.managedObjectContext executeFetchRequest:req
                                                                error:&error];
    
    NSAssert(results, @"Error al buscar!");
    
    if (results.count) {
        // Aprovechamos la location que ya existe
        AFMLocation *found = [results lastObject];
        [found addNotesObject:note];
        
        return found;
    } else {
        // La creamos de cero
        AFMLocation *loc = [self insertInManagedObjectContext:note.managedObjectContext];
        loc.latitudeValue = location.coordinate.latitude;
        loc.longitudeValue = location.coordinate.longitude;
        [loc addNotesObject:note];
        
        // Dirección
        CLGeocoder *coder = [CLGeocoder new];
        [coder reverseGeocodeLocation:location
                    completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
                        if (error) {
                            NSLog(@"Error while obtaining address!\n%@", error);
                        } else {
                            loc.address = ABCreateStringWithAddressDictionary([[placemarks lastObject] addressDictionary], YES);
                            NSLog(@"Address is %@", loc.address);
                        }
                    }];
        
        return loc;
    }
}

@end
