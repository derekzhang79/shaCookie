//
//  combineResultsViewController.m
//  miniGame
//
//  Created by 趴特萬 on 13/10/3.
//
//

#import "combineResultsViewController.h"

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
    
    NSArray * arrayRandom=[[NSArray alloc]init];
    if(self.randomMaterial.count ==0){
        arrayRandom= nil;
    }else{
        arrayRandom= [self.randomMaterial objectAtIndex:arc4random()%self.randomMaterial.count];
        NSLog(@"fuck:%@",[self.randomMaterial objectAtIndex:arc4random()%self.randomMaterial.count]);
        
    }
    
    // Do any additional setup after loading the view from its nib.
}
- (id) randomObject{
    
    if(self.randomMaterial.count ==0){
        return nil;
    }else{
        return [self.randomMaterial objectAtIndex:arc4random()%self.randomMaterial.count];
        NSLog(@"fuck:%@",[self.randomMaterial objectAtIndex:arc4random()%self.randomMaterial.count]);
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
