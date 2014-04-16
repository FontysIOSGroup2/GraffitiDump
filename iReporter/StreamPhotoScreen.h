//
//  StreamPhotoScreen.h
//  GraffitiDump
//
//

#import <UIKit/UIKit.h>
#import "PhotoView.h"

@interface StreamPhotoScreen : UIViewController <PhotoViewDelegate>
{
    //just the photo view and the photo title
    IBOutlet UIImageView* photoView;
    IBOutlet UILabel* lblTitle;
}

@property (strong, nonatomic) NSNumber* IdPhoto;
- (IBAction)selectMapButton:(id)sender;

@end
