 //
//  LoginScreen.m
//  GraffitiDump
//

#import "LoginScreen.h"
#import "UIAlertView+error.h"
#import "API.h"
#include <CommonCrypto/CommonDigest.h>

#define kSalt @"adlfu3489tyh2jnkLIUGI&%EV(&0982cbgrykxjnk8855"

@implementation LoginScreen
- (IBAction)dismissKeyboardUsername:(id)sender {
    [self resignFirstResponder];    
}

-(void)viewDidLoad {
    [super viewDidLoad];
    //load username!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *loadString = [defaults objectForKey:@"username"];
    [fldUsername setText:loadString];
    //focus on the username field / show keyboard
    [fldUsername becomeFirstResponder];
}

#pragma mark - View lifecycle

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)btnLoginRegisterTapped:(UIButton*)sender {
	//form fields validation
	if (fldUsername.text.length < 1) {
		[UIAlertView error:@"Enter username over 1 chars each."];
		return;
	}
    // username opslaan !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    NSString *saveString = fldUsername.text;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:saveString forKey:@"username"];
    [defaults synchronize];


	//check whether it's a login or register
	NSString* command = (sender.tag==1)?@"register":@"login";
	NSMutableDictionary* params =[NSMutableDictionary dictionaryWithObjectsAndKeys:command, @"command", fldUsername.text, @"username", nil];
	//make the call to the web API
	[[API sharedInstance] commandWithParams:params onCompletion:^(NSDictionary *json) {
		//result returned
		NSDictionary* res = [[json objectForKey:@"result"] objectAtIndex:0];
		if ([json objectForKey:@"error"]==nil && [[res objectForKey:@"IdUser"] intValue]>0) {
			[[API sharedInstance] setUser: res];
			[self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
			//show message to the user
			[[[UIAlertView alloc] initWithTitle:@"Logged in" message:[NSString stringWithFormat:@"Welcome %@",[res objectForKey:@"username"]] delegate:nil cancelButtonTitle:@"Close" otherButtonTitles: nil] show];
		} else {
			//error
			[UIAlertView error:[json objectForKey:@"error"]];
		}
	}];
    
    

}

@end
