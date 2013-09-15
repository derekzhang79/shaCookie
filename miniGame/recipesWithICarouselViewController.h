//
//  recipesWithICarouselViewController.h
//  miniGame
//
//  Created by BirdChiu on 13/9/15.
//
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import "RecipeInfo.h"

@interface recipesWithICarouselViewController : UIViewController<RecipeInFoDelegate,iCarouselDataSource, iCarouselDelegate>{
    RecipeInfo *myRecipe;
}

@property (nonatomic, strong) IBOutlet iCarousel *carousel;
@property (nonatomic, strong) NSArray *items;


@end
