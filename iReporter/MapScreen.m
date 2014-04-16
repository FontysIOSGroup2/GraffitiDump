//
//  MapScreen.m
//  GraffitiDump
//
//  Created by FHICT on 27/03/14.

//

#import "MapScreen.h"
#import "NewClass.h"
#import "API.h"


@implementation MapScreen
@synthesize IdPhoto;


- (void)viewDidLoad
{
    [super viewDidLoad];
    //NSLog(@"id2%@", IdPhoto);
    //NSInteger value = [IdPhoto integerValue];
    //NSLog(@"value: %ld", (long)value);
    API* api = [API sharedInstance];
	//load the caption of the selected photo
	[api commandWithParams:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"stream", @"command", IdPhoto,@"IdPhoto", nil] onCompletion:^(NSDictionary *json) {
		//show the text in the label
		NSArray* list = [json objectForKey:@"result"];
		NSDictionary* photo = [list objectAtIndex:0];
        NSString *label = [photo objectForKey:@"title"];
        NSString *name = [photo objectForKey:@"username"];
        NSString *latitude = [photo objectForKey:@"latitude"];
        NSString *longitude = [photo objectForKey:@"longitude"];
        double latdouble = [latitude doubleValue];
        double londouble = [longitude doubleValue];
        NSLog(@"%f", latdouble);
        NSLog(@"%f", londouble);
        NSLog(@"@%@", name);

   
    
    
    [self.mapView setMapType:MKMapTypeHybrid];
    MKCoordinateRegion region = { {0.0, 0.0 }, {0.0, 0.0} };
    region.center.latitude = latdouble;
    region.center.longitude = londouble;
    region.span.longitudeDelta = 0.0f;
    region.span.latitudeDelta = 0.0f;
    [self.mapView setRegion:region animated:YES];
    NewClass *ann = [[NewClass alloc] init];
    ann.title = label;
    ann.subtitle = name;
    ann.coordinate = region.center;
    [self.mapView addAnnotation:ann];
     }];
    
    
}
- (void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    NSLog(@"%f", loc.latitude);
}

@end
