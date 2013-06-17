//
//  YLBusiness.m
//  yelp-ios-api-v2
//
//  Created by Fabian Canas on 6/14/13.
//  Copyright (c) 2013 Fabian Canas. All rights reserved.
//

#import "YLBusiness.h"
#import "YLClient.h"

@interface YLBusiness ()
@property (nonatomic, assign) BOOL isReady;
@property (nonatomic, assign) BOOL isFullyHydrated;
@property (nonatomic, strong) NSMutableDictionary *unassignedKeysDictionary;
@end

@implementation YLBusiness

+ (instancetype)businessWithId:(NSString *)yelpId
{
    YLBusiness *business = [[YLBusiness alloc] init];
    business.id = yelpId;
    [business hydrateFromYelpWithCompletion:nil];
        
    return business;
}

- (instancetype)init
{
    self = [super init];
    if (self == nil) {
        return nil;
    }
    
    _unassignedKeysDictionary = [@{} mutableCopy];
    
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)businessDictionary
{
    self = [self init];
    
    if (self == nil) {
        return nil;
    }
    
    NSError *e = nil;
    [self hydrateWithDictionary:businessDictionary error:&e];
    
    if (e) {
        if (self.id == nil || [self.id isEqualToString:@""]) {
            self = nil;
        }
    }
    
    return self;
}

- (void)hydrateWithDictionary:(NSDictionary *)businessDictionary error:(NSError **)errorRef
{
    @try {
        // Setting values for keys can be quite a bit faster than explicit enumeration
        [self setValuesForKeysWithDictionary:businessDictionary];
        self.isFullyHydrated = YES;
        self.isReady = YES;
    }
    @catch (NSException *exception) {
        
        
        NSLog(@"whoops");
        NSDictionary *errorDictionary = @{NSLocalizedDescriptionKey :
                                              @"Error hydrating Yelp business model object from dictionary representation.",
                                          NSLocalizedFailureReasonErrorKey:
                                              @"The dictionary contained a key that the model object does not code for"};
        
        *errorRef = [NSError errorWithDomain:@"Yelp iOS"
                                        code:-1
                                    userInfo:errorDictionary];
    }
    @finally {
        
    }
}

- (void)hydrateFromYelpWithCompletion:(void(^)(BOOL complete, NSError *error))completionBlock
{
    YLClient *yelp = [[YLClient alloc] init];
    NSString *resourcePath = [@"business" stringByAppendingPathComponent:self.id];
    [yelp getPath:resourcePath
       parameters:nil
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSError *hydrationError = nil;
              [self hydrateWithDictionary:responseObject
                                    error:&hydrationError];
              
              completionBlock?completionBlock(self.isFullyHydrated,hydrationError):0;
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              completionBlock?completionBlock(NO,error):0;
          }];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    [self.unassignedKeysDictionary setValue:value forUndefinedKey:key];
}

- (id)valueForUndefinedKey:(NSString *)key
{
    return [self.unassignedKeysDictionary valueForKey:key];
}

- (CLLocationCoordinate2D)coordinate
{
    //NSDictionary *coordinateDictionary = self.location[@"coordinate"];
    
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

- (NSString *)description
{
    return [NSString stringWithFormat:@"YLBusiness:(name: %@, id: %@)", self.name, self.id];
}

@end
