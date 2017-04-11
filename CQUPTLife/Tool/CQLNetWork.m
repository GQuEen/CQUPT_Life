//
//  CQLNetWork.m
//  CQUPTLife
//
//  Created by GQuEen on 16/11/10.
//  Copyright © 2016年 GegeChen. All rights reserved.
//

#import "CQLNetWork.h"

@implementation CQLNetWork

static NSMutableArray<GGURLSessionTask *> *tasks;

+ (NSMutableArray *)tasks {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"创建数组");
        tasks = [[NSMutableArray alloc] init];
    });
    return tasks;
}

+ (GGURLSessionTask *)NetRequestGETWithRequestURL: (NSString *) requestURLString
                      WithParameter: (NSDictionary *) parameter
               WithReturnValeuBlock: (SucessWithJson) successFunction
                   WithFailureBlock: (FailureFunction) failureFunction {
    
    GGURLSessionTask *sessionTask = nil;
    GGWeak;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    sessionTask = [manager GET:requestURLString parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successFunction) {
            successFunction(responseObject);
        }
        [[weakSelf tasks] removeObject:sessionTask];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureFunction) {
            failureFunction();
        }
    }];
    if (sessionTask) {
        [[self tasks] addObject:sessionTask];
    }
    return sessionTask;
}

+ (GGURLSessionTask *)NetRequestPOSTWithRequestURL: (NSString *) requestURLString
                       WithParameter: (NSDictionary *) parameter
                WithReturnValeuBlock: (SucessWithJson) successFunction
                    WithFailureBlock: (FailureFunction) failureFunction {
    
    GGURLSessionTask *sessionTask = nil;
    GGWeak;
    AFHTTPSessionManager *maneger = [AFHTTPSessionManager manager];
    maneger.securityPolicy.allowInvalidCertificates = YES;
    sessionTask = [maneger POST:requestURLString parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successFunction) {
            successFunction(responseObject);
        }
        [[weakSelf tasks] removeObject:sessionTask];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureFunction) {
            failureFunction();
        }
    }];
    if (sessionTask) {
        [[self tasks] addObject:sessionTask];
    }
    return sessionTask;
}

+ (void)cancelNetReuest {
    for (int i = 0; i < tasks.count; i ++) {
        GGURLSessionTask *task = tasks[i];
        [task cancel];
    }
}

@end
