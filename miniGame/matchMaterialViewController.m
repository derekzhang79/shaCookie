//
//  matchMaterialViewController.m
//  miniGame
//
//  Created by 趴特萬 on 13/9/13.
//
//

#import "matchMaterialViewController.h"
#import "menuViewController.h"

@interface matchMaterialViewController ()

@end

@implementation matchMaterialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dictionary_SelectedFood count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell=(cell==nil)?[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier]:cell;
    
    NSArray *arr=[self.dictionary_SelectedFood allKeys];
    if(self.dictionary_SelectedFood.count <=0)
    {
        cell.textLabel.text=@"無選取資料";
    }else{
        cell.textLabel.text=[[self.dictionary_SelectedFood objectForKey:[arr objectAtIndex:indexPath.row]] objectForKey:@"name"];
        
    }
    return cell;
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

