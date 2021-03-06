//
//  BAStatusTool.h
//  博爱微博
//
//  Created by boai on 15/8/13.
//  Copyright (c) 2015年 boai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BAStatusTool : NSObject

/**
 *  请求更新的微博数据
 sinceId：返回比这个更大的微博数据
 success：请求成功的时候回调(statuses(CZStatus模型))
 failure:请求失败的时候回调，错误传递给外界
 
 */
+ (void)newStatusWithSinceId:(NSString *)sinceId success:(void(^)(NSArray *statuses))success failure:(void(^)(NSError *error))failure;

/**
 *  请求更多的微博数据
 *
 *  @param maxId   返回小于等于这个id的微博数据
 *  @param success 请求成功的时候回调
 *  @param failure 请求失败的时候回调
 */
+ (void)moreStatusWithMaxId:(NSString *)maxId success:(void(^)(NSArray *statuses))success failure:(void(^)(NSError *error))failure;


@end
