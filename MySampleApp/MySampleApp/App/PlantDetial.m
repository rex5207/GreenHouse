//
//  PlantDetial.m
//  Greenhouse
//
//  Created by 陳家錡 on 2017/5/25.
//
//

#import "PlantDetial.h"
#import <SCLAlertView_Objective_C/SCLAlertView.h>

@interface PlantDetial ()
@property (strong, nonatomic) VCFloatingActionButton *addButton;
@end
static NSArray *actiontype;
static NSArray *actioninfo;
@implementation PlantDetial

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addfloatbutton];
    actiontype = [NSArray arrayWithObjects:@"灑水管理",@"照明管理",@"溫度管理",@"照相頻率", nil];
    actioninfo = [NSArray arrayWithObjects:@"當盆栽濕度小於\n設定值時將自動灑水",
                                           @"當盆栽光度小於\n設定值時將自動照明",
                                           @"當盆栽溫度大於\n設定值時將自動降溫",
                                           @"定期拍照頻率 (1/3/5/7) 天", nil];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <RMPZoomTransitionAnimating>

- (UIImageView *)transitionSourceImageView
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self.mainImageView.image];
    imageView.contentMode = self.mainImageView.contentMode;
    imageView.clipsToBounds = YES;
    imageView.userInteractionEnabled = NO;
    imageView.frame = self.mainImageView.frame;
    return imageView;
}

- (UIColor *)transitionSourceBackgroundColor
{
    return self.view.backgroundColor;
}

- (CGRect)transitionDestinationImageViewFrame
{
    CGFloat width = CGRectGetWidth(self.view.frame);
    CGRect frame = self.mainImageView.frame;
    frame.size.width = width;
    return frame;
}

#pragma mark - <RMPZoomTransitionDelegate>

- (void)zoomTransitionAnimator:(RMPZoomTransitionAnimator *)animator
         didCompleteTransition:(BOOL)didComplete
      animatingSourceImageView:(UIImageView *)imageView
{
    self.mainImageView.image = imageView.image;
}

- (void)addfloatbutton {
    CGRect floatFrame = CGRectMake([UIScreen mainScreen].bounds.size.width - 44 - 20, [UIScreen mainScreen].bounds.size.height - 44 - 20, 44, 44);
    
    _addButton = [[VCFloatingActionButton alloc]initWithFrame:floatFrame normalImage:[UIImage imageNamed:@"plus"] andPressedImage:[UIImage imageNamed:@"cross"] withScrollview:nil];
    
    _addButton.imageArray = @[@"water_icon2",@"bulb_icon2",@"temp_icon2",@"cam_icon2"];
    _addButton.labelArray = @[@"灑水管理",@"照明管理",@"溫度管理",@"照相頻率"];
    
    
    
    _addButton.hideWhileScrolling = YES;
    _addButton.delegate = self;
    
    
    [self.wholeview addSubview:_addButton];
}

-(void) didSelectMenuOptionAtIndex:(NSInteger)row
{
    NSLog(@"Floating action tapped index %tu",row);
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    alert.shouldDismissOnTapOutside = YES;
    
    UITextField *textField = [alert addTextField:@""];
    [alert addButton:@"Setting" actionBlock:^(void) {
        NSLog(@"Text value: %@", textField.text);
    }];
    
    [alert showEdit:self title:[actiontype objectAtIndex:row] subTitle:[actioninfo objectAtIndex:row] closeButtonTitle:nil duration:0.0f];
}


#pragma mark -

- (IBAction)closeButtonDidPush:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
