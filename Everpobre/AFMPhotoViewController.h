//
//  AFMPhotoViewController.h
//  Everpobre
//
//  Created by Alejandro on 21/08/16.
//  Copyright © 2016 Alejandro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFMDetailViewController.h"

@interface AFMPhotoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

-(id) initWithModel:(id) model;

- (IBAction)takePhoto:(id)sender;
- (IBAction)deletePhoto:(id)sender;

- (IBAction)applyVintageEffect:(id)sender;
- (IBAction)zoomToFace:(id)sender;
@end
