//
//  CQLNetWork.h
//  CQUPTLife
//
//  Created by GQuEen on 16/11/10.
//  Copyright © 2016年 GegeChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CQLNetWork : NSObject

@property (strong, nonatomic) AFHTTPSessionManager *manager;

typedef void (^SucessWithJson) (id returnValue);
typedef void (^FailureFunction)();

typedef NSURLSessionTask GGURLSessionTask;

+ (GGURLSessionTask *)NetRequestGETWithRequestURL: (NSString *) requestURLString
                      WithParameter: (NSDictionary *) parameter
               WithReturnValeuBlock: (SucessWithJson) successFunction
                   WithFailureBlock: (FailureFunction) failureFunction;

+ (GGURLSessionTask *)NetRequestPOSTWithRequestURL: (NSString *) requestURLString
                       WithParameter: (NSDictionary *) parameter
                WithReturnValeuBlock: (SucessWithJson) block
                    WithFailureBlock: (FailureFunction) failureBlock;
+ (void)cancelNetReuest;

@end
