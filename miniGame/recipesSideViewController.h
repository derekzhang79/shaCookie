//
//  recipesSideViewController.h
//  miniGame
//
//  Created by BirdChiu on 13/9/20.
//
//

#import <UIKit/UIKit.h>
#import "RecipeInfo.h"
#import "ASIHTTPRequest.h"

@interface recipesSideViewController : UITableViewController<RecipeInFoDelegate>{
    RecipeInfo *recipes;
    ASIHTTPRequest *asiRequest;
}

@property (strong,nonatomic)NSDictionary *dictionary_RecipesMenu;
@property(strong,nonatomic)NSArray *array_RecipesMenu;


@end
