

//
//  materialWithCollectionViewController.m
//  miniGame
//
//  Created by 趴特萬 on 13/9/24.
//
//

#import "materialWithCollectionViewController.h"
#import "matchMaterialViewController.h"
#import "moveFinishViewController.h"
#import "GetJsonURLString.h"
#import "ASIHTTPRequest.h"
#import "WebJsonDataGetter.h"
#import "MaterialCell.h"
#import "MFSideMenu.h"
#import "combineResultsViewController.h"


@interface materialWithCollectionViewController ()

@end

@implementation materialWithCollectionViewController

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
    array_Material=[[NSMutableArray alloc]init];
    self.array_MaterialName=[[NSArray alloc] init];
    self.array_Collection=[[NSArray alloc]init];
    dictionary_MaterialName=[[NSMutableDictionary alloc]init];
    // Create data for collection views
    // NSLog(@"count %d",[self.dataArray count]);
    /* uncomment this block to use subclassed cells*/
    [self.collection_Material registerClass:[MaterialCell class] forCellWithReuseIdentifier:@"maCell"];
    self.collection_Material.allowsMultipleSelection = YES;
    /* end of subclass-based cells block */
    
    // Configure layout
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(125, 150)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [self.collection_Material setCollectionViewLayout:flowLayout];
    
    [self setupMenuBarButtonItems];
}

-(void)doThingAfterWebJsonIsOKFromDelegate{
    self.array_Collection=[[NSArray alloc]initWithArray:webGetter.webData];
    [self.collection_Material reloadData];
}

-(void)materialSearch:(NSString*)materialTypeCase{
    webGetter = [[WebJsonDataGetter alloc]init];
    NSString *str=[NSString stringWithFormat:GetJsonURLString_Material,materialTypeCase];
    [webGetter requestWithURLString:[NSString stringWithUTF8String:[str UTF8String]]];
    [webGetter setDelegate:self];
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    self.collection_Material=nil;
    self.array_Collection=nil;
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - setup CollectionView
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    //return [self.array_Collection count];
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.array_Collection count];
    //return 1;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    // Setup cell identifier
    static NSString *cellIdentifier = @"maCell";
    //抓陣列的值
    MaterialCell *cell = (MaterialCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    
    NSString *str=[NSString stringWithFormat:@"www.google.com/icon.png"];
    NSURL *url=[[NSURL alloc]initWithString:str];
    NSData *image=[[NSData alloc]initWithContentsOfURL:url];
    cell.image_Material.image = [UIImage imageWithData:image];
    
    
    //cell.image_material.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",[[webGetter.webData objectAtIndex:indexPath.section]objectForKey:@"name"]]];
 
    if (!cell.image_Material.image) {
        cell.image_Material.image=[UIImage imageNamed:@"gamebaby"];
    }
    cell.label_Title.text=[[webGetter.webData objectAtIndex:indexPath.row]objectForKey:@"name"];
    //cell.titleLabel.text=[[array_Refrigerator objectAtIndex:indexPath.section] objectForKey:@"菜名"];
    return cell;
    
}

#pragma mark -
#pragma mark - select collectionView
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell=[collectionView cellForItemAtIndexPath:indexPath];
    MaterialCell *cell2=(MaterialCell*)cell;
    cell2.image_Material.alpha=0.5f;
    cell2.label_Title.alpha=0.5f;
    
//    NSMutableArray *arr=[[NSArray alloc]init];
    [array_Material addObject:[[self.array_Collection objectAtIndex:indexPath.row] objectForKey:@"name"]];

    if (array_Material.count==3) {
       
        combineResultsViewController *recipeView=[[combineResultsViewController alloc]initWithNibName:@"combineResultsViewController" bundle:nil ];
        //[recipeView recipesSearch:nil materialNames:array_Material];
        [self.navigationController pushViewController:recipeView animated:TRUE];
        self.collection_Material.allowsMultipleSelection = NO;

        
        
    }

    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"deselect");
    UICollectionViewCell *cell=[collectionView cellForItemAtIndexPath:indexPath];
    MaterialCell *cell2=(MaterialCell*)cell;
    cell2.image_Material.alpha=1.0f;
    cell2.label_Title.alpha=1.0f;
    
    NSString *name =[[self.array_Collection objectAtIndex:indexPath.row] objectForKey:@"name"];
//    [array_Material indexOfObject:name] => 找出name在array中的位置
    [array_Material removeObjectAtIndex:[array_Material indexOfObject:name]];
    
}

-(void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.5];
}

-(void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}


#pragma mark -
#pragma mark - UIBarButtonItems

- (void)setupMenuBarButtonItems {
    //self.navigationItem.rightBarButtonItem = [self rightMenuBarButtonItem];
    
    if(self.menuContainerViewController.menuState == MFSideMenuStateClosed &&
       ![[self.navigationController.viewControllers objectAtIndex:0] isEqual:self]) {
        self.navigationItem.leftBarButtonItem = [self backBarButtonItem];
    } else {
        self.navigationItem.leftBarButtonItem = [self leftMenuBarButtonItem];
    }
}

- (UIBarButtonItem *)leftMenuBarButtonItem {
    return [[UIBarButtonItem alloc]
            initWithImage:[UIImage imageNamed:@"menu-icon.png"] style:UIBarButtonItemStyleBordered
            target:self
            action:@selector(leftSideMenuButtonPressed:)];
}

- (UIBarButtonItem *)rightMenuBarButtonItem {
    return [[UIBarButtonItem alloc]
            initWithImage:[UIImage imageNamed:@"menu-icon.png"] style:UIBarButtonItemStyleBordered
            target:self
            action:@selector(rightSideMenuButtonPressed:)];
}

- (UIBarButtonItem *)backBarButtonItem {
    return [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back-arrow"]
                                            style:UIBarButtonItemStyleBordered
                                           target:self
                                           action:@selector(backButtonPressed:)];
}


#pragma mark -
#pragma mark - UIBarButtonItem Callbacks

- (void)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)leftSideMenuButtonPressed:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{
        [self setupMenuBarButtonItems];
    }];
}

- (void)rightSideMenuButtonPressed:(id)sender {
    [self.menuContainerViewController toggleRightSideMenuCompletion:^{
        [self setupMenuBarButtonItems];
    }];
}



@end



