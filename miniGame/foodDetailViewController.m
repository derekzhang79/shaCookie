//
//  foodDetailViewController.m
//  miniGame
//
//  Created by 趴特萬 on 13/5/22.
//
//

#import "foodDetailViewController.h"

@interface foodDetailViewController ()

@end

@implementation foodDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.foodName.text=[self.dict objectForKey:@"Name"];
    self.foodType.text=[self.dict objectForKey:@"Unit"];
    self.amount.text=[NSString stringWithFormat:@"%@",[self.dict objectForKey:@"Amount"]];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
