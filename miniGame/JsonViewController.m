//
//  JsonViewController.m
//  miniGame
//
//  Created by 趴特萬 on 13/3/27.
//
//

#import "JsonViewController.h"
#import "WebList.h"
#import <unistd.h>
#import "ViewController.h"
@interface JsonViewController ()

@end

@implementation JsonViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //myRecipe=[[RecipeInfo alloc]init];
        //[myRecipe setDelegate:self];
        
        aPerson=[[Person alloc] init];
        [aPerson setDelegate:self];
        
        
        webGetter=[[WebJsonDataGetter alloc] initWithURLString:WebList_String_GetPersonCoordinate];
        [webGetter setDelegate:self];
        
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.distanceFilter=kCLDistanceFilterNone;
        [locationManager startUpdatingLocation];
        
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    Array_locaions=locations;
    [locationManager stopUpdatingLocation];
}

-(void)doThingAfterWebPersonLoadLocationIsOKFromDelegate{
    NSLog(@"%f,%f",aPerson.coord.latitude,aPerson.coord.longitude);
}
-(void)doThingAfterWebJsonIsOKFromDelegate{
    [self.tableView_Json reloadData];
}

- (void)viewDidLoad
{

    // Do any additional setup after loading the view from its nib.
     
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - uitableDelegaterrDataSource
-(NSInteger)numberOfSectionInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [webGetter.webData count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //抓陣列的值
    static NSString *CellIndentifier=@"MyCell01";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIndentifier];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIndentifier];
        
    }
    
    cell.textLabel.text=[[webGetter.webData objectAtIndex:indexPath.row]objectForKey:@"deviceId"];
    
    CLLocation *loc=[Array_locaions lastObject];
    CLLocation *default_Location=[[CLLocation alloc]initWithLatitude:[[[webGetter.webData objectAtIndex:indexPath.row]objectForKey:@"latitude"] doubleValue] longitude:[[[webGetter.webData objectAtIndex:indexPath.row]objectForKey:@"longtitude"] doubleValue]];
    CLLocationDistance meters =[loc distanceFromLocation:default_Location];
    
//    cell.detailTextLabel.text=[NSString stringWithFormat:@"%f,%f,DISTANCE:%fKM",[[[webGetter.webData objectAtIndex:indexPath.row]objectForKey:@"latitude"] doubleValue],[[[webGetter.webData objectAtIndex:indexPath.row]objectForKey:@"longtitude"] doubleValue],(CGFloat)meters/1000];
    cell.detailTextLabel.text=[NSString stringWithFormat:@"DISTANCE:%fKM",(CGFloat)meters/1000];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (IBAction)button_Back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end

