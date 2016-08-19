//
//  AFMNoteCellView.m
//  Everpobre
//
//  Created by Alejandro on 18/08/16.
//  Copyright © 2016 Alejandro. All rights reserved.
//

#import "AFMNoteCellView.h"
#import "AFMNote.h"
#import "AFMPhoto.h"

@interface AFMNoteCellView()
@property (strong, nonatomic) AFMNote *note;
@end

@implementation AFMNoteCellView

+(NSArray *) keys {
    return @[@"title", @"modificationDate", @"photo.image"];
}

-(void) observeNote:(AFMNote *) note {
    // Guardarla en la propiedad
    self.note = note;
    
    // Observar ciertas propiedades
    for (NSString *key in [AFMNoteCellView keys]) {
        [self.note addObserver:self
                    forKeyPath:key
                       options:NSKeyValueObservingOptionNew
                       context:NULL];
    }
    
    [self syncWithNote];
}

-(void) syncWithNote {
    // Configurar la celda
    self.titleView.text = self.note.name;
    
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterMediumStyle;
    self.modificationDateView.text = [fmt stringFromDate:self.note.modificationDate];
    
    UIImage *img;
    if (self.note.photo.image == nil) {
        img = [UIImage imageNamed:@"noImage.png"];
    } else {
        img = self.note.photo.image;
    }
    
    self.photoView.image = img;
}

-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context {
    [self syncWithNote];
}

-(void) prepareForReuse {
    self.note = nil;
    [self syncWithNote];
}

@end
