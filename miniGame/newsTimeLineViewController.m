//
//  newsTimeLineViewController.m
//  miniGame
//
//  Created by BirdChiu on 13/9/27.
//
//

#import "newsTimeLineViewController.h"
#import "SampleTimelineViewCell.h"
#import "GetJsonURLString.h"

@interface newsTimeLineViewController ()

@end

@implementation newsTimeLineViewController
@synthesize timelineView = _timelineView;


#pragma mark Helper Functions
#pragma mark -



- (NSInteger)randFrom:(NSInteger)from to:(NSInteger)to
{
    return (arc4random() % to) + from;
}

#pragma mark UIViewController
#pragma mark -

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil timeLine:(NSArray*)timeLine{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.array_Items = timeLine;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    webGetter =[[WebJsonDataGetter alloc]initWithURLString:GetJsonURLString_Content];
//    [webGetter setDelegate:self];
    
    
    NSInteger num = [self.array_Items count];
    NSLog(@"num = %d",num);
    NSInteger lastPos = 0;
    
    data = [[NSMutableArray alloc] initWithCapacity:num];
    
    // Make a bunch of random data
    for(NSInteger i = 0; i < num; ++i) {
        UIColor *color= [UIColor blueColor];
        //lastPos = lastPos;// + [self randFrom:minSep to:maxSep];
        //CGRectMake(0, _timelineView.bounds.origin.y, _timelineView.bounds.size.width, 300.0f);
        if (i!=0){
            NSLog(@"123");
            lastPos = lastPos+210;
        }
        [data addObject:@{
                          
                          @"rect":NSStringFromCGRect(CGRectMake(0.f, (CGFloat)lastPos, _timelineView.bounds.size.width, 200.0f)),
                          @"color":color,
                          @"num":@(i)}
         ];
        
    }
    [_timelineView registerNib:[UINib nibWithNibName:@"SampleTimelineViewCell" bundle:nil]
    forCellWithReuseIdentifier:@"SampleTimelineViewCell"];
    
    _timelineView.allowsMultipleSelection = YES;
    
    // Change delete/insert animation to shrink effect
    _timelineView.animationBlock = ^(NSMapTable *moved, NSSet *deleted, NSSet *inserted) {
        for(TimelineViewCell *cell in moved) {
            cell.frame = [[moved objectForKey:cell] CGRectValue];
        }
        for(TimelineViewCell *cell in deleted) {
            cell.transform = CGAffineTransformScale(cell.transform, 0, 0);
        }
        for(TimelineViewCell *cell in inserted) {
            cell.transform = CGAffineTransformScale(cell.transform, 0, 0);
            cell.transform = CGAffineTransformIdentity;
        }
    };
}

//-(void)doThingAfterWebJsonIsOKFromDelegate{
//    
//    self.array_Items=[[NSArray alloc]initWithArray:webGetter.webData ];
//    [self.timelineView reloadData];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    self.timelineView=nil;
    self.array_Items=nil;
    // Dispose of any resources that can be recreated.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil Id:(NSString*)Id
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization
        
    }
    return self;
}

#pragma mark TimelineViewDataSource
#pragma mark -

- (CGSize)contentSizeForTimelineView:(TimelineView *)timelineView
{
    NSDictionary *lastObject = [data lastObject];
    NSString *strRect = lastObject[@"rect"];
    CGRect frame = CGRectFromString(strRect);
    
    return CGSizeMake(timelineView.bounds.size.width, CGRectGetMaxY(frame));
}

- (NSInteger)numberOfCellsInTimelineView:(TimelineView *)timelineView
{
    return data.count;
}

- (CGRect)timelineView:(TimelineView *)timelineView frameForCellAtIndex:(NSInteger)index
{
    return CGRectFromString([[data objectAtIndex:index] objectForKey:@"rect"]);
}

