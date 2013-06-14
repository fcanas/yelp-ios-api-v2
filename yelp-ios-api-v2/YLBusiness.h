//
//  YLBusiness.h
//  yelp-ios-api-v2
//
//  Created by Fabian Canas on 6/14/13.
//  Copyright (c) 2013 Fabian Canas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface YLBusiness : NSObject <MKAnnotation>

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSValue *is_closed;
@property (nonatomic, strong) NSValue *is_claimed;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *image_url;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *mobile_url;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *display_phone;
@property (nonatomic, strong) NSNumber *review_count;
@property (nonatomic, strong) NSArray *categories;
@property (nonatomic, strong) NSNumber *rating;
@property (nonatomic, strong) NSString *snippet_text;
@property (nonatomic, strong) NSString *snippet_image_url;
@property (nonatomic, strong) NSDictionary *location;



@end
