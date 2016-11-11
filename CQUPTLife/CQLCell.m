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
        self.selectionStyle = UITableViewCellSelectionStyleNone;
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
    
    _sexImageView = [[UIImageView alloc]init];
    
    
    _gradeLabel = [[UILabel alloc]init];
    _gradeLabel.textColor = [UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1];
    _gradeLabel.font = [UIFont systemFontOfSize:13];
    
    [self.contentView addSubview:_backView];
    [self.backView addSubview:_nameLabel];
    [self.backView addSubview:_collegeLabel];
    [self.backView addSubview:_sexImageView];
    [self.backView addSubview:_gradeLabel];
    
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    
    if (highlighted) {
        _backView.backgroundColor = [UIColor colorWithRed:230/255.0 green:231/255.0 blue:232/255.0 alpha:1];
    }else {
        _backView.backgroundColor = [UIColor whiteColor];
    }
}

- (void)setModel:(CQLStuInfoModel *)model {
    _model = model;
    
    _nameLabel.text = model.stuName;
    [_nameLabel sizeToFit];
    
    if ([model.stuSex isEqualToString:@"男"]) {
        _sexImageView.image = [UIImage imageNamed:@"性别男.png"];
    }else if ([model.stuSex isEqualToString:@"女"]) {
        _sexImageView.image = [UIImage imageNamed:@"性别女.png"];
    }
    
    _collegeLabel.text = model.stuCollege;
    [_collegeLabel sizeToFit];
    
    _gradeLabel.text = model.stuGrade;
    [_gradeLabel sizeToFit];
    
    _nameLabel.frame = (CGRect){{20,20},_nameLabel.frame.size};
    _collegeLabel.frame = (CGRect){{20, _backView.frame.size.height - _collegeLabel.frame.size.height-20},_collegeLabel.frame.size};
    _gradeLabel.frame = (CGRect){{_backView.frame.size.width-_gradeLabel.frame.size.width-20, _backView.frame.size.height-_gradeLabel.frame.size.height-20},_gradeLabel.frame.size};
    _sexImageView.frame = (CGRect){{_backView.frame.size.width-39, 20}, {19, 19}};

}



@end
