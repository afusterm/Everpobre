//
//  AFMLocationViewController.h
//  Everpobre
//
//  Created by Alejandro on 30/08/16.
//  Copyright © 2016 Alejandro. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AFMLocation;

@interface AFMLocationViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

-(id) initWithLocation:(AFMLocation *) location;

@end
