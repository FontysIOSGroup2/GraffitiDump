//
//  StreamPhotoScreen.m
//  Graffiti Dump
//
//

#import "StreamPhotoScreen.h"
#import "API.h"
#import "MapScreen.h"
#import "PhotoView.h"


@implementation StreamPhotoScreen;
@synthesize IdPhoto;


-(void)viewDidLoad {
    //NSLog(@"id1%@", IdPhoto);
	API* api = [API sharedInstance];
	//load the caption of the selected photo
	[api commandWithParams:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"stream", @"command", IdPhoto,@"IdPhoto", nil] onCompletion:^(NSDictionary *json) {
		//show the text in the label
		NSArray* list = [json objectForKey:@"result"];
		NSDictionary* photo = [list objectAtIndex:0];
		lblTitle.text = [photo objectForKey:@"title"];
	}];
	//load the big size photo
	NSURL* imageURL = [api urlForImageWithId:IdPhoto isThumb:NO];
	[photoView setImageWithURL: imageURL];
   }

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (IBAction)selectMapButton:(id)sender {
    NSLog(@"Map button clicked");
    
    //I don't know what should I write here to connect my button to UIViewController**
    //when I added this line my process is terminated**
    
    [self performSegueWithIdentifier:@"selectMapButton" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString: @"selectMapButton"]){
        MapScreen* mapScreen = segue.destinationViewController;
        sender = IdPhoto;
        mapScreen.IdPhoto = sender;
    }
}

@end
