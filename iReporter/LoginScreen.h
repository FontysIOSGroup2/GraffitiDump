//
//  LoginScreen.h
//  GraffitiDump
//

#import <UIKit/UIKit.h>

@interface LoginScreen : UIViewController
{
    //the login form fields
    IBOutlet UITextField* fldUsername;
}

//action for when either button is pressed
-(IBAction)btnLoginRegisterTapped:(id)sender;

@end