//
//  refViewController.h
//  miniGame
//
//  Created by 趴特萬 on 13/5/22.
//
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "WebJsonDataGetter.h"

@interface refViewController : UIViewController<WebJsonDataGetFinishDelegater,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>{
    NSArray *array_Refrigerator;
    NSArray *origin_Refrigerator;
    ASIHTTPRequest *asiRequest;
    WebJsonDataGetter *webGetter;
}
@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataArray;

@end
