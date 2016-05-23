//
//  KLRefreshTableViewController.m
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/21.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import "KLRefreshTableViewController.h"
#import "MJRefresh.h"

@interface KLRefreshTableViewController ()

@property (nonatomic, strong) KLLoadDataModel *loadModel;

@end

@implementation KLRefreshTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loadModel = [self createLoadModel];
    self.loadModel.delegate = self;
    //如果某个页面不需要下拉或者上拉 , 则在子类中 , 在viewDidLoad的时候重新设置相应的属性为NO即可
    self.tableView.isNeedRefreshHeader = YES;
    self.tableView.isNeedRefreshFooter = YES;
}
#pragma mark - KLTableViewDelegate
- (void)refreshingHeader {
    [self.loadModel refreshNewData];
}
- (void)refreshingFooter {
    [self.loadModel loadMoreData];
}

#pragma mark - KLLoadDataModelDelegate
- (void)requestCompletion {
    [self.tableView stopRefresh];
    [self.tableView reloadData];
}
- (void)refreshDidCompletion {
    [self.dataSource cleanAllSections];
    [self requestDidCompletion:self.loadModel.result type:self.loadModel.type isRefresh:YES];
}
- (void)loadDidCompletion {
    [self requestDidCompletion:self.loadModel.result type:self.loadModel.type isRefresh:NO];
}
- (void)loadLastDataCompletion {
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
}
#pragma mark - 由子类重写的方法
- (void)requestDidCompletion:(id)result type:(HttpManagerResultType)type isRefresh:(BOOL)isRefresh {
    @throw [NSException exceptionWithName:@"Cann't use this method"
                                   reason:@"You can only call this method in subclass --> [subclass requestDidCompletion:type:isRefresh:]"
                                 userInfo:nil];
}
- (KLLoadDataModel *)createLoadModel {
    @throw [NSException exceptionWithName:@"Cann't use this method"
                                   reason:@"You can only call this method in subclass --> [subclass createLoadModel]"
                                 userInfo:nil];
}
@end
