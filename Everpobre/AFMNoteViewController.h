//
//  AFMNoteViewController.h
//  Everpobre
//
//  Created by Alejandro on 19/08/16.
//  Copyright © 2016 Alejandro. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AFMDetailViewController.h"

@class AFMNote;

@interface AFMNoteViewController : UIViewController<AFMDetailViewController>
@property (weak, nonatomic) IBOutlet UILabel *modificationDateView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
