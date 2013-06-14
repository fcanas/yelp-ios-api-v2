# Yelp iOS API v2

This project is an iOS client that consumes the [Yelp search API v2](http://www.yelp.com/developers/documentation/v2/search_api). It is inspired by Apple's [`MKLocalSearch`](http://nshipster.com/mklocalsearch/), and exists to address the issue that the results from an `MKLocalSearch` are not fully inspectable models representing businesses. You can put them on a map; but if you want to know their business hours, or any of the nice Yelp data they have access to, you're out of luck.

## Status
Do not use this project. I began working on it on Thursday, June 13th. It is not ready for public consumption.

## TODO
* ~~OAuth~~
* ~~Search~~
* Model Objects
  * Search should return model objects
  * Model objects should be useful for displaying in an `MKMapView`
