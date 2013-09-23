//
//  procedureWithLeavesView.m
//  miniGame
//
//  Created by BirdChiu on 13/9/23.
//
//

#import "procedureWithLeavesView.h"

@implementation procedureWithLeavesView

#pragma mark LeavesViewDataSource methods

- (NSUInteger)numberOfPagesInLeavesView:(LeavesView*)leavesView {
	return 3;
}

- (void)renderPageAtIndex:(NSUInteger)index inContext:(CGContextRef)ctx {
	CGRect bounds = CGContextGetClipBoundingBox(ctx);
	CGContextSetFillColorWithColor(ctx, [[UIColor colorWithHue:index/10.0
													saturation:0.8
													brightness:0.8
														 alpha:1.0] CGColor]);
	CGContextFillRect(ctx, CGRectInset(bounds, 100, 100));
}


@end
