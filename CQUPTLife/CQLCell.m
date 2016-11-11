//
//  CQLCell.m
//  CQUPTLife
//
//  Created by GQuEen on 16/11/10.
//  Copyright © 2016年 GegeChen. All rights reserved.
//

#import "CQLCell.h"

@implementation CQLCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadContentView];
        self.contentView.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1];
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *identify = @"CQLCell";
    CQLCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil)
    {
        cell = [[CQLCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    return cell;
}

- (void)loadContentView {
    _backView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, MAIN_SCREEN_W-20, 95)];
    _backView.backgroundColor = [UIColor whiteColor];
    _backView.layer.shadowOffset = CGSizeMake(1, 1);
    _backView.layer.cornerRadius = 1;
    _backView.layer.shadowColor = [UIColor colorWithRed:198/255.0f green:199/255.0f blue:200/255.0f alpha:1].CGColor;
    _backView.layer.shadowRadius = 2;
    _backView.layer.shadowOpacity = 1;
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.textColor = [UIColor colorWithRed:57/255.0f green:57/255.0f blue:57/255.0f alpha:1];
    _nameLabel.font = [UIFont systemFontOfSize:16];
    
    _collegeLabel = [[UILabel alloc]init];
    _collegeLabel.textColor = [UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1];
    _collegeLabel.font = [UIFont systemFontOfSize:13];
    
    _sexImageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_backView.frame)-38, 30, 19, 19)];
    
    
    _gradeLabel = [[UILabel alloc]init];
    _gradeLabel.textColor = [UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1];
    _gradeLabel.font = [UIFont systemFontOfSize:13];
    
    [self.contentView addSubview:_backView];
    [self.contentView addSubview:_nameLabel];
    [self.contentView addSubview:_collegeLabel];
    [self.contentView addSubview:_sexImageView];
    [self.contentView addSubview:_gradeLabel];
    
}

- (void)setModel:(CQLStuInfoModel *)model {
    _model = model;
    _nameLabel.text = model.stuName;
    _nameLabel.frame = CGRectMake(30, 30, 0, 0);
    [_nameLabel sizeToFit];
    
    if ([model.stuSex isEqualToString:@"男        "]) {
        _sexImageView.image = [UIImage imageNamed:@"性别男.png"];
    }else if ([model.stuSex isEqualToString:@"女        "]) {
        _sexImageView.image = [UIImage imageNamed:@"性别女.png"];
    }
    
    _collegeLabel.text = model.stuCollege;
    _collegeLabel.frame = CGRectMake(30, CGRectGetMaxY(_backView.frame) - 35, 0, 0);
    [_collegeLabel sizeToFit];
    
    _gradeLabel.text = model.stuGrade;
    _gradeLabel.frame = CGRectMake(CGRectGetMaxX(_backView.frame)-50, _collegeLabel.frame.origin.y, 0, 0);
    [_gradeLabel sizeToFit];
}



@end
