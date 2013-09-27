//
//  procedureWithMPFlipViewController.h
//  miniGame
//
//  Created by BirdChiu on 13/9/24.
//
//

#import <UIKit/UIKit.h>
#import "MPFlipViewController.h"
#import "procedureStepViewController.h"
#import "WebJsonDataGetter.h"
@interface procedureWithMPFlipViewController : UIViewController<WebJsonDataGetFinishDelegater,MPFlipViewControllerDelegate, MPFlipViewControllerDataSource>{
    WebJsonDataGetter *webGetter;
}
@property (strong, nonatomic) MPFlipViewController *flipViewController;
@property (weak, nonatomic) IBOutlet UIView *corkboard;
@property (assign, nonatomic) int previousIndex;
@property (assign, nonatomic) int tentativeIndex;
@property (assign, nonatomic) BOOL observerAdded;
@property (nonatomic, strong) NSArray *array_Items;
@property (nonatomic) NSInteger step;


@end
