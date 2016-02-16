#import "AFMNote.h"

@interface AFMNote ()

+(NSArray *) observableKeyNames;

@end

@implementation AFMNote

+(NSArray *) observableKeyNames {
    return @[@"creationDate", @"name", @"notebook", @"photo"];
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

@end
