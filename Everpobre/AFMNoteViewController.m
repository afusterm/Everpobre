//
//  AFMNoteViewController.m
//  Everpobre
//
//  Created by Alejandro on 19/08/16.
//  Copyright © 2016 Alejandro. All rights reserved.
//

#import "AFMNoteViewController.h"
#import "AFMNote.h"
#import "AFMPhoto.h"

@interface AFMNoteViewController ()
@property (nonatomic, strong) AFMNote *model;
@end

@implementation AFMNoteViewController

#pragma mark - Init

-(id) initWithModel:(AFMNote *) model {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _model = model;
    }
    
    return self;
}

#pragma mark - View lifecycle

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // modelo -> vista
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterLongStyle;
    
    self.modificationDateView.text = [fmt stringFromDate:self.model.modificationDate];
    self.nameView.text = self.model.name;
    self.textView.text = self.model.text;
    
    UIImage *img = self.model.photo.image;
    if (!img) {
        img = [UIImage imageNamed:@"noImage.png"];
    }
    
    self.photoView.image = img;
}

-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // vista -> modelo
    self.model.text = self.textView.text;
    self.model.photo.image = self.photoView.image;
}

@end
