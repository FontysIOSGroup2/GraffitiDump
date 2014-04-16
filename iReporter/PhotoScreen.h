//
//  PhotoScreen.h
//  GraffitiDump
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface PhotoScreen : UIViewController<UIImagePickerControllerDelegate, UIActionSheetDelegate, UITextFieldDelegate, UITextFieldDelegate, MKMapViewDelegate, CLLocationManagerDelegate>
{
    IBOutlet UIImageView* photo;
    IBOutlet UIBarButtonItem* btnAction;
    IBOutlet UITextField *fldTitle;
    IBOutlet UIBarButtonItem *btnCamera;
    IBOutlet UIBarButtonItem *btnUpload;
    IBOutlet UIImageView *IVMakePhoto;
}

@property (strong, nonatomic) CLLocationManager *locationManager;

//show the app menu 
-(IBAction)btnActionTapped:(id)sender;
- (IBAction)Camera:(id)sender;
- (IBAction)Upload:(id)sender;


@end
