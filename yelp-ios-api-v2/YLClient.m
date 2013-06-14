//
//  YLClient.m
//  yelp-ios-api-v2
//
//  Created by Fabian Canas on 6/13/13.
//  Copyright (c) 2013 Fabian Canas. All rights reserved.
//

#import "YLClient.h"
#import <AFNetworking/AFJSONRequestOperation.h>
#import <GHKit/GHKit.h>
#import <CommonCrypto/CommonCrypto.h>

@implementation YLClient

static NSString *kYelpAPIURLString = @"http://api.yelp.com/v2";

+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    __strong static YLClient *_sharedClient = nil;
    dispatch_once(&once, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:kYelpAPIURLString]];
    });
    return _sharedClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    NSString *configPathString = [[NSBundle bundleForClass:[self class]] pathForResource:@"YelpKeys" ofType:@"plist"];
    NSDictionary *keys = [[NSDictionary alloc] initWithContentsOfFile:configPathString];
    
    self = [super initWithBaseURL:url key:keys[@"key"] secret:keys[@"secret"]];
    if (!self) {//BGZ8gI59MByMeTnOyYKFcg
        return nil;
    }
    self.accessToken = [[AFOAuth1Token alloc] initWithKey:keys[@"token"]
                                                   secret:keys[@"tokenSecret"]
                                                  session:nil
                                               expiration:[NSDate distantFuture]
                                                renewable:NO];
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	[self setDefaultHeader:@"Accept" value:@"application/json"];    
    
    return self;
}

//- (NSString *)hmacsha1:(NSString *)text key:(NSString *)secret {
//    NSData *secretData = [secret dataUsingEncoding:NSUTF8StringEncoding];
//    NSData *clearTextData = [text dataUsingEncoding:NSUTF8StringEncoding];
//    unsigned char result[20];
//	CCHmac(kCCHmacAlgSHA1, [secretData bytes], [secretData length], [clearTextData bytes], [clearTextData length], result);
//    
//    NSData *theData = [NSData dataWithBytes:result length:20];
//    
//    return [theData gh_base64];
//}



@end
