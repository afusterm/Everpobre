#import "_AFMNote.h"

@interface AFMNote : _AFMNote {}

@property (nonatomic, readonly) BOOL hasLocation;

+(instancetype) noteWithName:(NSString *) name
                    notebook:(AFMNotebook *) notebook
                     context:(NSManagedObjectContext *) context;

@end
