//
//  YLMasterViewController.h
//  yelp-ios-api-v2
//
//  Created by Fabian Canas on 6/13/13.
//  Copyright (c) 2013 Fabian Canas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@class YLDetailViewController;

@interface YLMasterViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) YLDetailViewController *detailViewController;

@end
