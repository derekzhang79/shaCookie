//
//  entryViewController.m
//  miniGame
//
//  Created by BirdChiu on 13/6/6.
//
//

#import "entryViewController.h"
#import "mainTabViewController.h"

@interface entryViewController ()

@end

@implementation entryViewController

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
    UISwipeGestureRecognizer *swipeleft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    [self.view addGestureRecognizer:swipeleft];
    
    swipeleft.direction = UISwipeGestureRecognizerDirectionLeft;

    // Do any additional setup after loading the view from its nib.
}

-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
    self.image_index.image=[UIImage imageNamed:@"homepage2-1.png"];
    UIButton *button_goRefrigerator = [[UIButton alloc] initWithFrame:CGRectMake(179, 66, 141, 433)];
//    button_goRefrigerator=[UIButton buttonWithType:UIButtonTypeCustom];
    [button_goRefrigerator addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_goRefrigerator];
}

-(void)buttonClicked:(id)sender{
    NSLog(@"click");
     mainTabViewController *mainTabBar=[[mainTabViewController alloc] initWithNibName:@"mainTabViewController" bundle:nil];
    
    [self.navigationController pushViewController:mainTabBar animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
