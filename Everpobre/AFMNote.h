#import "_AFMNote.h"

@interface AFMNote : _AFMNote {}

+(instancetype) noteWithName:(NSString *) name
                    notebook:(AFMNotebook *) notebook
                     context:(NSManagedObjectContext *) context;

@end
