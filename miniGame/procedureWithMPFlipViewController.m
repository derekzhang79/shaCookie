//
//  procedureWithMPFlipViewController.m
//  miniGame
//
//  Created by BirdChiu on 13/9/24.
//
//

#import "procedureWithMPFlipViewController.h"
#import "procedureStepViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "GetJsonURLString.h"
#define CONTENT_IDENTIFIER @"procedureStepViewController"

#define FRAME_MARGIN    60
#define MOVIE_MIN		1
#define MOVIE_MAX		3
@interface procedureWithMPFlipViewController ()

@end


@implementation procedureWithMPFlipViewController

@synthesize flipViewController = _flipViewController;
@synthesize corkboard = _corkboard;
@synthesize previousIndex = _previousIndex;
@synthesize tentativeIndex = _tentativeIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        // Custom initialization
        webGetter =[[WebJsonDataGetter alloc]initWithURLString:[NSString stringWithFormat:GetJsonURLString_RecipeStep,@"1"]];
        [webGetter setDelegate:self];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    // Do any additional setup after loading the view, typically from a nib.
    [super viewDidLoad];
    self.previousIndex = MOVIE_MIN;
	
	// Configure the page view controller and add it as a child view controller.
	self.flipViewController = [[MPFlipViewController alloc] initWithOrientation:[self flipViewController:nil orientationForInterfaceOrientation:[UIApplication sharedApplication].statusBarOrientation]];
	self.flipViewController.delegate = self;
	self.flipViewController.dataSource = self;
	
    // Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
	CGRect pageViewRect = self.view.bounds;
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
	{
		pageViewRect = CGRectInset(pageViewRect, 20, 20 );
		self.flipViewController.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
	}
	
	self.flipViewController.view.frame = pageViewRect;
	[self addChildViewController:self.flipViewController];
	[self.view addSubview:self.flipViewController.view];
	[self.flipViewController didMoveToParentViewController:self];
	
	[self.flipViewController setViewController:[self contentViewWithIndex:self.previousIndex] direction:MPFlipViewControllerDirectionForward animated:NO completion:nil];
	
	
	// Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
	self.view.gestureRecognizers = self.flipViewController.gestureRecognizers;
	
	//[self.corkboard setBackgroundColor:[UIColor colorWithWhite:0 alpha:0]];
	
	[self addObserver];
    
    // Do any additional setup after loading the view from its nib.

	
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [self setCorkboard:nil];
	[self removeObserver];
    // Dispose of any resources that can be recreated.
}


- (void)addObserver
{
	if (![self observerAdded])
	{
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(flipViewControllerDidFinishAnimatingNotification:) name:MPFlipViewControllerDidFinishAnimatingNotification object:nil];
		[self setObserverAdded:YES];
	}
}

- (void)removeObserver
{
	if ([self observerAdded])
	{
		[[NSNotificationCenter defaultCenter] removeObserver:self name:MPFlipViewControllerDidFinishAnimatingNotification object:nil];
		[self setObserverAdded:NO];
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	if ([self flipViewController])
		return [[self flipViewController] shouldAutorotateToInterfaceOrientation:interfaceOrientation];
	else
		return YES;
}

- (procedureStepViewController *)contentViewWithIndex:(int)index
{
    procedureStepViewController *page = [[procedureStepViewController alloc]initWithNibName:@"procedureStepViewController" bundle:nil];
    [page getRecipeStep:self.array_Items];
	page.movieIndex = index;
	page.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	return page;
}

#pragma mark - MPFlipViewControllerDelegate protocol

- (void)flipViewController:(MPFlipViewController *)flipViewController didFinishAnimating:(BOOL)finished previousViewController:(UIViewController *)previousViewController transitionCompleted:(BOOL)completed
{
	if (completed)
	{
		self.previousIndex = self.tentativeIndex;
	}
}

- (MPFlipViewControllerOrientation)flipViewController:(MPFlipViewController *)flipViewController orientationForInterfaceOrientation:(UIInterfaceOrientation)orientation
{
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
		return UIInterfaceOrientationIsPortrait(orientation)? MPFlipViewControllerOrientationVertical : MPFlipViewControllerOrientationHorizontal;
	else
		return MPFlipViewControllerOrientationHorizontal;
}

#pragma mark - MPFlipViewControllerDataSource protocol

- (UIViewController *)flipViewController:(MPFlipViewController *)flipViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
	int index = self.previousIndex;
	index--;
	if (index < MOVIE_MIN)
		return nil; // reached beginning, don't wrap
	self.tentativeIndex = index;
	return [self contentViewWithIndex:index];
}

- (UIViewController *)flipViewController:(MPFlipViewController *)flipViewController viewControllerAfterViewController:(UIViewController *)viewController
{
	int index = self.previousIndex;
	index++;
	//if (index > MOVIE_MAX)
    if (index > self.step)
		return nil; // reached end, don't wrap
	self.tentativeIndex = index;
	return [self contentViewWithIndex:index];
}

#pragma mark - Notifications

- (void)flipViewControllerDidFinishAnimatingNotification:(NSNotification *)notification
{
	NSLog(@"Notification received: %@", notification);
}

-(void)doThingAfterWebJsonIsOKFromDelegate{
    self.array_Items=webGetter.webData;
    self.step=[[[self.array_Items objectAtIndex:1]objectForKey:@"step"]count];
    [self viewDidLoad];
}

@end
