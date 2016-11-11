//
//  CQLStuInfoModel.m
//  CQUPTLife
//
//  Created by GQuEen on 16/11/10.
//  Copyright © 2016年 GegeChen. All rights reserved.
//

#import "CQLStuInfoModel.h"

@implementation CQLStuInfoModel

- (instancetype)initWithDictionary:(NSDictionary *)dic {

    if (self = [super init]) {
        self.stuName = dic[@"xm"] ?: @"";
        self.stuNum = dic[@"xh"] ?: @"";
        self.stuSex = dic[@"xb"] ?: @"";
        self.stuGrade = dic[@"nj"] ?: @"";
        self.classNum = dic[@"bj"] ?: @"";
        self.stuCollege = dic[@"yxm"] ?: @"";
        self.stuCollegeNum = dic[@"yxh"] ?: @"";
        self.stuMajor = dic[@"zym"] ?: @"";
        self.stuMajorNum = dic[@"zyh"] ?: @"";
    }
    return self;
}

- (NSString *)description {

    NSString *result = @"";
    result = [result stringByAppendingFormat:@"姓名 : %@\n",self.stuName];
    result = [result stringByAppendingFormat:@"学号 : %@\n",self.stuNum];
    result = [result stringByAppendingFormat:@"性别 : %@\n",self.stuSex];
    result = [result stringByAppendingFormat:@"年级 : %@\n",self.stuGrade];
    result = [result stringByAppendingFormat:@"班级代号 : %@\n",self.classNum];
    result = [result stringByAppendingFormat:@"学院 : %@\n",self.stuCollege];
    result = [result stringByAppendingFormat:@"学院代号 : %@\n",self.stuCollegeNum];
    result = [result stringByAppendingFormat:@"专业 : %@\n",self.stuMajor];
    result = [result stringByAppendingFormat:@"专业号 : %@\n",self.stuMajorNum];
    
    
    return result;
}
@end
