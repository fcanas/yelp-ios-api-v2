# Yelp iOS API v2

This project is an native iOS interface to the [Yelp API v2](http://www.yelp.com/developers/documentation/v2/overview). It is inspired by Apple's [`MKLocalSearch`](http://nshipster.com/mklocalsearch/), and exists to address the issue that the results from an `MKLocalSearch` are not fully inspectable models representing businesses. You can put them on a map; but if you want to know their business hours, or any of the nice Yelp data they have access to, you're out of luck.

## Status
Do not use this project. I began working on it on Thursday, June 13th. It is not ready for public consumption.

Work on this project has been stalled just three days in by Yelp [apparently removing Latitude and Longitude coordinates](https://groups.google.com/forum/?fromgroups#!topic/yelp-developer-support/SVoLQR9RiKo) from their business listings.

## Usage

### Add to Project with [CocoaPods](http://cocoapods.org/)

*This project is not yet available as a pod on the main CocoaPods repository. But it will be soon.*

1. Add `yelp-ios-api-v2` as a pod. 
2. Add a `YelpKeys.plist` to your project, and populate it with _your_ Yelp api keys. A sample, empty `YelpKeys.plist` file is included in this project. Keys are available by registering with Yelp and [requesting keys](http://www.yelp.com/developers/documentation/v2/authentication).

### Code

Here's a simple example of how you might perform a search with a map's bounds and display those results on the map.

    YLLocalSearch *search = [[YLLocalSearch alloc] initWithMap:_mapView];
    [search localSearchWithTerm:@"pizza"
                        success:^(YLLocalSearchResponse *results) {
                            [_mapView removeAnnotations:[_mapView annotations]];
                            [_mapView addAnnotations:[results businesses]];
                        }
                        failure:^(NSError *error) {
                            NSLog(@"Oh noes! %@",error);
                        }];

## TODO
* ~~OAuth~~
* ~~Search~~
* Model Objects
  * ~~Search should return model objects~~
  * Model objects should be useful for displaying in an `MKMapView`
* Locale Support
