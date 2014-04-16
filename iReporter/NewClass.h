//
//  NewClass.h
//  GraffitiDump
//
//  Created by FHICT on 03/04/14.
//  
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>

@interface NewClass : NSObject <MKAnnotation> {
    CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subtitle;
}
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@end
