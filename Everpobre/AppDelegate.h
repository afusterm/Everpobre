//
//  AppDelegate.h
//  Everpobre
//
//  Created by Alejandro on 13/2/16.
//  Copyright © 2016 Alejandro. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AGTSimpleCoreDataStack;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) AGTSimpleCoreDataStack *model;

@end

