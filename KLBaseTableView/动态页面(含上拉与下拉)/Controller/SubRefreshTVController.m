//
//  SubRefreshTVController.m
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/21.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import "SubRefreshTVController.h"
#import "SubRefreshModel.h"
#import "SubRefreshOneTableViewCell.h"
#import "SubRefreshTwoTableViewCell.h"
#import "SubRefreshTVDataSource.h"
#import "SubPlainViewController.h"
#import "SubGroupViewController.h"

@implementation SubRefreshTVController

/** !!!!!!!!!!!!!!!!!!!!!!!!!!
 * @brief   此控制器由storyboard直接创建 , 没办法初始化tableViewStyle属性 , 所以需要重写initWithCoder方法对属性重新赋值
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.tableViewStyle = UITableViewStyleGrouped;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView startRefreshHeader];
}
- (NSArray *)nibCellsName {
    return @[NSStringFromClass([SubRefreshTwoTableViewCell class]), NSStringFromClass([SubRefreshOneTableViewCell class])];
}
//请求回调
- (void)requestDidCompletion:(id)result type:(HttpManagerResultType)type isRefresh:(BOOL)isRefresh {
    if (result == nil) {
        return;
    }
    if (isRefresh) {//下拉刷新
        [self.dataSource refreshWithModel:result];
    }else {//上拉加载
        [self.dataSource loadWithModel:result];
    }
}
- (KLTableViewDataSource *)configDataSource {
    return [[SubRefreshTVDataSource alloc] init];
}
/**
 *  @brief  返回请求数据模型
 *
 *  @param  postURL    请求时需要拼接的地址 , 可为空
 *  @param  class         JSON数据转成的模型的class
 *  @param  params      请求参数
 */
- (KLLoadDataModel *)createLoadModel {
    return [KLLoadDataModel
            defaultModelWithPost:nil
            class:[SubRefreshModel class]
            params:@{
                     @"参数一" : @".",
                     @"参数二" : @"..",
                     @"参数三" : @"..."
                     }];
}
//即将上拉加载更多数据时 , 如果需要修改请求参数 , 可重写此方法
- (NSDictionary *)willStartLoad {
    return @{
             @"参数一" : @"...",
             @"参数二" : @"..",
             @"参数三" : @"."
             };
}
//tableViewCell点击事件
- (void)didSelectWithRowItem:(KLTableViewRowItem *)item atIndexPath:(NSIndexPath *)indexPath {
    if ([item.model isKindOfClass:[SubRefreshOne class]]) {
        SubPlainViewController *vc = [[SubPlainViewController alloc] init];
        vc.title = @"plain";
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        SubGroupViewController *vc = [[SubGroupViewController alloc] init];
        vc.title = @"group";
        vc.tableViewStyle = UITableViewStyleGrouped;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
