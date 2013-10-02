//
//  materialViewController.h
//  miniGame
//
//  Created by 趴特萬 on 13/5/22.
//
//
#import <UIKit/UIKit.h>
#import "Recipes.h"
#import "RecipeInfo.h"
#import "ASIHTTPRequest.h"

@interface materialViewController : UIViewController<RecipeInFoDelegate>{
    RecipeInfo *myRecipe;
    ASIHTTPRequest *asiRequest;
}
@property (strong, nonatomic) IBOutlet UILabel *label_Name;
- (IBAction)time_out:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UILabel *time;
@property(strong, nonatomic)NSDictionary *dictionary_Cook;
@property (strong, nonatomic)Recipes *rec;
@property(strong, nonatomic)NSTimer *timer;
@property (nonatomic) int  min;
@property (nonatomic) int  sec;
@property (nonatomic) int  minSec;
@property (nonatomic) int  nowTime;
@property (nonatomic) int  lastTime;
@end
