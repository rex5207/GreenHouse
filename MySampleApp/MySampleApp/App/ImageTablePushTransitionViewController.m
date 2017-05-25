//
//  ImageTablePushTransitionViewController.m
//  Greenhouse
//
//  Created by 陳家錡 on 2017/5/25.
//
//

#import "ImageTablePushTransitionViewController.h"
#import "PlantTableCell.h"

@interface ImageTablePushTransitionViewController ()

@end

@implementation ImageTablePushTransitionViewController

- (UIImageView *)transitionSourceImageView
{
    NSIndexPath *selectedIndexPath = [self.PlantList indexPathForSelectedRow];
    PlantTableCell *cell = (PlantTableCell *)[self.PlantList cellForRowAtIndexPath:selectedIndexPath];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:cell.PlantImage.image];
    imageView.contentMode = cell.PlantImage.contentMode;
    imageView.clipsToBounds = YES;
    imageView.userInteractionEnabled = NO;
    CGRect frameInSuperview = [cell.PlantImage convertRect:cell.PlantImage.frame toView:self.PlantList.superview];
    frameInSuperview.origin.x -= cell.layoutMargins.left;
    frameInSuperview.origin.y -= cell.layoutMargins.top;
    imageView.frame = frameInSuperview;
    return imageView;
}

- (UIColor *)transitionSourceBackgroundColor
{
    return self.PlantList.backgroundColor;
}

- (CGRect)transitionDestinationImageViewFrame
{
    NSIndexPath *selectedIndexPath = [self.PlantList indexPathForSelectedRow];
    PlantTableCell *cell = (PlantTableCell *)[self.PlantList cellForRowAtIndexPath:selectedIndexPath];
    CGRect frameInSuperview = [cell.PlantImage convertRect:cell.PlantImage.frame toView:self.PlantList.superview];
    frameInSuperview.origin.x -= cell.layoutMargins.left;
    frameInSuperview.origin.y -= cell.layoutMargins.top;
    return frameInSuperview;
}


@end
