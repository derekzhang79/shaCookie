//
//  materialViewController.m
//  miniGame
//
//  Created by 趴特萬 on 13/5/22.
//
//
#import "materialViewController.h"
#import "Recipes.h"
#import "RecipeInfo.h"
#import "ASIHTTPRequest.h"
#import "GetJsonURLString.h"
@interface materialViewController ()

@end
#define CountDownTime  1000

#define TimeUnin  0.01   // 0.01 sec
@implementation materialViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
BOOL isRunning = NO;
- (void)viewDidLoad
{
    [super viewDidLoad];
    //TODO: 討論資料形態
    myRecipe=[[RecipeInfo alloc]initWithURLString:GetJsonURLString_Recipe];
    [myRecipe setDelegate:self];
    
    _lastTime = CountDownTime;
    //寫死的Recipes *re=[[Recipes alloc] initWithIndex:0];
    //Recipes *re1=[[Recipes alloc] initWithIndex:1];
    self.label_Name.text=[self.dic_Cook objectForKey:@"name"];
    //self.name.text=re.name;
    //NSLog(@"%@",self.dic_Cook);
    //NSLog(@"%@",re.name);
    //NSLog(@"%@",re.practice);
    // for (NSDictionary *dic in re.material) {
    
    //NSLog(@"%@：%@",[dic objectForKey:@"食材"],[dic objectForKey:@"用量"]);
    
    
    //}
    //for (NSDictionary *dic in re.practice) {
    
    //NSLog(@"%@",dic);
    
    //}
    
    // NSLog(@"%@",re.material);
    //NSLog(@"%@",re.practice);
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(tableView.tag==0){
        return 1;//count是代表數量的判斷像是材料有多項跟做法的多個步驟
    }else if(tableView.tag==1){
        return 1;
    }else
        
        return 0;
}


//使用tag辨別tableView的材料與做法
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell=(cell==nil)?[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier]:cell;
    if (tableView.tag==0) {
        
        cell.textLabel.text=[self.dic_Cook objectForKey:@"Food"];
    }else if(tableView.tag==1){
        cell.textLabel.text=[self.dic_Cook objectForKey:@"Step"];
        NSLog(@"%@",[self.dic_Cook objectForKey:@"Step"]);
    }//tag0代表的是用料但是用料裡面還是dic格式所以需要objectForKey來辨別食材跟用量而tag1的表單代表的是做法為string格式所以不需要辨識
    return cell;
}

-(void)doThingAfterRecipeInfoIsOkFromDelegate{
    
}

- (IBAction)time_out:(UIButton *)sender {
    
    
    if (isRunning == NO) {
        
        isRunning = YES;
        
        [self init_timer];
        
        //[timestart setTitle:@"暫停" forState:UIControlStateNormal];
        
    }
    else {
        
        isRunning = NO;
        
        _lastTime = _nowTime;
        
        [_timer invalidate];
        
        _timer = nil;
        
    }
    
    
    
    
}

- (void) showNowTime
{
    _min = _nowTime  / 6000;
    _sec = (_nowTime % 6000) /100 ;
    
    _minSec = _nowTime %100;
    
    _time.text =   [NSString stringWithFormat:@"%02d:%02d:%02d", _min, _sec, _minSec];
    
}

- (void)GameTimer_Count {
    
    if (_nowTime > 0)
    {
        _nowTime-- ;
        
        [self showNowTime];
        
    }
    else if(_nowTime == 0){
        _nowTime = 0;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"時間到了"
                              //上面是標題的設定
                                                        message:@"請關火"  //警告訊息內文的設定
                                                       delegate:self // 叫出AlertView之後，要給該ViewController去處理
                              
                                              cancelButtonTitle:@"OK"  //cancel按鈕文字的設定
                                              otherButtonTitles: nil]; // 其他按鈕的設定
        
        [alert show];
        _nowTime=-1;
    }
}
- (void) init_timer
{
    
    _nowTime = _lastTime;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:TimeUnin target:self selector:@selector(GameTimer_Count) userInfo:nil repeats:YES];
    
}
@end


