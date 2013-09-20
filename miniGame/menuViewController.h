//
//  menuViewController.h
//  miniGame
//
//  Created by 趴特萬 on 13/5/22.
//
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import "RecipeInfo.h"
#import "ASIHTTPRequest.h"
@interface menuViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UITabBarControllerDelegate,RecipeInFoDelegate>{
    CMMotionManager *motionManager;
    NSArray *array_Food;
    NSArray *origin_Food;
    NSMutableDictionary *mutableDictionary_SelectedFood;
    RecipeInfo *myRecipe;
    ASIHTTPRequest *asiRequest;

}
- (IBAction)button_StartMotion:(id)sender;
@property (strong,nonatomic)NSDictionary *dictionary_Material;
@property(strong,nonatomic)NSArray *array_Material;
@property (strong, nonatomic) IBOutlet UITableView *tableView_Food;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar_back;
@end
