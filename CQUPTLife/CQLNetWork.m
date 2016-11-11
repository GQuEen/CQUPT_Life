//
//  CQLNetWork.m
//  CQUPTLife
//
//  Created by GQuEen on 16/11/10.
//  Copyright © 2016年 GegeChen. All rights reserved.
//

#import "CQLNetWork.h"

@implementation CQLNetWork

+ (void)NetRequestGETWithRequestURL: (NSString *) requestURLString
                      WithParameter: (NSDictionary *) parameter
               WithReturnValeuBlock: (SucessWithJson) successFunction
                   WithFailureBlock: (FailureFunction) failureFunction {
    AFHTTPSessionManager *maneger = [AFHTTPSessionManager manager];
    [maneger GET:requestURLString parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successFunction) {
            successFunction(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureFunction) {
            failureFunction();
        }
    }];
}

+ (void)NetRequestPOSTWithRequestURL: (NSString *) requestURLString
                       WithParameter: (NSDictionary *) parameter
                WithReturnValeuBlock: (SucessWithJson) successFunction
                    WithFailureBlock: (FailureFunction) failureFunction {
    AFHTTPSessionManager *maneger = [AFHTTPSessionManager manager];
    [maneger POST:requestURLString parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successFunction) {
            successFunction(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureFunction) {
            failureFunction();
        }
    }];
}

@end
