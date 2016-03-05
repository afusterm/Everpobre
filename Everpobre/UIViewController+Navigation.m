//
//  UIViewController+Navigation.m
//  Everpobre
//
//  Created by Alejandro on 16/2/16.
//  Copyright © 2016 Alejandro. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)

-(UINavigationController *) wrappedInNavigation {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self];
    
    return nav;
}

@end
