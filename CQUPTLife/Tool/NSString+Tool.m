//
//  NSString+Tool.m
//  CQUPTLife
//
//  Created by GQuEen on 16/11/11.
//  Copyright © 2016年 GegeChen. All rights reserved.
//

#import "NSString+Tool.h"

@implementation NSString (Tool)

+ (NSString *)stringByUTF8StringEncoding:(NSString *)url {
    NSString *URLString = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    return URLString;
}

+ (NSString *)getURLString:(NSString *)url WithSearchKey:(NSString *)searchKey page:(NSString *)page rows:(NSString *)rows {

    NSString *newUrl = [NSString stringWithFormat:@"%@&searchKey=%@",url,searchKey];
    newUrl = [NSString stringWithFormat:@"%@&page=%@",newUrl,page];
    newUrl = [NSString stringWithFormat:@"%@&rows=%@",newUrl,rows];
    
    //转UTF-8
    NSString *URLString = [newUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    return URLString;
}
+ (NSString *)getURLString:(NSString *)url WithStuNum:(NSString *)stuNum{
    NSString *newUrl = [NSString stringWithFormat:@"%@%@.JPG",url,stuNum];
    
    //转UTF-8
    NSString *URLString = [newUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    return URLString;
}
@end
