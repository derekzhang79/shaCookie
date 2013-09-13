//
//  matchMaterialViewController.h
//  miniGame
//
//  Created by 趴特萬 on 13/9/13.
//
//

#import <UIKit/UIKit.h>

@interface matchMaterialViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
}
@property (strong, nonatomic) IBOutlet UITableView *teble_food;
@property(strong,nonatomic)NSDictionary *dictionary_SelectedFood;

@end
