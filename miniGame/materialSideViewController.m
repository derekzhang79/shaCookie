//
//  materialMenuViewController.m
//  miniGame
//
//  Created by 趴特萬 on 13/9/19.
//
//

#import "materialSideViewController.h"
#import "GetJsonURLString.h"
#import "MFSideMenu.h"



@implementation materialSideViewController

#pragma mark -
#pragma mark - UITableViewDataSource


 -(void)viewDidLoad{
    [super viewDidLoad];
    materials=[[RecipeInfo alloc]initWithURLString:GetJsonURLString_Vegetables];
    [materials setDelegate:self];
}
 

-(void)doThingAfterRecipeInfoIsOkFromDelegate{
    self.array_MaterialMenu=[[NSArray alloc]initWithArray:materials.dictionary_nmlData];
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
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [[self.array_MaterialMenu objectAtIndex:indexPath.row]objectForKey:@"vegName"];
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
