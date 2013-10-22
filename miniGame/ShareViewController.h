//
//  ShareViewController.h
//  miniGame
//
//  Created by 吳承韋 on 13/10/16.
//
//

#import <UIKit/UIKit.h>
#import "WebJsonDataGetter.h"
@interface ShareViewController : UIViewController<WebJsonDataGetFinishDelegater    >
{
    WebJsonDataGetter *webGetter;
}
@property (strong, nonatomic) IBOutlet UILabel *recipeName;
- (IBAction)shareContent:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *rank;
@property (strong, nonatomic) IBOutlet UITextField *content;

@end
