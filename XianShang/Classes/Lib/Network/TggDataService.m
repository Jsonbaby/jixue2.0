//
//  TggDataService.m
//  点点
//
//  Created by 吴玉铁 on 16/1/25.
//  Copyright © 2016年 铁哥. All rights reserved.
//

#import "TggDataService.h"


@implementation TggDataService

+ (NSURLSessionDataTask *)TggAFrequestUrlString:(NSString *)urlString
                                 HTTPMethod:(NSString *)method
                                     params:(NSMutableDictionary *)params
                             progressHandle:(void (^)(NSProgress *))progressblock
                           completionHandle:(void (^)(id))completionblock
                                errorHandle:(void (^)(NSError *))errorblock{
    //拼接URL
    NSLog(@"appendUrl:%@",urlString);
    urlString = [BaseURL stringByAppendingString:urlString];
    NSLog(@"wholeUrk:%@",urlString);
    //创建管理对象,接受数据类型
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"application/x-www-form-urlencoded",nil];
    if ([method isEqualToString:@"GET"]) {
        NSURLSessionDataTask *task = [manager GET:urlString parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"下载进度：%@",downloadProgress);
            progressblock(downloadProgress);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"请求成功");
            completionblock(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"请求失败");
            errorblock(error);
        }];
        return task;
        
    }else if([method isEqualToString:@"POST"]){
        
        NSURLSessionDataTask *task = [manager POST:urlString parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
            NSLog(@"上传进度：%@",uploadProgress);
            //progressblock(uploadProgress);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"请求成功");
            completionblock(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"请求失败");
            errorblock(error);
        }];
        return task;
    }
    return nil;
}

//datas：和文件上传相关的参数
+ (NSURLSessionDataTask *)TggAFrequestUploadData:(NSMutableDictionary *)dataDic
                             completionHandle:(void (^)(id))completionblock
                                  errorHandle:(void (^)(NSError *))errorblock
                               progressHandle:(void (^)(NSProgress *))progressblock{
    //拼接URL
    NSString *urlString = @"http://test.clzx521.com/app/upload";
    //创建管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSURLSessionDataTask *task = [manager POST:urlString parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //key->value @"pic":NSData*(二进制图片数据）
        for (NSString *key in dataDic) {
            //获取二进制文件数据
            NSData *data = dataDic[key];
            //把文件数据追加到formData的末尾
            [formData appendPartWithFileData:data name:key fileName:key mimeType:@"image/jpeg/png"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        progressblock(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求成功");
        completionblock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败");
        errorblock(error);
    }];
//    [task setUploadProgressBlock:^(NSUInteger __unused bytesWritten,
//                                        long long totalBytesWritten,
//                                        long long totalBytesExpectedToWrite) {
//        //NSLog(@"Wrote %lld/%lld", totalBytesWritten, totalBytesExpectedToWrite);
//        // NSLog(@"%lf",totalBytesWritten / (CGFloat)totalBytesExpectedToWrite);
//        progressBlock(totalBytesWritten / (CGFloat)totalBytesExpectedToWrite);
//    }];

    return task;
    
}

@end
