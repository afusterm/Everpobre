//
//  AFMLocationViewController.m
//  Everpobre
//
//  Created by Alejandro on 30/08/16.
//  Copyright © 2016 Alejandro. All rights reserved.
//

#import "AFMLocationViewController.h"
#import "AFMLocation.h"

@interface AFMLocationViewController ()<MKMapViewDelegate>
@property (nonatomic, strong) AFMLocation *model;
@end

@implementation AFMLocationViewController

-(id) initWithLocation:(AFMLocation *) location {
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = location;
    }
    
    return self;
}

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Pasárselo a la mapView
    [self.mapView addAnnotation:self.model];
    
    // Región inicial
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.model.coordinate, 2000000, 2000000);
    [self.mapView setRegion:region];
}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Asignar region y animar
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.model.coordinate, 500, 500);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.mapView setRegion:region
                       animated:YES];
    });
}

#pragma mark - Actions

- (IBAction)standardMap:(id)sender {
    self.mapView.mapType = MKMapTypeStandard;
}

- (IBAction)satelliteMap:(id)sender {
    self.mapView.mapType = MKMapTypeSatellite;
}

- (IBAction)hybridMap:(id)sender {
    self.mapView.mapType = MKMapTypeHybrid;
}

#pragma mark - MKMapViewDelegate

@end
