//
//  YLClientSpec.m
//  yelp-ios-api-v2
//
//  Created by Fabian Canas on 6/13/13.
//  Copyright (c) 2013 Fabian Canas. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YLClient.h"

@interface YLClientSpec : XCTestCase

@end

@implementation YLClientSpec

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)sharedInstanceSpec
{
    YLClient *client = [YLClient sharedInstance];
    XCTAssertTrue([client isKindOfClass:[TLClient Class]], @"YLClient sharedInstance did not return a client");
    YLClient *client2 = [YLClient sharedInstance];
    XCTAssertTrue(client == client2, @"YLClient sharedInstance is not returning singletons");
}

@end
