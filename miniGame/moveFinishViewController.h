//
//  moveFinishViewController.h
//  miniGame
//
//  Created by 吳承韋 on 13/9/13.
//
//


#import <UIKit/UIKit.h>

@interface moveFinishViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>{
    NSArray *array_Refrigerator;
    NSArray *origin_Refrigerator;
}
@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataArray;



@end
