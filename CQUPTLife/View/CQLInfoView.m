//
//  CQLInfoView.m
//  CQUPTLife
//
//  Created by GQuEen on 16/11/11.
//  Copyright © 2016年 GegeChen. All rights reserved.
//

#import "CQLInfoView.h"


@interface CQLInfoView ()

@property (strong, nonatomic) CQLStuInfoModel *model;

@property (strong, nonatomic) UIImageView *backView;


@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *stuNumLabel;
@property (strong, nonatomic) UIImageView *sexImageView;

@property (strong, nonatomic) UILabel *collegeLabel;
@property (strong, nonatomic) UILabel *collegeInfoLabel;

@property (strong, nonatomic) UILabel *classLabel;
@property (strong, nonatomic) UILabel *classInfoLabel;

@property (strong, nonatomic) UILabel *majorLabel;
@property (strong, nonatomic) UILabel *majorInfoLabel;

@end

@implementation CQLInfoView

- (instancetype)initWithFrame:(CGRect)frame withModel:(CQLStuInfoModel *)model {
    if (self = [super init]) {
        _model = model;
        
        _backView = [[UIImageView alloc]initWithFrame:frame];
        _backView.image = [UIImage imageNamed:@"BackImage"];
        [self addSubview:self.backView];
        [self setupUi];
    }
    return self;
}

