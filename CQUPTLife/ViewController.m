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

@interface ViewController () <UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
@property (strong,nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) UITableView *tableView;

//@property (strong, nonatomic) CQLStuInfoModel *model;
@property (strong, nonatomic) NSMutableArray<CQLStuInfoModel *> *modelArray;

@property (copy, nonatomic) NSString *currentUrl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //导航设置
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    self.navigationController.navigationBar.barTintColor = MAIN_COLOR;
    
    //搜索框
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 66, MAIN_SCREEN_W, 44)];
    _searchBar.placeholder = @"请输入姓名或者学号";
    _searchBar.tintColor = MAIN_COLOR;
    _searchBar.delegate = self;
    
    self.navigationItem.titleView = self.searchBar;
    
    [self.view addSubview:self.tableView];
    _tableView.hidden = YES;
    // Do any additional setup after loading the view, typically from a nib.
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, MAIN_SCREEN_W, MAIN_SCREEN_H-64) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1];
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
    return _modelArray.count;
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
    cell.model = self.modelArray[indexPath.section];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (_searchBar.isFirstResponder) {
       [_searchBar resignFirstResponder];
    }
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([_searchBar.text isEqualToString:@""]) {
        _tableView.hidden = YES;
    }else {
        [self NetWorkWithSearchKey:searchText page:@"1" rows:@"20"];
//        _tableView.hidden = NO;
    }
}
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {

    if ([text isEqualToString:@"\n"]) {
        NSLog(@"点了回车");
        [_searchBar resignFirstResponder];
    }
    return YES;
    
}

- (void)NetWorkWithSearchKey:(NSString *)searchKey page:(NSString *)page rows:(NSString *)rows {
    //取消所有请求
    [CQLNetWork cancelNetReuest];
    //进行新的请求
    GGWeak;
    NSString *URL = [NSString getURLString:STUINFO_API WithSearchKey:searchKey page:page rows:rows];
    
    [CQLNetWork NetRequestGETWithRequestURL:URL WithParameter:nil WithReturnValeuBlock:^(id returnValue) {
        weakSelf.modelArray = [NSMutableArray array];
        weakSelf.currentUrl = URL;
        NSLog(@"请求完成");
        for (int i = 0; i < ((NSArray *)returnValue[@"rows"]).count; i ++) {
            CQLStuInfoModel *model = [[CQLStuInfoModel alloc]initWithDictionary:returnValue[@"rows"][i]];
            [weakSelf.modelArray addObject:model];
        }
        
//        NSLog(@"%@",_model);
        weakSelf.tableView.hidden = NO;
        [weakSelf.tableView reloadData];
    } WithFailureBlock:^{
        NSLog(@"请求错误");
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_searchBar resignFirstResponder];
}


@end
