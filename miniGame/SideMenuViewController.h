//
//  SideMenuViewController.h
//  MFSideMenuDemo
//
//  Created by Michael Frederick on 3/19/12.

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import "RecipeInfo.h"
#import "ASIHTTPRequest.h"

@interface SideMenuViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource,RecipeInFoDelegate>{
    
    RecipeInfo *myRecipe;
    ASIHTTPRequest *asiRequest;
    
}

@property (strong,nonatomic)NSDictionary *dictionary_RecipeMenu;
@property(strong,nonatomic)NSArray *array_RecipeMenu;


@end
