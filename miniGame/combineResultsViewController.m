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
    self.randomRecipes=[[NSArray alloc]init];
    NSString *stringName=[self.getMaterial componentsJoinedByString:@","];
    webGetter = [[WebJsonDataGetter alloc]init];
    NSString *str=[NSString stringWithFormat:GetJsonURLString_RecipeByNames,stringName];
    NSLog(@"%@",[NSString stringWithFormat:GetJsonURLString_RecipeByNames,stringName]);
    [webGetter requestWithURLString:[NSString stringWithUTF8String:[str UTF8String]]];
        [webGetter setDelegate:self];
    
    



    
    UIAlertView* mes=[[UIAlertView alloc] initWithTitle:@"搖一搖！！！"
                                                message:@"請搖一搖幫您隨機配菜" delegate:self cancelButtonTitle:@"開始搖！" otherButtonTitles: nil];
    
    [mes show];
    [mes release];
    
    
    // Do any additional setup after loading the view from its nib.
}
-(void)doThingAfterWebJsonIsOKFromDelegate{
    self.getRecipes=[[NSArray alloc]initWithArray:webGetter.webData];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
   // NSLog(@"test: %@",self.getRecipes);
    if(self.getRecipes.count ==0){
        //NSLog(@"get:%@",self.getRecipes);
        self.randomRecipes= nil;
    }else{
        self.randomRecipes= [[self.getRecipes objectAtIndex:arc4random()%self.getRecipes.count]objectForKey:@"id"];
//NSLog(@"show:%@",[[self.getRecipes objectAtIndex:arc4random()%self.getRecipes.count]objectForKey:@"id"]);
    }
    
    
    

    switch (buttonIndex) {
        case 0:
            NSLog(@"cancel");
            
            if (motionManager.gyroAvailable) {
                motionManager.gyroUpdateInterval = 1.0f/3.0f;
                [motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMGyroData* gyroData, NSError *error){
                    
                    
                    
                    if ((gyroData.rotationRate.z>=13 || gyroData.rotationRate.z<=-13))
                    {
                        NSString *recipeId=self.randomRecipes;
                        NSLog(@"show:%@",recipeId);
                        procedureWithMPFlipViewController *pro=[[procedureWithMPFlipViewController alloc]initWithNibName:@"procedureWithMPFlipViewController" bundle:nil recipeId:recipeId];
                        
                        [self.navigationController pushViewController:pro animated:TRUE];
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
