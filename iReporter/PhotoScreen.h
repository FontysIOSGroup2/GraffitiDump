//
//  PhotoScreen.h
//  iReporter
//
//  Created by Marin Todorov on 09/02/2012.
//  Copyright (c) 2012 Marin Todorov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoScreen : UIViewController<UIImagePickerControllerDelegate, UIActionSheetDelegate, UITextFieldDelegate>
{
    IBOutlet UIImageView* photo;
    IBOutlet UIBarButtonItem* btnAction;
    IBOutlet UITextField* fldTitle;
    IBOutlet UIBarButtonItem *btnCamera;
    IBOutlet UIBarButtonItem *btnUpload;
}

//show the app menu 
-(IBAction)btnActionTapped:(id)sender;
- (IBAction)Camera:(id)sender;
- (IBAction)Upload:(id)sender;


@end
