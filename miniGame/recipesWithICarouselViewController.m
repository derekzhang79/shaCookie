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
#import "RecipeInfo.h"
#import "CVCell.h"

@interface recipesWithICarouselViewController ()

@end

@implementation recipesWithICarouselViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        myRecipe=[[RecipeInfo alloc]initWithURLString:GetJsonURLString_Recipe];
        [myRecipe setDelegate:self];
    }
    return self;
}

- (void)dealloc
{
    //it's a good idea to set these to nil here to avoid
    //sending messages to a deallocated viewcontroller
    //this is true even if your project is using ARC, unless
    //you are targeting iOS 5 as a minimum deployment target
    self.carousel.delegate = nil;
    self.carousel.dataSource = nil;
    
}

-(void)doThingAfterRecipeInfoIsOkFromDelegate{
    self.items = [[NSArray alloc] initWithArray:myRecipe.dictionary_nmlData];
    [self.carousel reloadData];
}

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.carousel.type = iCarouselTypeCoverFlow;
    self.carousel.vertical = true;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    //free up memory by releasing subviews
    self.carousel = nil;
    self.items=nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    self.carousel = nil;
    self.items=nil;
    NSLog(@"clear");
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark iCarousel methods

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //return the total number of items in the carousel
    return [self.items count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    CVCell *cell = [[CVCell alloc]initWithFrame:CGRectMake(0, 0, 300.0f, 300.0f)];
    cell.image_recipe.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",[[myRecipe.dictionary_nmlData objectAtIndex:index]objectForKey:@"name"]]];
    if (!cell.image_recipe.image) {
        cell.image_recipe.image=[UIImage imageNamed:@"gamebaby.png"];
    }
    cell.titleLabel.text=[[myRecipe.dictionary_nmlData objectAtIndex:index]objectForKey:@"name"];
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
    NSNumber *item = (self.items)[index];
    NSLog(@"Tapped view number: %@", item);
    materialViewController*Cookview=[[materialViewController alloc]initWithNibName:@"materialViewController" bundle:nil ];
    //Cookview.rec=[[Recipes alloc] initWithIndex:indexPath.section];
    Cookview.dictionary_Cook=[myRecipe.dictionary_nmlData objectAtIndex:index];
    [Cookview setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self.navigationController pushViewController:Cookview animated:YES];//navigation連結頁面
}
@end
