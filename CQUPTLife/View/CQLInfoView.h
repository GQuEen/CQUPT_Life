//
//  CQLInfoView.h
//  CQUPTLife
//
//  Created by GQuEen on 16/11/11.
//  Copyright © 2016年 GegeChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CQLStuInfoModel.h"

@interface CQLInfoView : UIView

@property (strong, nonatomic) UIImageView *imageView;
- (instancetype)initWithFrame:(CGRect)frame withModel:(CQLStuInfoModel *)model;

@end
