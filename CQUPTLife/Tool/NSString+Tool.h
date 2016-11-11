//
//  NSString+Tool.h
//  CQUPTLife
//
//  Created by GQuEen on 16/11/11.
//  Copyright © 2016年 GegeChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Tool)
//字符串转UTF-8
+ (NSString *)stringByUTF8StringEncoding:(NSString *)url;

//GET接口参数拼接
+ (NSString *)getURLString:(NSString *)url WithSearchKey:(NSString *)searchKey page:(NSString *)page rows:(NSString *)rows;

+ (NSString *)getURLString:(NSString *)url WithStuNum:(NSString *)stuNum;
@end
