//
//  ViewController.m
//  CQUPTLife
//
//  Created by GQuEen on 16/11/10.
//  Copyright © 2016年 GegeChen. All rights reserved.
//

#import "ViewController.h"
#import "CQLStuInfoModel.h"
#import "CQLCell.h"

/*
 *
 *          ┌─┐       ┌─┐
 *       ┌──┘ ┴───────┘ ┴──┐
 *       │                 │
 *       │       ───       │
 *       │  ─┬┘       └┬─  │
 *       │                 │
 *       │       ─┴─       │
 *       │                 │
 *       └───┐         ┌───┘
 *           │         │
 *           │         │
 *           │         │
 *           │         └──────────────┐
 *           │                        │
 *           │                        ├─┐
 *           │                        ┌─┘
 *           │                        │
 *           └─┐  ┐  ┌───────┬──┐  ┌──┘
 *             │ ─┤ ─┤       │ ─┤ ─┤
 *             └──┴──┘       └──┴──┘
 *                 神兽保佑
 *                 代码无BUG!
 */

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) CQLStuInfoModel *model;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //导航设置
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    self.navigationController.navigationBar.barTintColor = MAIN_COLOR;
    
    
    __weak typeof(self) weakSelf = self;
    
    [CQLNetWork NetRequestGETWithRequestURL:@"https://jwzx.cqupt.congm.in/jwzxtmp/data/json_studentList.php?dirId=&searchKey=2014213071&page=1&rows=20" WithParameter:nil WithReturnValeuBlock:^(id returnValue) {

        
        _model = [[CQLStuInfoModel alloc]initWithDictionary:returnValue[@"rows"][0]];
        NSLog(@"%@",_model);
        
        [weakSelf.view addSubview:weakSelf.tableView];
        
    } WithFailureBlock:^{
         NSLog(@"请求错误");
    }];
    //搜索框
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 66, MAIN_SCREEN_W, 44)];
    _searchBar.placeholder = @"请输入姓名或者学号";
    _searchBar.tintColor = MAIN_COLOR;
    self.navigationItem.titleView = self.searchBar;
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, MAIN_SCREEN_W, MAIN_SCREEN_H-64) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.sectionHeaderHeight = 0;
        _tableView.sectionFooterHeight = 0;
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    }
    return _tableView;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.00001;
    }else {
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 105;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CQLCell *cell = [CQLCell cellWithTableView:tableView];
    cell.model = self.model;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//    CQLCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    cell.backView.backgroundColor = [UIColor whiteColor];
    
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
//    CQLCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    
//    cell.backView.backgroundColor = [UIColor colorWithRed:230/255.0 green:231/255.5 blue:232/255.0 alpha:1];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (_searchBar.isFirstResponder) {
       [_searchBar resignFirstResponder];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_searchBar resignFirstResponder];
}

@end
