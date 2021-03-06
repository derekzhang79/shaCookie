//
//  addInventoryViewController.m
//  miniGame
//
//  Created by BirdChiu on 13/10/19.
//
//

#import "addInventoryViewController.h"
#import "MMPickerView.h"
#import "GetJsonURLString.h"


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
    _categories=[[NSArray alloc]initWithObjects:@"肉",@"蔬菜",@"海鮮",@"調味料", nil];
    _quantities=[[NSArray alloc]initWithObjects:
                 @"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",
                 @"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",
                 @"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30", nil];
    [_category setText:@"肉"];
    [_quantity setText:@"1"];
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
    NSInteger userId=1;
    webGetter = [[WebJsonDataGetter alloc]initWithURLString:[NSString stringWithFormat:SetJsonURLString_UserInventory,userId,[_type text],[_category text],[_name text],[_quantity text]]];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (_quantity==textField) {
        [self.view endEditing:TRUE];
        [MMPickerView showPickerViewInView:self.view
                               withStrings:_quantities
                               withOptions:@{MMbackgroundColor: [UIColor lightTextColor],
                                             MMtextColor: [UIColor blackColor],
                                             MMtoolbarColor: [UIColor lightGrayColor],
                                             MMbuttonColor: [UIColor blackColor],
                                             MMfont: [UIFont systemFontOfSize:24],
                                             MMvalueY: @3,
                                             MMselectedObject:[_quantity text],
                                             MMtextAlignment:@1}
                                completion:^(NSString *selectedString) {
                                    [_quantity setText:selectedString];
                                }];
        return NO;
    }
    if (_category==textField) {
        [self.view endEditing:TRUE];
        
        [MMPickerView showPickerViewInView:self.view
                               withStrings:_categories
                               withOptions:@{MMbackgroundColor: [UIColor lightTextColor],
                                             MMtextColor: [UIColor blackColor],
                                             MMtoolbarColor: [UIColor lightGrayColor],
                                             MMbuttonColor: [UIColor blackColor],
                                             MMfont: [UIFont systemFontOfSize:24],
                                             MMvalueY: @3,
                                             MMselectedObject:[_category text],
                                             MMtextAlignment:@1}
                                completion:^(NSString *selectedString) {
                                    [_category setText:selectedString];
                                }];
        return NO;
    }
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:TRUE];
    return YES;
}
@end
