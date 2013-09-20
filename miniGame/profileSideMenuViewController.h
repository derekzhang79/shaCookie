//
//  SideMenuViewController.h
//  MFSideMenuDemo
//
//  Created by Michael Frederick on 3/19/12.

#import <UIKit/UIKit.h>

@interface profileSideMenuViewController : UITableViewController
@property (nonatomic)NSArray * array_PofileCategory;
-(UIViewController *)buildViewController:(NSIndexPath *)indexPath;
@end