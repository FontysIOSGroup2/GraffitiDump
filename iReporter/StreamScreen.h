//
//  StreamScreen.h
//  GraffitiDump
//

#import <UIKit/UIKit.h>
#import "PhotoView.h"

@interface StreamScreen : UIViewController <PhotoViewDelegate> {
    IBOutlet UIBarButtonItem* btnCompose;
    IBOutlet UIBarButtonItem* btnRefresh;
    IBOutlet UIScrollView* listView;
}

//refresh the photo stream
-(IBAction)btnRefreshTapped;

@end
