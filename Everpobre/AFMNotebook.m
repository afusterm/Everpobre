#import "AFMNotebook.h"

@interface AFMNotebook ()

+(NSArray *) observableKeyNames;

@end

@implementation AFMNotebook

+(NSArray *) observableKeyNames {
    return @[@"creationDate", @"name", @"notes"];
}

+(instancetype) notebookWithName:(NSString *) name
                         context:(NSManagedObjectContext *) context {
    AFMNotebook *nb = [NSEntityDescription insertNewObjectForEntityForName:[AFMNotebook entityName]
                                                    inManagedObjectContext:context];
    nb.creationDate = [NSDate date];
    nb.modificationDate = [NSDate date];
    nb.name = name;
    
    return nb;
}

@end
