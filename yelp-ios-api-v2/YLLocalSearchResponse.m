//
//  YLLocalSearchResponse.m
//  yelp-ios-api-v2
//
//  Created by Fabian Canas on 6/14/13.
//  Copyright (c) 2013 Fabian Canas. All rights reserved.
//

#import "YLLocalSearchResponse.h"

@interface YLLocalSearchResponse ()
@property (nonatomic, assign) MKCoordinateRegion boundingRegion;
@property (nonatomic, strong) NSArray *businesses;
@end

@implementation YLLocalSearchResponse

- (instancetype)initWithV2Dictionary:(NSDictionary *)yelp
{
    self = [super init];
    if (self == nil) {
        return nil;
    }
    
    _businesses = yelp[@"businesses"];
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@",_businesses];
}

@end
