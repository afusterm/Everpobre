#import "_AFMNotebook.h"

@interface AFMNotebook : _AFMNotebook {}

+(instancetype) notebookWithName:(NSString *) name
                         context:(NSManagedObjectContext *) context;

@end
