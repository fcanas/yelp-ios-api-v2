//
//  YLLocalSearchResponse.h
//  yelp-ios-api-v2
//
//  Created by Fabian Canas on 6/14/13.
//  Copyright (c) 2013 Fabian Canas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface YLLocalSearchResponse : NSObject

@property (nonatomic, readonly) MKCoordinateRegion boundingRegion;
@property (nonatomic, readonly) NSArray *businesses;

@end
