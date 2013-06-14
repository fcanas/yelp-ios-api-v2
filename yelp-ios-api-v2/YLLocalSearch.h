//
//  YLLocalSearch.h
//  yelp-ios-api-v2
//
//  Created by Fabian Canas on 6/13/13.
//  Copyright (c) 2013 Fabian Canas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface YLLocalSearch : NSObject

@property (nonatomic, strong) MKMapView *mapView;

- (instancetype)initWithMap:(MKMapView *)mapView;

- (void)localSearchWithTerm:(NSString *)searchTerm
                    success:(void(^)(NSArray* results)) success
                    failure:(void(^)(NSError* error)) failure;

@end
