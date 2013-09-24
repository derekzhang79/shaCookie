//
//  procedureWithMPFlipViewController.h
//  miniGame
//
//  Created by BirdChiu on 13/9/24.
//
//

#import <UIKit/UIKit.h>
#import "MPFlipViewController.h"
@interface procedureWithMPFlipViewController : UIViewController<MPFlipViewControllerDelegate, MPFlipViewControllerDataSource>
@property (strong, nonatomic) MPFlipViewController *flipViewController;
@property (weak, nonatomic) IBOutlet UIView *corkboard;
@property (assign, nonatomic) int previousIndex;
@property (assign, nonatomic) int tentativeIndex;
@property (assign, nonatomic) BOOL observerAdded;

@end