- (TimelineViewCell *)timelineView:(TimelineView *)timelineView cellForIndex:(NSInteger)index
{
    SampleTimelineViewCell *cell = (SampleTimelineViewCell*)[timelineView dequeueReusableCellWithReuseIdentifier:@"SampleTimelineViewCell" forIndex:index];
    NSDictionary *info = [data objectAtIndex:index];
    NSString *urlString = [[NSString alloc] init] ;
    
    
    cell.color = info[@"color"];
    cell.label.text = [NSString stringWithFormat:@"%@", info[@"num"]];
    cell.friendName.text =[[self.array_Items objectAtIndex:index] objectForKey:@"display_name"];
    cell.recipeName.text =[[self.array_Items objectAtIndex:index]objectForKey:@"name"];
    cell.shareContent.text =[[self.array_Items objectAtIndex:index] objectForKey:@"content"];
    cell.latestTime.text=[[self.array_Items objectAtIndex:index] objectForKey:@"latest_online"];
    NSString *imageUrl=[[self.array_Items objectAtIndex:index]objectForKey:@"image_url"];
    urlString=@"http://54.244.225.229/shacookie/image/" ;
    urlString=[NSString stringWithFormat:@"%@%@",urlString,imageUrl];
    NSURL *url=[NSURL URLWithString:urlString];
    NSData *imageData=[[NSData alloc] initWithContentsOfURL:url];

    cell.recipeImage.image=[UIImage imageWithData:imageData];
    

    return cell;
}

- (BOOL)timelineView:(TimelineView *)timelineView canMoveItemAtIndex:(NSInteger)index
{
    return YES;
}

- (void)timelineView:(TimelineView *)timelineView moveItemAtIndex:(NSInteger)sourceIndex toIndex:(NSInteger)destinationIndex withFrame:(CGRect)frame
{
    NSDictionary *info = [data objectAtIndex:sourceIndex];
    
    [data removeObjectAtIndex:sourceIndex];
    [data insertObject:@{@"rect": NSStringFromCGRect(frame), @"color": info[@"color"], @"num": info[@"num"]} atIndex:destinationIndex];
}

#pragma mark Buttons
#pragma mark -


/*
- (IBAction)deleteButtonPush:(id)sender
{
    NSIndexSet *indexSet = _timelineView.indexSetForSelectedItems;
    
    [data removeObjectsAtIndexes:indexSet];
    [_timelineView deleteItemsAtIndexSet:indexSet];
}

- (IBAction)swapButtonPush:(id)sender
{
    NSIndexSet *indexSet = _timelineView.indexSetForSelectedItems;
    
    if(indexSet.count != 2) {
        NSLog(@"No more than 2 items selected!");
        return;
    }
    
    NSDictionary *firstInfo = [data objectAtIndex:indexSet.firstIndex];
    NSDictionary *lastInfo = [data objectAtIndex:indexSet.lastIndex];
    
    [data replaceObjectAtIndex:indexSet.firstIndex withObject:@{@"rect": firstInfo[@"rect"], @"color": lastInfo[@"color"], @"num": lastInfo[@"num"]}];
    [data replaceObjectAtIndex:indexSet.lastIndex withObject:@{@"rect": lastInfo[@"rect"], @"color": firstInfo[@"color"], @"num": firstInfo[@"num"]}];
    
    [_timelineView performBatchUpdates:^{
        [_timelineView moveItemAtIndex:indexSet.firstIndex toIndex:indexSet.lastIndex];
        [_timelineView moveItemAtIndex:indexSet.lastIndex toIndex:indexSet.firstIndex];
    } completion:nil];
}

- (IBAction)insertTopButtonPush:(id)sender
{
    CGRect cellFrame = CGRectMake(0, _timelineView.bounds.origin.y, _timelineView.bounds.size.width, 300.0f);
    NSInteger index = [_timelineView indexForInsertingFrame:cellFrame];
    NSString *rect = NSStringFromCGRect(cellFrame);
    NSInteger colorInt = [self randFrom:1 to:9];
    UIColor *color = [self colorByColorInt:colorInt];
    NSArray *num = [NSString stringWithFormat:@"%c", [self randFrom:65 to:122]];
    
    [data insertObject:@{@"rect":rect, @"color":color, @"num": num} atIndex:index];
    [_timelineView insertItemAtIndex:index];
}

*/



@end
