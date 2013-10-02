//
//  Copyright (c) 2013 Luke Scott
//  https://github.com/lukescott/TimelineView
//  Distributed under MIT license
//

#import "TimelineViewCell.h"

@interface SampleTimelineViewCell : TimelineViewCell

@property (readonly, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UILabel *recipeName;
@property (strong, nonatomic) IBOutlet UILabel *latestTime;
@property (strong, nonatomic) IBOutlet UILabel *friendName;
@property (strong, nonatomic) IBOutlet UILabel *shareContent;
@property (strong, nonatomic) IBOutlet UIImageView *recipeImage;
@property (strong, nonatomic) UIColor *color;
@end
