//
//  newsTimeLineViewController.h
//  miniGame
//
//  Created by BirdChiu on 13/9/27.
//
//

#import <UIKit/UIKit.h>
#import "TimelineView.h"
#import "WebJsonDataGetter.h"

@interface newsTimeLineViewController : UIViewController<WebJsonDataGetFinishDelegater>{
    WebJsonDataGetter *webGetter;
    NSMutableArray *data;
}
//- (IBAction)deleteButtonPush:(id)sender;
//- (IBAction)swapButtonPush:(id)sender;
//- (IBAction)insertTopButtonPush:(id)sender;
@property (nonatomic,strong)NSArray *Content;
@property (nonatomic, strong) NSArray *array_Items;
@property (weak, nonatomic) IBOutlet TimelineView *timelineView;
@property (nonatomic) NSInteger contentNumber;
@end


