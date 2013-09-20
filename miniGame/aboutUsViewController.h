//
//  aboutUsViewController.h
//  miniGame
//
//  Created by BirdChiu on 13/9/20.
//
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface aboutUsViewController : UIViewController<MFMailComposeViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UITextView *textView_Us;

- (IBAction)button_ContactUs:(id)sender;
- (IBAction)button_PromoteUs:(id)sender;
-(void)openActiveSessionWithPublishPermissionsOfFaceBook:(NSArray *)publishPermissions;
@end
