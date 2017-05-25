//
//  PlantDetial.h
//  Greenhouse
//
//  Created by 陳家錡 on 2017/5/25.
//
//

#import <UIKit/UIKit.h>
#import <RMPZoomTransitionAnimator/RMPZoomTransitionAnimator.h>
#import "VCFloatingActionButton.h"

@interface PlantDetial : UIViewController
<RMPZoomTransitionAnimating, RMPZoomTransitionDelegate, floatMenuDelegate>

@property (nonatomic) NSUInteger index;

@property (nonatomic, weak) IBOutlet UIImageView *mainImageView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UIView *wholeview;


@end
