//
//  AFMNotesViewController.h
//  Everpobre
//
//  Created by Alejandro on 18/08/16.
//  Copyright © 2016 Alejandro. All rights reserved.
//

#import "AGTCoreDataCollectionViewController.h"

@class AFMNotebook;

@interface AFMNotesViewController : AGTCoreDataCollectionViewController

@property (nonatomic, strong) AFMNotebook *notebook;

@end
