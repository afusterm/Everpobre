//
//  AGTNoteTableViewController.h
//  Everpobre
//
//  Created by Fernando Rodríguez Romero on 19/06/14.
//  Copyright (c) 2014 Agbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "AFMDetailViewController.h"

@class AFMNote;

@interface AGTNoteTableViewController : UITableViewController<AFMDetailViewController>

-(id) initWithModel:(AFMNote*) model
              style:(UITableViewStyle) style;

@end
