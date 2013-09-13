//
//  refViewController.h
//  miniGame
//
//  Created by 趴特萬 on 13/5/22.
//
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "RecipeInfo.h"

@interface refViewController : UIViewController<RecipeInFoDelegate,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>{
    NSArray *array_Refrigerator;
    NSArray *origin_Refrigerator;
    RecipeInfo *myRecipe;
    ASIHTTPRequest *asiRequest;
}
@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataArray;

@end
