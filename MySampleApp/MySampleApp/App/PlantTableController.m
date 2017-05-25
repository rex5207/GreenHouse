//
//  PlantTableController.m
//  Greenhouse
//
//  Created by 陳家錡 on 2017/5/25.
//
//

#import "PlantTableController.h"
#import "PlantTableCell.h"
#import "PlantDetial.h"

@interface PlantTableController ()<UITableViewDelegate, UITableViewDataSource>

@end

static NSArray *plantName;

@implementation PlantTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor
                                                            colorWithRed:0.0
                                                            green:0.47843
                                                            blue:0.8
                                                            alpha:0.8];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.navigationController.navigationBar.translucent = NO;
    self.PlantList.delegate = self;
    self.PlantList.dataSource = self;
    plantName = [NSArray arrayWithObjects:@"Plant 1", @"Plant 2", @"Plant 3", @"Plant 4", @"Plant 5", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [plantName count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 創建一個cellID，用於cell的重用
    NSString *cellID = @"PlantTableCell";
    // 從tableview的重用池裏通過cellID取一個cell
    PlantTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:cellID owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.PlantImage.image = [UIImage imageNamed:[plantName objectAtIndex:indexPath.row]];
    cell.PlantName.text = [plantName objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 133;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PlantDetial *tagEditor = [self.storyboard instantiateViewControllerWithIdentifier:@"PlantDetial"];
    //            [self presentViewController:tagEditor animated:YES completion:nil];
    [[self navigationController] pushViewController:tagEditor animated:YES];}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    PlantDetial *vc = segue.destinationViewController;
    NSIndexPath *selectedIndexPath = [self.PlantList indexPathForSelectedRow];
    vc.index = selectedIndexPath.row;
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}


- (void) viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden=NO;
}

@end
