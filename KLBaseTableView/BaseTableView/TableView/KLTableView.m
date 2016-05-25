//
//  KLTableView.m
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/20.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import "KLTableView.h"
#import "UITableViewCell+ConfigModel.h"
#import "MJRefresh.h"
#import "MJRefreshStateHeader.h"

NSInteger const DefaultPreloadInteger = -1;

@implementation KLTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;//宽高根据 super view 自动拉伸
        self.delegate = self;
        self.isNeedRefreshFooter = NO;
        self.isNeedRefreshHeader = NO;
        self.isNeedPreload = NO;
        self.preloadRow = 5;
        self.preloadSection = DefaultPreloadInteger;
    }
    return self;
}
- (void)setKlDataSource:(id<KLTableViewDataSource>)klDataSource {
    if (_klDataSource != klDataSource) {
        _klDataSource = klDataSource;
        self.dataSource = klDataSource;
    }
}

- (void)startRefreshHeader {
    [self.mj_header beginRefreshing];
}
- (void)stopRefresh {
    if ([self.mj_header isRefreshing]) {
        [self.mj_header endRefreshing];
    }
    if ([self.mj_footer isRefreshing]) {
        [self.mj_footer endRefreshing];
    }
}

- (void)setNeedRefreshHeader:(BOOL)isNeedRefreshHeader {
    if (_isNeedRefreshHeader == isNeedRefreshHeader) {//防止重复赋值
        return;
    }
    _isNeedRefreshHeader = isNeedRefreshHeader;
    if (!_isNeedRefreshHeader) {//如果不需要refreshHeader
        [self.mj_header removeFromSuperview];
    }else {
        __weak typeof(self) weak = self;
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            if (weak.klDelegate && [weak.klDelegate respondsToSelector:@selector(refreshingHeader)]) {
                [weak.klDelegate refreshingHeader];
            }
        }];
    }
}
- (void)setNeedRefreshFooter:(BOOL)isNeedRefreshFooter {
    if (_isNeedRefreshFooter == isNeedRefreshFooter) {
        return;
    }
    _isNeedRefreshFooter = isNeedRefreshFooter;
    if (!_isNeedRefreshFooter) {
        [self.mj_footer removeFromSuperview];
    }else {
        __weak typeof(self) weak = self;
        self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            if (weak.klDelegate && [weak.klDelegate respondsToSelector:@selector(refreshingFooter)]) {
                [weak.klDelegate refreshingFooter];
            }
        }];
    }
}
#pragma mark - 每一行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    KLTableViewRowItem *item = [(id<KLTableViewDataSource>)self.dataSource tableView:tableView itemForRowAtIndexPath:indexPath];
    
    if (item.cellHeight == CellDefaultHeight) {//行高没有缓存
        item.cellHeight = [NSClassFromString(item.cellClassName) tableView:tableView rowHeightForItem:item];
    }
    return item.cellHeight;
}
#pragma mark - 分区头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [(id<KLTableViewDataSource>)self.dataSource tableView:tableView objectOfSection:section].sectionHeaderHeight;
}
#pragma mark - 分区尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return [(id<KLTableViewDataSource>)self.dataSource tableView:tableView objectOfSection:section].sectionFooterHeight;
}
#pragma mark - 分区头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [(id<KLTableViewDataSource>)self.dataSource tableView:tableView objectOfSection:section].sectionHeaderView;
}
#pragma mark - 分区尾视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [(id<KLTableViewDataSource>)self.dataSource tableView:tableView objectOfSection:section].sectionFooterView;
}

#pragma mark - 将点击事件转发给外部
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.klDelegate && [self.klDelegate respondsToSelector:@selector(didSelectWithRowItem:atIndexPath:)]) {//如果执行了自定义协议中的方法
        [self.klDelegate didSelectWithRowItem:[(id<KLTableViewDataSource>)self.dataSource tableView:tableView itemForRowAtIndexPath:indexPath] atIndexPath:indexPath];
    }else if (self.klDelegate && [self.klDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {//如果执行了系统协议中的方法
        [self.klDelegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self needBeginRefreshingWithIndexPath:indexPath]) {//预加载
        [self.mj_footer beginRefreshing];
    }
    if (self.klDelegate && [self.klDelegate respondsToSelector:@selector(tableViewWillDisplayCell:atIndexPath:withItem:)]) {//如果执行了自定义协议中的方法
        [self.klDelegate tableViewWillDisplayCell:cell atIndexPath:indexPath withItem:[(id<KLTableViewDataSource>)self.dataSource tableView:tableView itemForRowAtIndexPath:indexPath]];
    }else if (self.klDelegate && [self.klDelegate respondsToSelector:@selector(tableView:willDisplayCell:forRowAtIndexPath:)]) {//如果执行了系统协议中的方法
        [self.klDelegate tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
    }
}

- (BOOL)needBeginRefreshingWithIndexPath:(NSIndexPath *)indexPath {
    if (!self.isNeedPreload) {
        return self.isNeedPreload;
    }
    NSInteger section = [(id<KLTableViewDataSource>)self.dataSource numberOfSectionsInTableView:self];
    if (self.preloadSection != DefaultPreloadInteger) {//如果设置为分区预加载模式
        return (indexPath.section == (section - self.preloadSection));
    }else {
        BOOL isLastSection = (indexPath.section == (section - 1));//是否是最后一区
        BOOL isBackRow = (indexPath.row == [(id<KLTableViewDataSource>)self.dataSource tableView:self numberOfRowsInSection:indexPath.section] - self.preloadRow);
        return isLastSection && isBackRow;
    }
}

- (void)setPreloadRow:(NSInteger)preloadRow {
    _preloadRow = preloadRow;
    _preloadSection = DefaultPreloadInteger;
}
@end
