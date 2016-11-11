//
//  CQLStuInfoModel.h
//  CQUPTLife
//
//  Created by GQuEen on 16/11/10.
//  Copyright © 2016年 GegeChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CQLStuInfoModel : NSObject

@property (copy,nonatomic) NSString *classNum;//班级代号
@property (copy,nonatomic) NSString *stuName;//姓名
@property (copy,nonatomic) NSString *stuSex;//性别
@property (copy,nonatomic) NSString *stuMajorNum;//专业号
@property (copy,nonatomic) NSString *stuMajor;//专业
@property (copy,nonatomic) NSString *stuCollegeNum;//学院号
@property (copy,nonatomic) NSString *stuCollege;//学院
@property (copy,nonatomic) NSString *stuGrade;//年级
@property (copy,nonatomic) NSString *stuNum;//学号

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