- (void)setupUi {
    
    CGFloat magin;
    CGFloat betweenMagin;
    CGFloat bottomMagin;
    if (MAIN_SCREEN_W == 320) {
        magin = 30;
        betweenMagin = 30;
        bottomMagin = 50;
    }else if (MAIN_SCREEN_W == 375) {
        magin = 40;
        betweenMagin = 35;
        bottomMagin = 80;
    }else if (MAIN_SCREEN_W == 414) {
        magin = 45;
        betweenMagin = 40;
        bottomMagin = 90;
    }
    
    _imageView = [[UIImageView alloc]init];
    _nameLabel = [[UILabel alloc]init];
    _stuNumLabel = [[UILabel alloc]init];
    _sexImageView = [[UIImageView alloc]init];
    _collegeLabel = [[UILabel alloc]init];
    _collegeInfoLabel = [[UILabel alloc]init];
    _classLabel = [[UILabel alloc]init];
    _classInfoLabel = [[UILabel alloc]init];
    _majorLabel = [[UILabel alloc]init];
    _majorInfoLabel = [[UILabel alloc]init];
    
    _nameLabel.font = [UIFont systemFontOfSize:20];
    _stuNumLabel.font = [UIFont systemFontOfSize:16];
    _collegeLabel.font = [UIFont systemFontOfSize:16];
    _collegeInfoLabel.font = [UIFont systemFontOfSize:16];
    _majorLabel.font = [UIFont systemFontOfSize:16];
    _majorInfoLabel.font = [UIFont systemFontOfSize:16];
    _classLabel.font = [UIFont systemFontOfSize:16];
    _classInfoLabel.font = [UIFont systemFontOfSize:16];
    
    _nameLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    _collegeInfoLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    _majorInfoLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    _classInfoLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    
    _stuNumLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    _collegeLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    _majorLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    _classLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    
    _imageView.layer.shadowOffset = CGSizeMake(1, 1);
    _imageView.layer.cornerRadius = 1;
    _imageView.layer.shadowColor = [UIColor colorWithRed:198/255.0f green:199/255.0f blue:200/255.0f alpha:1].CGColor;
    _imageView.layer.shadowRadius = 2;
    _imageView.layer.shadowOpacity = 1;
    
    _nameLabel.text = self.model.stuName;
    _stuNumLabel.text = self.model.stuNum;
    if ([_model.stuSex isEqualToString:@"男"]) {
        _sexImageView.image = [UIImage imageNamed:@"Male"];
    }else if ([_model.stuSex isEqualToString:@"女"]) {
        _sexImageView.image = [UIImage imageNamed:@"Famale"];
    }
    _collegeLabel.text = @"学院";
    _majorLabel.text = @"专业";
    _classLabel.text = @"班级";
    
    _collegeInfoLabel.text = self.model.stuCollege;
    _majorInfoLabel.text = self.model.stuMajor;
    _classInfoLabel.text = self.model.classNum;
    
    [_nameLabel sizeToFit];
    [_stuNumLabel sizeToFit];
    [_collegeLabel sizeToFit];
    [_majorLabel sizeToFit];
    [_classLabel sizeToFit];
    
    [_collegeInfoLabel sizeToFit];
    [_majorInfoLabel sizeToFit];
    [_classInfoLabel sizeToFit];
    
//    _imageView.frame = (CGRect){{40,40},{0,0}};
    
    _classInfoLabel.frame = (CGRect){{magin,CGRectGetMaxY(_backView.frame)-_classInfoLabel.frame.size.height-bottomMagin},{_classInfoLabel.frame.size.width,_classInfoLabel.frame.size.height}};
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(magin, CGRectGetMinY(_classInfoLabel.frame)-10, 70, 1)];
    view1.backgroundColor = [UIColor colorWithRed:218/255.0 green:218/255.0 blue:218/255.0 alpha:1];
    
    _classLabel.frame = (CGRect){{magin,CGRectGetMinY(view1.frame)-10-_classLabel.frame.size.height},{_classLabel.frame.size.width,_classLabel.frame.size.height}};
    
    _majorInfoLabel.frame = (CGRect){{magin,CGRectGetMinY(_classLabel.frame)-_majorInfoLabel.frame.size.height-betweenMagin},{_majorInfoLabel.frame.size.width,_majorInfoLabel.frame.size.height}};
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(magin, CGRectGetMinY(_majorInfoLabel.frame)-10, 70, 1)];
    view2.backgroundColor = [UIColor colorWithRed:218/255.0 green:218/255.0 blue:218/255.0 alpha:1];
    _majorLabel.frame = (CGRect){{magin,CGRectGetMinY(view2.frame)-10-_majorLabel.frame.size.height},{_majorLabel.frame.size.width,_majorLabel.frame.size.height}};
    
    _collegeInfoLabel.frame = (CGRect){{magin,CGRectGetMinY(_majorLabel.frame)-_collegeInfoLabel.frame.size.height-betweenMagin},{_collegeInfoLabel.frame.size.width,_collegeInfoLabel.frame.size.height}};
    UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(magin, CGRectGetMinY(_collegeInfoLabel.frame)-10, 70, 1)];
    view3.backgroundColor = [UIColor colorWithRed:218/255.0 green:218/255.0 blue:218/255.0 alpha:1];
    _collegeLabel.frame = (CGRect){{magin,CGRectGetMinY(view3.frame)-10-_collegeLabel.frame.size.height},{_collegeLabel.frame.size.width,_collegeLabel.frame.size.height}};
    
    _nameLabel.frame = (CGRect){{CGRectGetMaxX(_backView.frame)-115-magin,magin},{_nameLabel.frame.size.width,_nameLabel.frame.size.height}};
    UIView *view4 = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMinX(_nameLabel.frame), CGRectGetMaxY(_nameLabel.frame)+10, 115, 1)];
    view4.backgroundColor = [UIColor colorWithRed:218/255.0 green:218/255.0 blue:218/255.0 alpha:1];
    
    _stuNumLabel.frame = (CGRect){{CGRectGetMinX(_nameLabel.frame),CGRectGetMaxY(view4.frame)+15},{_stuNumLabel.frame.size.width,_stuNumLabel.frame.size.height}};
    
    _sexImageView.frame = (CGRect){{CGRectGetMinX(_nameLabel.frame),CGRectGetMaxY(_stuNumLabel.frame)+15},{19,19}};
    
    _imageView.frame = (CGRect){{magin,magin},{CGRectGetMinX(_nameLabel.frame)-magin*2,CGRectGetMinY(_collegeLabel.frame)-magin-betweenMagin}};
    
    
    [_backView addSubview:self.imageView];
    [_backView addSubview:self.nameLabel];
    [_backView addSubview:view4];
    [_backView addSubview:self.stuNumLabel];
    [_backView addSubview:self.sexImageView];
    [_backView addSubview:self.collegeLabel];
    [_backView addSubview:view3];
    [_backView addSubview:self.collegeInfoLabel];
    [_backView addSubview:self.majorLabel];
    [_backView addSubview:view2];
    [_backView addSubview:self.majorInfoLabel];
    [_backView addSubview:self.classLabel];
    [_backView addSubview:view1];
    [_backView addSubview:self.classInfoLabel];
    
}

@end
