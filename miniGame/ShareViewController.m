//
//  ShareViewController.m
//  miniGame
//
//  Created by 吳承韋 on 13/10/16.
//
//

#import "ShareViewController.h"
#import "GetJsonURLString.h"
@interface ShareViewController ()

@end

@implementation ShareViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareContent:(id)sender {
    NSString *input=[NSString stringWithFormat:@"http://54.244.225.229/shacookie/useThis/inputShare.php?rank=%@&content=%@",_rank,_content];
    NSData *dateUrl=[NSData dataWithContentsOfURL:[NSURL URLWithString:input]];
    
    NSString *result=[[NSString alloc] initWithData:dateUrl encoding:NSUTF8StringEncoding] ;
    NSLog(@"%@",result);
}
@end
