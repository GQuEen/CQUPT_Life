//
//  CQLNetWork.h
//  CQUPTLife
//
//  Created by GQuEen on 16/11/10.
//  Copyright © 2016年 GegeChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CQLNetWork : NSObject

typedef void (^SucessWithJson) (id returnValue);
typedef void (^FailureFunction)();

+ (void)NetRequestGETWithRequestURL: (NSString *) requestURLString
                      WithParameter: (NSDictionary *) parameter
               WithReturnValeuBlock: (SucessWithJson) successFunction
                   WithFailureBlock: (FailureFunction) failureFunction;

+ (void)NetRequestPOSTWithRequestURL: (NSString *) requestURLString
                       WithParameter: (NSDictionary *) parameter
                WithReturnValeuBlock: (SucessWithJson) block
                    WithFailureBlock: (FailureFunction) failureBlock;

@end
