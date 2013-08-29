//
//  ViewController.h
//  miniGame
//
//  Created by 趴特萬 on 13/3/27.
//
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "ASIHTTPRequest.h"
#import "RecipeInfo.h"
#import "JsonViewController.h"
#import "MBProgressHUD.h"
@interface ViewController : UIViewController<MBProgressHUDDelegate>{
    MBProgressHUD *HUD;
    CMMotionManager *motionManager;
}
@property (strong, nonatomic) IBOutlet UIImageView *image_star;
@property (strong, nonatomic) IBOutlet UIImageView *image_hole;
- (IBAction)button_Skip:(id)sender;
- (void)myTask;
- (void)myProgressTask;
- (void)myMixedTask;

@end