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
    NSLog(@"%@-",URL);
    [CQLNetWork NetRequestGETWithRequestURL:URL WithParameter:nil WithReturnValeuBlock:^(id returnValue) {
        UIImage *image = [UIImage imageWithData:returnValue];
        infoView.imageView.image = image;
        
    } WithFailureBlock:^{
        NSLog(@"照片请求错误");
    }];
    
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
