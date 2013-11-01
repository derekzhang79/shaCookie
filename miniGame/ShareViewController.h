//
//  ShareViewController.h
//  miniGame
//
//  Created by 吳承韋 on 13/10/16.
//
//

#import <UIKit/UIKit.h>
#import "WebJsonDataGetter.h"
#import "recipesWithICarouselViewController.h"
@interface ShareViewController : UIViewController<WebJsonDataGetFinishDelegater,UITextFieldDelegate  >
{
    IBOutlet UISlider *rank;
    WebJsonDataGetter *webGetter;
}
@property (strong, nonatomic) IBOutlet UILabel *recipeName;
- (IBAction)shareContent:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *rankNum;


@property (strong, nonatomic) IBOutlet UITextField *content;
- (IBAction)exitOut:(id)sender;
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil pushName:(NSString*)pushName recipeId:(NSString*)recipeId;
@property(strong,nonatomic) NSString *pushName;
@property(strong,nonatomic) NSString *recipeId;
@end
