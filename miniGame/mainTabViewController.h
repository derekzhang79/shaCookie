//
//  mainTabViewController.h
//  miniGame
//
//  Created by 趴特萬 on 13/5/22.
//
//

#import <UIKit/UIKit.h>

@interface mainTabViewController : UIViewController<UITabBarControllerDelegate>;
@property(nonatomic,strong)UITabBarController *mainTabBar;
@property (strong, nonatomic) IBOutlet UIImageView *image_index;


@end
