//
//  menuViewController.m
//  miniGame
//
//  Created by 趴特萬 on 13/5/22.
//
//

#import "menuViewController.h"
#import "foodDetailViewController.h"
#import "PlsitRead.h"
#import "refViewController.h"
#import "moveFinishViewController.h"
@interface menuViewController ()

@end

@implementation menuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.searchBar_back.alpha=0.0;
    PlsitRead *readPlist=[[PlsitRead alloc] initWithFileName:@"foodData.plist"];
    array_Food=[readPlist readFromFile];
    origin_Food = array_Food;
    
    UIBarButtonItem *btn_needSearch=[[UIBarButtonItem alloc] initWithTitle:@"search" style:UIBarButtonItemStylePlain target:self action:@selector(searchBarAppear:)];
    [self.navigationItem setRightBarButtonItem:btn_needSearch];
	// Do any additional setup after loading the view, typically from a nib.
    motionManager = [[CMMotionManager alloc] init];
    
    UIDevice *device=[UIDevice currentDevice];
    [device beginGeneratingDeviceOrientationNotifications];
    UIDeviceOrientation orientation=device.orientation;
    NSLog(@"%d",orientation);
    [device endGeneratingDeviceOrientationNotifications];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [array_Food count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //抓陣列的值
    static NSString *CellIndentifier=@"MyCell01";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIndentifier];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIndentifier];
        NSLog(@"%@ is nil",indexPath);
    }
    cell.textLabel.text=[[array_Food objectAtIndex:indexPath.row] objectForKey:@"Name"];
    cell.detailTextLabel.text= [[array_Food objectAtIndex:indexPath.row] objectForKey:@"Type"];
    //cell.imageView.image
    NSLog(@"%@",[[array_Food objectAtIndex:indexPath.row] objectForKey:@"Name"]);
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"accessory Type=%d",TRUE);
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        
    } else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    NSLog(@"%d %d",indexPath.section,indexPath.row);
    NSLog(@"%@",[array_Food objectAtIndex:indexPath.row]);
    
    //如果無資料 則不需跳下一頁
    /*if (![[[array_Food objectAtIndex:0] objectForKey:@"Name" ] isEqualToString:@"NO DATA"]) {
        
        foodDetailViewController *foodView=[[foodDetailViewController alloc] initWithNibName:@"foodDetailViewController" bundle:nil];
        foodView.dict=[array_Food objectAtIndex:indexPath.row];
        //[foodView setModalTransitionStyle:UIModalTransitionStylePartialCurl];
        //[self presentViewController:foodView animated:YES completion:nil];
        [self.navigationController pushViewController:foodView animated:YES];
    }
     */

    
}
-(void)searchBarAppear:(id)sender{
    self.searchBar_back.alpha=1.0-self.searchBar_back.alpha;
    self.tableView_Food.frame=CGRectMake(0, 44, 320, 416);
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSPredicate *pre=[NSPredicate predicateWithFormat:@"Name contains[cd] %@",searchText ];
    //cd is ==
    array_Food=[origin_Food filteredArrayUsingPredicate:pre];
    
    //無資料之動作
    if (![array_Food count]) {
        NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
        [dict setObject:@"NO DATA" forKey:@"Name"];
        [dict setObject:@"try again" forKey:@"No"];
        
        array_Food =[NSArray arrayWithObject:dict];
    }
    
    
    [self.tableView_Food reloadData ];
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    UIBarButtonItem *btn=[[UIBarButtonItem alloc] initWithTitle:@"done" style:UIBarButtonItemStylePlain target:self action:@selector(dismissKeyBord:)];
    [self.navigationItem setRightBarButtonItem:btn];
}
-(void)dismissKeyBord:(id)sender{
    //把畫面重置
    self.searchBar_back.alpha=0.0;
    array_Food=origin_Food;
    [self.tableView_Food reloadData ];
    
    //NSLog(@"dismiss keyboard");
    //把鍵盤關掉
    [self.searchBar_back resignFirstResponder];
    //把Done關掉
    [self.navigationItem setRightBarButtonItem:nil];
    UIBarButtonItem *btn_needSearch=[[UIBarButtonItem alloc] initWithTitle:@"search" style:UIBarButtonItemStylePlain target:self action:@selector(searchBarAppear:)];
    [self.navigationItem setRightBarButtonItem:btn_needSearch];
    self.tableView_Food.frame=CGRectMake(0, 0, 320, 416);
}
- (IBAction)button_StartMotion:(id)sender {
        
    refViewController *rv=[[refViewController alloc] init];
    moveFinishViewController *mv=[[moveFinishViewController alloc] init];
        if (motionManager.gyroAvailable) {
            motionManager.gyroUpdateInterval = 1.0f/3.0f;
            [motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMGyroData* gyroData, NSError *error){
                
                               
                if ((gyroData.rotationRate.x>=10 || gyroData.rotationRate.x<=-10))
                {
                    
                    [self presentViewController:mv animated:YES completion:nil];
                }
                
                if ((gyroData.rotationRate.z>=8 || gyroData.rotationRate.z<=-8))
                {
                    [self presentViewController:rv animated:YES completion:Nil];
                }
                
                
                if ((gyroData.rotationRate.y>=8 || gyroData.rotationRate.y<=-8))
                {
                    NSLog(@"炒菜動作成功");
                }
                if ((gyroData.rotationRate.x>=3 || gyroData.rotationRate.x<=-3) && (gyroData.rotationRate.z>=3 || gyroData.rotationRate.z<=-3) &&(gyroData.rotationRate.y>=3 || gyroData.rotationRate.y<=-3) )
                {
                    NSLog(@"炸動作成功");
                }
               
            }];
            
        } else {
            NSLog(@"陀螺儀未感測");
        }
    
    
}

@end