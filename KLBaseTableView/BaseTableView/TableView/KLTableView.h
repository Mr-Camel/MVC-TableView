//
//  KLTableView.h
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/20.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLTableViewDataSource.h"
#import "KLTableViewSectionObject.h"
#import "KLTableViewRowItem.h"

@protocol KLTableViewDelegate <UITableViewDelegate>

@optional
/**
 * 下拉刷新回调
 */
- (void)refreshingHeader;
/**
 * 上拉加载回调
 */
- (void)refreshingFooter;
/**
 * tableView点击事件
 */
- (void)didSelectWithRowItem:(KLTableViewRowItem *)item atIndexPath:(NSIndexPath *)indexPath;
/**
 * 如有需要 , 可以添加cell的编辑 , 交换等回调
 */

@end

@interface KLTableView : UITableView <UITableViewDelegate>

@property (nonatomic, weak) id<KLTableViewDataSource> klDataSource;

@property (nonatomic, weak) id<KLTableViewDelegate> klDelegate;

@property (nonatomic, assign, setter=setNeedRefreshHeader:) BOOL isNeedRefreshHeader;
@property (nonatomic, assign, setter=setNeedRefreshFooter:) BOOL isNeedRefreshFooter;

- (void)startRefreshHeader;

- (void)stopRefresh;


@end
