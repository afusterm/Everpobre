//
//  AFMNotesTableViewController.h
//  Everpobre
//
//  Created by Alejandro on 5/3/16.
//  Copyright © 2016 Alejandro. All rights reserved.
//

#import "AGTCoreDataTableViewController.h"

@class AFMNotebook;

@interface AFMNotesTableViewController : AGTCoreDataTableViewController

-(id) initWithNotebook:(AFMNotebook *) notebook;

@end
