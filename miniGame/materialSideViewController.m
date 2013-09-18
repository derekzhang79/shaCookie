//
//  materialMenuViewController.m
//  miniGame
//
//  Created by 趴特萬 on 13/9/19.
//
//

#import "materialSideViewController.h"
#import "GetJsonURLString.h"
#import "RecipeInfo.h"
#import "ASIHTTPRequest.h"
#import "MFSideMenu.h"



@implementation materialSideViewController

#pragma mark -
#pragma mark - UITableViewDataSource


 -(void)viewDidLoad{
    [super viewDidLoad];
    myRecipe=[[RecipeInfo alloc]initWithURLString:GetJsonURLString_Vegetables];
    [myRecipe setDelegate:self];
     
    
}
 

-(void)doThingAfterRecipeInfoIsOkFromDelegate{
    self.array_MaterialMenu=[[NSArray alloc]initWithArray:myRecipe.dictionary_nmlData];
    //NSLog(@"%@",self.array_MaterialMenu);
    
    [self.tableView reloadData];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"食材"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.array_MaterialMenu count];
    //return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [[myRecipe.dictionary_nmlData objectAtIndex:indexPath.row]objectForKey:@"vegName"];
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
