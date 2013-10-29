//
//  ShareViewController.m
//  miniGame
//
//  Created by 吳承韋 on 13/10/16.
//
//

#import "ShareViewController.h"
#import "GetJsonURLString.h"
#import "UILabel+AutoFrame.h"
@interface ShareViewController ()

@end

@implementation ShareViewController
@synthesize pushName = _pushName;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil pushName:(NSString*)pushName
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //[self.recipeName setText:@"eee"];
        NSLog(@"999%@",pushName);
        _pushName=pushName;
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame=CGRectMake(20, 30, 300, 300);
    [self.parentViewController.navigationController pushViewController:self animated:YES];
    [self.recipeName setTextWithAutoFrame:_pushName];
    //self.recipeName.text=@"",_recipeName;
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

- (IBAction)exitOut:(id)sender {
    [self.view removeFromSuperview];
}
@end
