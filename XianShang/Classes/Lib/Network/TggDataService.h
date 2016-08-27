//
//  TggDataService.h
//  点点
//
//  Created by 吴玉铁 on 16/1/25.
//  Copyright © 2016年 铁哥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"


@interface TggDataService : NSObject

+(NSURLSessionDataTask *)TggAFrequestUrlString:(NSString *)urlString
                                    HTTPMethod:(NSString *)method
                                        params:(NSMutableDictionary *)params
                                progressHandle:(void (^)(NSProgress *))progressblock
                              completionHandle:(void (^)(id))completionblock
                                   errorHandle:(void (^)(NSError *))errorblock;

+ (NSURLSessionDataTask *)TggAFrequestUploadData:(NSMutableDictionary *)dataDic
                                completionHandle:(void (^)(id))completionblock
                                     errorHandle:(void (^)(NSError *))errorblock
                                  progressHandle:(void (^)(NSProgress *))progressblock;


@end
