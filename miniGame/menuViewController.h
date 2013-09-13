//
//  menuViewController.h
//  miniGame
//
//  Created by 趴特萬 on 13/5/22.
//
//

#import <UIKit/UIKit.h>

@interface menuViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UITabBarControllerDelegate>{
    NSArray *array_Food;
    NSArray *origin_Food;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView_Food;

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar_back;
@end
