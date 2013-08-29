//
//  mainTabViewController.m
//  miniGame
//
//  Created by 趴特萬 on 13/5/22.
//
//

#import "mainTabViewController.h"
#import "ViewController.h"
#import "refViewController.h"
#import "menuViewController.h"
@interface mainTabViewController ()

@end

@implementation mainTabViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
    ViewController *newAdd=[[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    UINavigationController *newAddView=[[UINavigationController alloc]initWithRootViewController:newAdd];
//    [newAddView setNavigationBarHidden:YES animated:NO];
    [newAdd setTitle:@"addFriend" ];
    

    //[view.navigationItem setTitle:@"main"];
    //[mainView.tabBarItem setTitle:@"main"];
    
    
    //    refrigeratorViewController *refrigerator= [[refrigeratorViewController alloc] initWithNibName:@"refrigeratorViewController" bundle:nil];
    refViewController *refrigerator=[[refViewController alloc]initWithNibName:@"refViewController" bundle:nil];
    UINavigationController *refrigeratorView=[[UINavigationController alloc]initWithRootViewController:refrigerator];
    [refrigerator setTitle:@"Recipes" ];
    //[refrigeratorView.tabBarItem setTitle:@"refrierator"];
    
    
    menuViewController *main=[[menuViewController alloc]initWithNibName:@"menuViewController" bundle:nil];
    UINavigationController *mainView=[[UINavigationController alloc]initWithRootViewController:main];
    [main setTitle:@"refrigerator" ];
    
    
    self.mainTabBar=[[UITabBarController alloc]init];
    [self.mainTabBar setDelegate:self];
    [self.mainTabBar setViewControllers:[NSArray arrayWithObjects:mainView,refrigeratorView,newAddView,nil]];
    NSArray *array=[NSArray arrayWithObjects:mainView,refrigeratorView,newAddView,nil];
    
    [self.mainTabBar setViewControllers:array];
    [self presentViewController:self.mainTabBar animated:YES completion:nil];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end