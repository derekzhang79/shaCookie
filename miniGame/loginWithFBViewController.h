//
//  loginWithFBViewController.h
//  miniGame
//
//  Created by BirdChiu on 13/9/14.
//
//

#import <UIKit/UIKit.h>

@interface loginWithFBViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *label_WelcomeMessage;
@property (strong, nonatomic) IBOutlet UIButton *buttonLoginLogout;
@property (strong, nonatomic) IBOutlet UILabel *label_UserName;
@property (strong, nonatomic) IBOutlet UILabel *label_UserMail;
@property (strong, nonatomic) IBOutlet UILabel *label_UserGender;
@property (strong, nonatomic) IBOutlet UIImageView *imageView_UserImage;


- (void)updateView;
- (IBAction)button_SignUp:(id)sender;
@end
