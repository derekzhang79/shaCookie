//
//  AppDelegate.m
//  miniGame
//
//  Created by 趴特萬 on 13/3/27.
//
//
#import "MFSideMenu.h"
#import "AppDelegate.h"
#import "SideMenuViewController.h"
#import "refViewController.h"
#import "menuViewController.h"
#import "ViewController.h"
@implementation AppDelegate
-(UINavigationController *)friendsView{
    ViewController *newAdd=[[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    UINavigationController *newAddView=[[UINavigationController alloc]initWithRootViewController:newAdd];
    [newAdd setTitle:@"addFriend" ];
    return newAddView;
}

-(UINavigationController *)recipesView{
    refViewController *refrigerator=[[refViewController alloc]initWithNibName:@"refViewController" bundle:nil];
    UINavigationController *refrigeratorView=[[UINavigationController alloc]initWithRootViewController:refrigerator];
    [refrigerator setTitle:@"Recipes" ];
    return refrigeratorView;
}

-(UINavigationController *)refrigeratorView{
    menuViewController *main=[[menuViewController alloc]initWithNibName:@"menuViewController" bundle:nil];
    UINavigationController *mainView=[[UINavigationController alloc]initWithRootViewController:main];
    [main setTitle:@"refrigerator" ];
    return mainView;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:[NSArray arrayWithObjects:[self refrigeratorView],[self recipesView],[self friendsView],nil]];
    
    SideMenuViewController *leftSideMenuController = [[SideMenuViewController alloc] init];
    SideMenuViewController *rightSideMenuController = [[SideMenuViewController alloc] init];
    MFSideMenuContainerViewController *container = [MFSideMenuContainerViewController
                                                    containerWithCenterViewController:tabBarController
                                                    leftMenuViewController:leftSideMenuController
                                                    rightMenuViewController:rightSideMenuController];
    
    self.window.rootViewController = container;
    [self.window makeKeyAndVisible];
    
    return YES;
    

    
//一評版
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    entryViewController *entry=[[entryViewController alloc]initWithNibName:@"entryViewController"bundle:nil];
//     UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:entry];
//    self.window.rootViewController = nav;
//    [self.window makeKeyAndVisible];
//    return YES;
    

}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
