//
//  SideMenuViewController.m
//  MFSideMenuDemo
//
//  Created by Michael Frederick on 3/19/12.

#import "SideMenuViewController.h"
#import "GetJsonURLString.h"
#import "RecipeInfo.h"
#import "ASIHTTPRequest.h"
#import "MFSideMenu.h"


@implementation SideMenuViewController

#pragma mark -
#pragma mark - UITableViewDataSource

#pragma mark -
#pragma mark - UITableViewDataSource


-(void)viewDidLoad{
    [super viewDidLoad];
    myRecipe=[[RecipeInfo alloc]initWithURLString:GetJsonURLString_Recipe];
    [myRecipe setDelegate:self];
    
    
}


-(void)doThingAfterRecipeInfoIsOkFromDelegate{
    self.array_RecipeMenu=[[NSArray alloc]initWithArray:myRecipe.dictionary_nmlData];
    //NSLog(@"%@",self.array_MaterialMenu);
    
    [self.tableView reloadData];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"食譜種類"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.array_RecipeMenu count];
    //return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [[self.array_RecipeMenu objectAtIndex:indexPath.row]objectForKey:@"name"];
    //cell.textLabel.text = [NSString stringWithFormat:@"Item %d", indexPath.row];
    return cell;
}


#pragma mark -
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //    DemoViewController *demoController = [[DemoViewController alloc] initWithNibName:@"DemoViewController" bundle:nil];
    //    demoController.title = [NSString stringWithFormat:@"Demo #%d-%d", indexPath.section, indexPath.row];
    //
    //    UITabBarController *tabBarController = self.menuContainerViewController.centerViewController;
    //    UINavigationController *navigationController = (UINavigationController *)tabBarController.selectedViewController;
    //    NSArray *controllers = [NSArray arrayWithObject:demoController];
    //    navigationController.viewControllers = controllers;
    //    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
}

@end

/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"Section %d", section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Item %d", indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    DemoViewController *demoController = [[DemoViewController alloc] initWithNibName:@"DemoViewController" bundle:nil];
//    demoController.title = [NSString stringWithFormat:@"Demo #%d-%d", indexPath.section, indexPath.row];
//    
//    UITabBarController *tabBarController = self.menuContainerViewController.centerViewController;
//    UINavigationController *navigationController = (UINavigationController *)tabBarController.selectedViewController;
//    NSArray *controllers = [NSArray arrayWithObject:demoController];
//    navigationController.viewControllers = controllers;
//    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
}

@end
*/