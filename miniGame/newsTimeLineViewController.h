//
//  newsTimeLineViewController.h
//  miniGame
//
//  Created by BirdChiu on 13/9/27.
//
//

#import <UIKit/UIKit.h>
#import "TimelineView.h"


@interface newsTimeLineViewController : UIViewController{
    NSMutableArray *data;
}

//- (IBAction)deleteButtonPush:(id)sender;
//- (IBAction)swapButtonPush:(id)sender;
//- (IBAction)insertTopButtonPush:(id)sender;

@property (weak, nonatomic) IBOutlet TimelineView *timelineView;
@end


