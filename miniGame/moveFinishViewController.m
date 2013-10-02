//
//  moveFinishViewController.m
//  miniGame
//
//  Created by 吳承韋 on 13/9/13.
//
//

#import "moveFinishViewController.h"
#import "CVCell.h"
#import "PlsitRead.h"
#import "materialViewController.h"
@interface moveFinishViewController ()

@end

@implementation moveFinishViewController

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
    PlsitRead *readPlist=[[PlsitRead alloc] initWithFileName:@"Property List.plist"];
    array_Refrigerator=[readPlist readFromFile];
    origin_Refrigerator = array_Refrigerator;
    
    // Create data for collection views
    self.dataArray = [[NSArray alloc] initWithArray:origin_Refrigerator];
    NSLog(@"count %d",[self.dataArray count]);
    /* uncomment this block to use subclassed cells*/
    [self.collectionView registerClass:[CVCell class] forCellWithReuseIdentifier:@"cvCell"];
    /* end of subclass-based cells block */
    
    // Configure layout
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(200, 200)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [self.collectionView setCollectionViewLayout:flowLayout];

    
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    self.collectionView = nil;
    self.dataArray = nil;

    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.dataArray count];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //    NSMutableArray *sectionArray = [self.dataArray objectAtIndex:section];
    //    return [sectionArray count];
    return 1;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // Setup cell identifier
    static NSString *cellIdentifier = @"cvCell";
    //抓陣列的值
    CVCell *cell = (CVCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.image_recipe.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",[[array_Refrigerator objectAtIndex:indexPath.section] objectForKey:@"菜名"]]];
    if (!cell.image_recipe.image) {
        cell.image_recipe.image=[UIImage imageNamed:@"Cell 0.jpg"];
    }
    cell.titleLabel.text=[[array_Refrigerator objectAtIndex:indexPath.section] objectForKey:@"菜名"];
    return cell;
    
}

//select collectView
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    materialViewController*Cookview=[[materialViewController alloc]initWithNibName:@"materialViewController" bundle:nil ];
    Cookview.rec=[[Recipes alloc] initWithIndex:indexPath.row];
    Cookview.dictionary_Cook=[array_Refrigerator objectAtIndex:indexPath.row];
    [Cookview setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    
    [self.navigationController pushViewController:Cookview animated:YES];//navigation連結頁面
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"deselect");
}

-(void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.5];
}

-(void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = nil;
}

@end
