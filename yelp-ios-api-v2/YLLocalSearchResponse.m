//
//  YLLocalSearchResponse.m
//  yelp-ios-api-v2
//
//  Created by Fabian Canas on 6/14/13.
//  Copyright (c) 2013 Fabian Canas. All rights reserved.
//

#import "YLLocalSearchResponse.h"
#import "YLBusiness.h"

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
    
    NSMutableArray *a = [@[] mutableCopy];
    
    
    
    for (NSDictionary *bd in yelp[@"businesses"]) {
        YLBusiness *b = [[YLBusiness alloc] initWithDictionary:bd];
        [a addObject:b];
    }
    _businesses = [NSArray arrayWithArray:a];
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%d Businesses:\n %@",_businesses.count, _businesses];
}

@end
