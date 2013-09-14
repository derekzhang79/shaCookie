//
//  loginWithFBViewController.m
//  miniGame
//
//  Created by BirdChiu on 13/9/14.
//
//

#import "loginWithFBViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "profileViewController.h"
#import "AppDelegate.h"
#import "JSONKit.h"


@interface loginWithFBViewController ()

@end

@implementation loginWithFBViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateView];
    
//    // Initialize a session object
//    FBSession *session = [[FBSession alloc] init];
//    // Set the active session
//    [FBSession setActiveSession:session];
//    // Open the session
//    [session openWithBehavior:FBSessionLoginBehaviorWithNoFallbackToWebView
//            completionHandler:^(FBSession *session,
//                                FBSessionState status,
//                                NSError *error) {
//                // Respond to session state changes,
//                // ex: updating the view
//            }];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    if (!appDelegate.session.isOpen) {
        // create a fresh session object
        appDelegate.session = [[FBSession alloc] init];
        
        // if we don't have a cached token, a call to open here would cause UX for login to
        // occur; we don't want that to happen unless the user clicks the login button, and so
        // we check here to make sure we have a token before calling open
        if (appDelegate.session.state == FBSessionStateCreatedTokenLoaded) {
            // even though we had a cached token, we need to login to make the session usable
            [FBSession openActiveSessionWithReadPermissions:@[@"basic_info", @"email",@"user_about_me",@"user_birthday",@"user_likes",@"user_friends"]
                                               allowLoginUI:YES
                                          completionHandler:^(FBSession *session,
                                                              FBSessionState status,
                                                              NSError *error) {
                                              [self updateView];
                                          }];
        }
    }
    
}

- (void)viewDidAppear:(BOOL)animated {
}

// FBSample logic
// main helper method to update the UI to reflect the current state of the session.
- (void)updateView {
    // get the app delegate, so that we can reference the session property
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];

    if (appDelegate.session.isOpen) {
        // valid account UI is shown whenever the session is open
        [self.buttonLoginLogout setTitle:@"Log out" forState:UIControlStateNormal];
        [FBRequestConnection startWithGraphPath:@"me" parameters:@{@"fields":@"email,name,gender,picture"} HTTPMethod:@"GET" completionHandler:^(FBRequestConnection *connection,id result,NSError *error) {
            [self.label_UserName setText:[result objectForKey:@"name"]];
            [self.label_UserMail setText:[result objectForKey:@"email"]];
            [self.label_UserGender setText:[result objectForKey:@"gender"]];
            [self.label_WelcomeMessage setText:@"WELCOME!!!"];
            NSString *profileImageURL = [[[result objectForKey:@"picture"]objectForKey:@"data"]objectForKey:@"url"];
            NSData *profileImageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:profileImageURL]];
            [self.imageView_UserImage setImage:[UIImage imageWithData:profileImageData]];
            
            

            
            //self.textNoteOrLink.text = [NSString stringWithFormat:@"%@", result];
        }];
    } else {
        // login-needed account UI is shown whenever the session is closed
        [self.buttonLoginLogout setTitle:@"Log in" forState:UIControlStateNormal];
        
        //[self.textNoteOrLink setText:@"Login to create a link to fetch account data"];
    }
}


// FBSample logic
// handler for button click, logs sessions in or out
- (IBAction)button_SignUp:(id)sender {
    // get the app delegate so that we can access the session property
        AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
        
        // this button's job is to flip-flop the session from open to closed
        if (appDelegate.session.isOpen) {
            // if a user logs out explicitly, we delete any cached token information, and next
            // time they run the applicaiton they will be presented with log in UX again; most
            // users will simply close the app or switch away, without logging out; this will
            // cause the implicit cached-token login to occur on next launch of the application
            [appDelegate.session closeAndClearTokenInformation];
            
        } else {
            if (appDelegate.session.state != FBSessionStateCreated) {
                // Create a new, logged out session.
                appDelegate.session = [[FBSession alloc] init];
            }
            
            // if the session isn't open, let's open it now and present the login UX to the user
            [appDelegate.session openWithCompletionHandler:^(FBSession *session,
                                                             FBSessionState status,
                                                             NSError *error) {
                // and here we make sure to update our UX according to the new session state
                [self updateView];
            }];
        }
}

#pragma mark Template generated code

- (void)viewDidUnload
{
    self.buttonLoginLogout = nil;
    self.label_UserGender =nil;
    self.label_UserMail = nil;
    self.label_UserName = nil;
    self.imageView_UserImage = nil;
    [self.label_WelcomeMessage setText:@"Login with FaceBook now!!!"];
    
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark -

@end
