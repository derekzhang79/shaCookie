//
//  materialMenuViewController.h
//  miniGame
//
//  Created by 趴特萬 on 13/9/19.
//
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import "RecipeInfo.h"
#import "ASIHTTPRequest.h"

@interface materialSideViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource,RecipeInFoDelegate>{
    
    RecipeInfo *myRecipe;
    ASIHTTPRequest *asiRequest;
    
}

@property (strong,nonatomic)NSDictionary *dictionary_MaterialMenu;
@property(strong,nonatomic)NSArray *array_MaterialMenu;


@end
