//
//  addInventoryViewController.m
//  miniGame
//
//  Created by BirdChiu on 13/10/19.
//
//

#import "addInventoryViewController.h"
#import "MMPickerView.h"


@interface addInventoryViewController ()

@end

@implementation addInventoryViewController
@synthesize name=_name;
@synthesize quantity=_quantity;
@synthesize category=_category;
@synthesize type=_type;
@synthesize quantities=_quantities;
@synthesize categories=_categories;

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
    _category=nil;
    _name=nil;
    _type=nil;
    _quantity=nil;
    // Dispose of any resources that can be recreated.
}

- (IBAction)insert:(id)sender {
    NSLog(@"%@",[_category text]);
    NSLog(@"%@",[_name text]);
    NSLog(@"%@",[_type text]);
    NSLog(@"%@",[_quantity text]);
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:TRUE];
    return YES;
}
@end
