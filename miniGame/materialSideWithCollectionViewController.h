//
//  materialSideWithCollectionViewController.h
//  miniGame
//
//  Created by 趴特萬 on 13/9/24.
//
//

#import <UIKit/UIKit.h>
#import "WebJsonDataGetter.h"
#import "ASIHTTPRequest.h"

@interface materialSideWithCollectionViewController : UICollectionViewController<UICollectionViewDelegate,UICollectionViewDataSource,WebJsonDataGetFinishDelegater,UICollectionViewDelegateFlowLayout>{
    NSMutableDictionary *mutableDictionary_Material;
    WebJsonDataGetter * webGetter;
    ASIHTTPRequest *asiRequest;
    
}
-(void)materialSearch:(NSString*)recipeType;
@property (strong, nonatomic) IBOutlet UICollectionView *collection_MaterialSide;
@property (strong,nonatomic)NSDictionary *dictionary_Material;
@property(strong,nonatomic)NSArray * array_Collection;

@end
