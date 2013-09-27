//
//  procedureStepViewController.h
//  miniGame
//
//  Created by BirdChiu on 13/9/24.
//
//

#import <UIKit/UIKit.h>
#import "LBYouTube.h"


@interface procedureStepViewController : UIViewController<LBYouTubePlayerControllerDelegate>


-(void)getRecipeStep:(NSArray *)recipeStep;
- (IBAction)button_back:(id)sender ;
- (IBAction)button_VideoTeaching:(id)sender;




// Empty view that holds the image and description
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

// Empty view that holds the image and description
@property (weak, nonatomic) IBOutlet UIView *contentArea;

// White border for movie image (to give it a Polaroid look)
@property (weak, nonatomic) IBOutlet UIView *imageFrame;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UITextView *descriptionField;

// Index of the movie (1 - 3)
@property (assign, nonatomic) NSUInteger movieIndex;

@property (assign, nonatomic, getter = isRotating) BOOL rotating;
//@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong,nonatomic)LBYouTubePlayerViewController *videoPlayerController;

@property (nonatomic, strong) NSArray *array_Items;
@property (nonatomic) NSInteger step;

@end

