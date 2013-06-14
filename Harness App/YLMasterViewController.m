//
//  YLMasterViewController.m
//  yelp-ios-api-v2
//
//  Created by Fabian Canas on 6/13/13.
//  Copyright (c) 2013 Fabian Canas. All rights reserved.
//

#import "YLMasterViewController.h"
#import "YLDetailViewController.h"
#import "YLLocalSearch.h"
#import "YLLocalSearchResponse.h"



@interface YLMasterViewController () {
    NSMutableArray *_objects;
    MKMapView *_mapView;
}
@end

@implementation YLMasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_mapView];
    [_mapView setRegion:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(37, -122), 30, 30)];
    [_mapView setDelegate:self];
    
    CGRect searchBarFrame = (CGRect){.origin=CGPointZero, .size.width=320, .size.height=44};
    self.navigationItem.titleView = [[UISearchBar alloc] initWithFrame:searchBarFrame];
    
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    [[[YLLocalSearch alloc] initWithMap:_mapView] localSearchWithTerm:@"pizza"
                                                              success:^(YLLocalSearchResponse *results) {
                                                                  NSLog(@"%@",results);
                                                                  [_mapView removeAnnotations:[_mapView annotations]];
                                                                  [_mapView addAnnotations:[results businesses]];
                                                               }
                                                              failure:^(NSError *error) {
                                                                  NSLog(@"%@",error);
                                                              }];
}

@end
