//
//  YLLocalSearch.m
//  yelp-ios-api-v2
//
//  Created by Fabian Canas on 6/13/13.
//  Copyright (c) 2013 Fabian Canas. All rights reserved.
//

#import "YLLocalSearch.h"
#import "YLClient.h"
#import <CoreLocation/CoreLocation.h>

@implementation YLLocalSearch

- (instancetype)initWithMap:(MKMapView *)mapView
{
    self = [super init];
    if (self == nil) {
        return nil;
    }
    
    _mapView = mapView;
    
    return self;
}

- (void)localSearchWithTerm:(NSString *)searchTerm
                    success:(void(^)(NSArray* results)) success
                    failure:(void(^)(NSError* error)) failure
{
    YLClient *client = [YLClient sharedInstance];
    
    NSMutableDictionary *paramDictionary = [[self boundingBoxFromMapRect] mutableCopy];
    [paramDictionary addEntriesFromDictionary:@{@"term": searchTerm}];
    
    [client getPath:@"search" parameters:paramDictionary
            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                success?success(responseObject):0;
            }
            failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                failure?failure(error):0;
            }];
}

- (NSDictionary *)boundingBoxFromMapRect
{
    {
        MKMapRect mapRect = _mapView.visibleMapRect;
        CLLocationCoordinate2D nw = MKCoordinateForMapPoint(mapRect.origin);

        MKMapPoint southEastMapPoint = (MKMapPoint) { .x = mapRect.origin.x + mapRect.size.width, .y = mapRect.origin.y + mapRect.size.height };
        CLLocationCoordinate2D se = MKCoordinateForMapPoint(southEastMapPoint);
        
        CLLocationCoordinate2D sw = CLLocationCoordinate2DMake(se.latitude, nw.longitude);
        CLLocationCoordinate2D ne = CLLocationCoordinate2DMake(nw.latitude, se.longitude);
        
        return @{@"bounds": [NSString stringWithFormat:@"%f,%f|%f,%f",sw.latitude,sw.longitude,ne.latitude,ne.longitude]};
    }
}

@end
