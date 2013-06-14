//
//  YLBusiness.m
//  yelp-ios-api-v2
//
//  Created by Fabian Canas on 6/14/13.
//  Copyright (c) 2013 Fabian Canas. All rights reserved.
//

#import "YLBusiness.h"

@implementation YLBusiness

- (CLLocationCoordinate2D)coordinate
{
    NSDictionary *coordinateDictionary = self.location[@"coordinate"];
    
    return CLLocationCoordinate2DMake(0, 0);
}

- (NSString *)title
{
    return self.name;
}

- (NSString *)subtitle
{
    return [NSString stringWithFormat:@"%d reviews on Yelp", [self.review_count integerValue]];
}

@end
