//
//  procedureWithMPFlipViewController.h
//  miniGame
//
//  Created by BirdChiu on 13/9/24.
//
//

#import <UIKit/UIKit.h>
#import "MPFlipViewController.h"
#import "WebJsonDataGetter.h"
#import "procedureStepViewController.h"
@interface procedureWithMPFlipViewController : UIViewController<MPFlipViewControllerDelegate, MPFlipViewControllerDataSource,WebJsonDataGetFinishDelegater>{
    WebJsonDataGetter *webGetter;
    NSString *recipe_Name;
}
@property (strong, nonatomic) MPFlipViewController *flipViewController;
@property (weak, nonatomic) IBOutlet UIView *corkboard;
@property (assign, nonatomic) int previousIndex;
@property (assign, nonatomic) int tentativeIndex;
@property (assign, nonatomic) BOOL observerAdded;
@property (nonatomic, strong) NSArray *array_Items;
//@property (strong ,nonatomic) NSString *recipe_Name;

@end
