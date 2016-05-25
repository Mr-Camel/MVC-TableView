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
 * tableView willDisplayCell
 */
- (void)tableViewWillDisplayCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath  withItem:(KLTableViewRowItem *)item;
/**
 * 如有需要 , 可以添加cell的编辑 , 交换等回调
 */

@end

@interface KLTableView : UITableView <UITableViewDelegate>

@property (nonatomic, weak) id<KLTableViewDataSource> klDataSource;

@property (nonatomic, weak) id<KLTableViewDelegate> klDelegate;

/**
 * @brief  是否需要下拉刷新控件
 */
@property (nonatomic, assign, setter=setNeedRefreshHeader:) BOOL isNeedRefreshHeader;
/**
 * @brief  是否需要上拉加载控件
 */
@property (nonatomic, assign, setter=setNeedRefreshFooter:) BOOL isNeedRefreshFooter;
/**
 *  @brief  是否需要预加载数据 , 默认为NO
 */
@property (nonatomic, assign) BOOL isNeedPreload;
/**
 *  @brief  倒数第几行开始预加载 , 默认为5
 *  @discussion  与preloadSection不可同时设置 , 若同时设置 , 只使用最后设置的属性
 */
@property (nonatomic, assign) NSInteger preloadRow;
/**
 *  @brief  倒数第几区开始预加载 , 适用场景为每个分区有且只有一行 , 默认为-1
 *  @discussion  与preloadRow不可同时设置 , 若同时设置 , 只使用最后设置的属性
 */
@property (nonatomic, assign) NSInteger preloadSection;

- (void)startRefreshHeader;

- (void)stopRefresh;


@end
