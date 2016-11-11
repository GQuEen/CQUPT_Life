//
//  CQLCell.h
//  CQUPTLife
//
//  Created by GQuEen on 16/11/10.
//  Copyright © 2016年 GegeChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CQLStuInfoModel.h"

@interface CQLCell : UITableViewCell

@property (strong, nonatomic) CQLStuInfoModel *model;
@property (strong, nonatomic) UIView *backView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *collegeLabel;
@property (strong, nonatomic) UIImageView *sexImageView;
@property (strong, nonatomic) UILabel *gradeLabel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
