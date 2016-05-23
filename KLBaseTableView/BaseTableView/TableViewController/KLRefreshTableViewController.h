//
//  KLRefreshTableViewController.h
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/21.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//
/**
 *  单个tableview的页面可直接继承此控制器 , 需重写requestDidCompletion:type:方法和createLoadModel方法
 */

#import "KLBaseTableViewController.h"
#import "KLLoadDataModel.h"

@interface KLRefreshTableViewController : KLBaseTableViewController <KLLoadDataModelDelegate>

/**
 *  @brief   此方法必须由子类重写 , 获取上拉/下拉请求的数据 , 根据isRefresh判断是下拉刷新还是上拉加载 , 执行不同的数据处理
 *
 *  @param  result  上拉/下拉请求回传的结果
 *  @param  type    上拉/下拉请求的httpType
 *  @param  isRefresh    是否是下拉刷新  YES为下拉刷新 , NO为上拉加载
 */
- (void)requestDidCompletion:(id)result type:(HttpManagerResultType)type isRefresh:(BOOL)isRefresh;

/**
 *  @brief   此方法必须由子类重写 , 用于创建网络请求模型
 */
- (KLLoadDataModel *)createLoadModel;

@end
