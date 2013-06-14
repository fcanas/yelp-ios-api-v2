//
//  YLMasterViewController.m
//  yelp-ios-api-v2
//
//  Created by Fabian Canas on 6/13/13.
//  Copyright (c) 2013 Fabian Canas. All rights reserved.
//

#import "YLMasterViewController.h"

#import "YLDetailViewController.h"

@interface YLMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation YLMasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect searchBarFrame = (CGRect){.origin=CGPointZero, .size.width=320, .size.height=44};
    self.navigationItem.titleView = [[UISearchBar alloc] initWithFrame:searchBarFrame];
}

@end
