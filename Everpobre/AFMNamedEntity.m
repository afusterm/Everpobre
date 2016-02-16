#import "AFMNamedEntity.h"

@interface AFMNamedEntity ()

+(NSArray *) observableKeyNames;

@end

@implementation AFMNamedEntity

#pragma mark - KVO

+(NSArray *) observableKeyNames {
    return @[@"creationDate", @"name"];
}

-(void) setupKVO {
    for (NSString *key in [[self class] observableKeyNames]) {
        [self addObserver:self
               forKeyPath:key
                  options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  context:NULL];
    }
}

-(void) tearDownKVO {
    for (NSString *key in [[self class] observableKeyNames]) {
        [self removeObserver:self
                  forKeyPath:key];
    }
}

-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context {
    self.modificationDate = [NSDate date];
}

#pragma mark - Lifecycle

// será llamado cuando sea creado
-(void) awakeFromInsert {
    [super awakeFromInsert];
    [self setupKVO];
}

// será llamado cuando sea creado o cuando vuelva del estado de fault
-(void) awakeFromFetch {
    [super awakeFromFetch];
    [self setupKVO];
}

-(void) willTurnIntoFault {
    [super willTurnIntoFault];
    [self tearDownKVO];
}


@end
