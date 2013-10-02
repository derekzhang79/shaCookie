//
//  SideMenuViewController.h
//  MFSideMenuDemo
//
//  Created by Michael Frederick on 3/19/12.

#import <UIKit/UIKit.h>
#import "WebJsonDataGetter.h"
@interface profileSideMenuViewController : UITableViewController<WebJsonDataGetFinishDelegater>{
    WebJsonDataGetter *webGetter;
}

@property (nonatomic)NSArray * array_PofileCategory;
-(UIViewController *)buildViewController:(NSIndexPath *)indexPath;
@property (nonatomic, strong) NSArray *array_Items;
@end