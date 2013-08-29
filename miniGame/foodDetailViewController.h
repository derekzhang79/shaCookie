//
//  foodDetailViewController.h
//  miniGame
//
//  Created by 趴特萬 on 13/5/22.
//
//

#import "menuViewController.h"

@interface foodDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *foodName;
@property(strong,nonatomic)NSDictionary *dict;
@property (strong, nonatomic) IBOutlet UILabel *amount;
@property (strong, nonatomic) IBOutlet UILabel *foodType;

@end
