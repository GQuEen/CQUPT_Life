//
//  CQLInfoViewController.m
//  CQUPTLife
//
//  Created by GQuEen on 16/11/10.
//  Copyright © 2016年 GegeChen. All rights reserved.
//

#import "CQLInfoViewController.h"
#import "CQLInfoView.h"
@interface CQLInfoViewController ()

@end

@implementation CQLInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = MAIN_COLOR;
    self.title = @"详细信息";
    
    CQLInfoView *infoView = [[CQLInfoView alloc]initWithFrame:CGRectMake(0, 0, MAIN_SCREEN_W, MAIN_SCREEN_H-64) withModel:self.model];
    [self.view addSubview:infoView];
    
    NSString *URL = [NSString getURLString:PHOTO_API WithStuNum:self.model.stuNum];
    NSArray *strings = @[@"2014213071",@"2015211097"];
    if ([strings containsObject:self.model.stuNum]) {
        if ([self.model.stuNum isEqualToString:@"2014213071"]) {
            infoView.imageView.image = [UIImage imageNamed:@"Photo_GG"];
        }else if ([self.model.stuNum isEqualToString:@"2015211097"]) {
            infoView.imageView.image = [UIImage imageNamed:@"Photo_JJ"];
        }
    }else {
        [infoView.imageView sd_setImageWithURL:[NSURL URLWithString:URL] placeholderImage:[UIImage imageNamed:@"Photo"]];
    }
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
