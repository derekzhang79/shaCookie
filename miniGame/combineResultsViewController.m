//
//  combineResultsViewController.m
//  miniGame
//
//  Created by 趴特萬 on 13/10/3.
//
//

#import "combineResultsViewController.h"
#import "procedureWithMPFlipViewController.h"
#import "GetJsonURLString.h"
#import "JSONKit.h"

@interface combineResultsViewController ()

@end

@implementation combineResultsViewController

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
    

    self.arrayMaterial=[[NSArray alloc]init];
    NSString *stringName=[self.getMaterial componentsJoinedByString:@","];
    [[stringName JSONString] UTF8String];
    webGetter = [[WebJsonDataGetter alloc]init];
    NSString *str=[NSString stringWithFormat:GetJsonURLString_RecipeByNames,stringName];
    NSLog(@"%@",[NSString stringWithFormat:GetJsonURLString_RecipeByNames,stringName]);
    [webGetter requestWithURLString:[NSString stringWithUTF8String:[str UTF8String]]];
        [webGetter setDelegate:self];


//    下面註解晚點用
//    if(self.getMaterial.count ==0){
//        self.arrayMaterial= nil;
//    }else{
//        self.arrayMaterial= [self.getMaterial objectAtIndex:arc4random()%self.getMaterial.count];
//        //NSLog(@"fuck:%@",[self.getMaterial objectAtIndex:arc4random()%self.getMaterial.count]);
//        
//    }
//    
//    UIAlertView* mes=[[UIAlertView alloc] initWithTitle:@"搖一搖！！！"
//                                                message:@"請搖一搖幫您隨機配菜" delegate:self cancelButtonTitle:@"開始搖！" otherButtonTitles: nil];
//    
//    [mes show];
//    [mes release];
    
    
    // Do any additional setup after loading the view from its nib.
}
-(void)doThingAfterWebJsonIsOKFromDelegate{
    self.getRecipes=[[NSArray alloc]initWithArray:webGetter.webData];
    NSLog(@"fuck %@",self.getRecipes);

    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    switch (buttonIndex) {
        case 0:
            NSLog(@"cancel");
            
            if (motionManager.gyroAvailable) {
                motionManager.gyroUpdateInterval = 1.0f/3.0f;
                [motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMGyroData* gyroData, NSError *error){
                    
                    
                    
                    if ((gyroData.rotationRate.z>=13 || gyroData.rotationRate.z<=-13))
                    {
                        
                    }
                    
                }];
                
            } else {
                NSLog(@"陀螺儀未感測");
            }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
