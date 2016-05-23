//
//  KLHttpBaseModel.h
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/21.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLHttpManager.h"

@protocol KLLoadDataModelDelegate <NSObject>

@required
/**
 *  下拉刷新请求结束后调用
 */
- (void)refreshDidCompletion;
/**
 *  上拉加载请求结束后调用
 */
- (void)loadDidCompletion;
/**
 *  上拉加载请求结束后 , 服务器通知已经是最后的数据时调用
 */
- (void)loadLastDataCompletion;
/**
 *  下拉/上拉请求结束后拿到的数据和请求Type
 */
- (void)requestCompletion;

@optional
/**
 *  即将开始上拉加载时调用 , 如果需要修改上拉加载时的请求参数 , 可以执行此方法修改
 */
- (NSDictionary *)willStartLoad;


@end

@interface KLLoadDataModel : NSObject

@property (nonatomic, strong) id result;
@property (nonatomic, assign) HttpManagerResultType type;
@property (nonatomic, weak) id<KLLoadDataModelDelegate> delegate;

/**
 *  @brief  返回请求数据模型
 *
 *  @param  postURL    请求时需要拼接的地址 , 可为空
 *  @param  class         JSON数据转成的模型的class
 *  @param  params      请求参数
 */
+ (instancetype)defaultModelWithPost:(NSString *)postUrl class:(Class)aClass params:(NSDictionary *)params;

- (void)refreshNewData;
- (void)loadMoreData;

@end
