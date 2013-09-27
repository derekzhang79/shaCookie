//
//  recipesWithICarouselViewController.m
//  miniGame
//
//  Created by BirdChiu on 13/9/15.
//
//
#import "materialViewController.h"
#import "recipesWithICarouselViewController.h"
#import "GetJsonURLString.h"
#import "CVCell.h"
#import "procedureWithMPFlipViewController.h"

@interface recipesWithICarouselViewController ()

@end

@implementation recipesWithICarouselViewController
#pragma mark -
#pragma mark View lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

-(void)recipesSearch:(NSString*)recipeType{
    webGetter = [[WebJsonDataGetter alloc]init];
    NSString *str=[NSString stringWithFormat:GetJsonURLString_Recipe,recipeType];
    [webGetter requestWithURLString:[NSString stringWithUTF8String:[str UTF8String]]];
    [webGetter setDelegate:self];
}

-(void)didReceiveMemoryWarning{
    self.array_Items = nil;
    self.carousel=nil;
}


-(void)doThingAfterWebJsonIsOKFromDelegate{
    self.array_Items = webGetter.webData;
    NSLog(@"999 %@",self.array_Items);
    [self.carousel reloadData];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.carousel.type = iCarouselTypeCoverFlow;
    self.carousel.vertical = true;
    
    // Do any additional setup after loading the view from its nib.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark -
#pragma mark iCarousel methods

-(NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return [self.array_Items count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    CVCell *cell = [[CVCell alloc]initWithFrame:CGRectMake(0, 0, 300.0f, 300.0f)];
    
    NSURL *url = [NSURL URLWithString:[[webGetter.webData objectAtIndex:index]objectForKey:@"image_url"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    cell.image_recipe.image=[[UIImage alloc]initWithData:data];
    if (!cell.image_recipe.image) {
        cell.image_recipe.image=[UIImage imageNamed:@"gamebaby.png"];
    }
    cell.titleLabel.text=[[webGetter.webData objectAtIndex:index]objectForKey:@"name"];
    view=(UIView *)cell;
    return view;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    //customize carousel display
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            //normally you would hard-code this to YES or NO
            return true;
        }
        case iCarouselOptionSpacing:
        {
            //add a bit of spacing between the item views
            return value * 1.05f;
        }
        default:
        {
            return value;
        }
    }
}

#pragma mark -
#pragma mark iCarousel taps

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    //NSNumber *item = (self.array_Items)[index];
    //NSLog(@"Tapped view number: %@", item);
    //materialViewController*Cookview=[[materialViewController alloc]initWithNibName:@"materialViewController" bundle:nil ];
    //Cookview.rec=[[Recipes alloc] initWithIndex:indexPath.section];
    //Cookview.dictionary_Cook=[webGetter.webData objectAtIndex:index];
    //[self.navigationController pushViewController:procedure animated:YES];//navigation連結頁面'
    procedureWithMPFlipViewController *pro=[[procedureWithMPFlipViewController alloc]initWithNibName:@"procedureWithMPFlipViewController" bundle:nil];

    [self.navigationController setNavigationBarHidden:false animated:TRUE];
    [self.navigationController pushViewController:pro animated:TRUE];
}
@end
