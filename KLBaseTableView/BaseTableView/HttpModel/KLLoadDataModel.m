//
//  KLHttpBaseModel.m
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/21.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import "KLLoadDataModel.h"
#import "KLHttpManager.h"

#import "SubRefreshModel.h"

@interface KLLoadDataModel ()

@property (nonatomic, copy) NSString *postUrl;
@property (nonatomic, strong) Class aClass;
@property (nonatomic, strong) NSDictionary *params;

@end

@implementation KLLoadDataModel

+ (instancetype)defaultModelWithPost:(NSString *)postUrl class:(Class)aClass params:(NSDictionary *)params {
    return [[self alloc] initWithPost:postUrl class:aClass params:params];
}
- (instancetype)initWithPost:(NSString *)postUrl class:(Class)aClass params:(NSDictionary *)params {
    self = [super init];
    if (self) {
        _postUrl = !postUrl ? @"" : postUrl;
        _aClass = aClass;
        _params = params;
    }
    return self;
}

- (void)refreshNewData {
//    [KLHttpManager post:self.postUrl class:self.aClass params:self.params block:^(id result, HttpManagerResultType type) {
//        if (!self.delegate) {
//            return;
//        }
//        self.result = result;
//        self.type = type;
//        if ([self.delegate respondsToSelector:@selector(refreshDidCompletion)]) {
//            [self.delegate refreshDidCompletion];
//        }
//        if ([self.delegate respondsToSelector:@selector(requestCompletion)]) {
//            [self.delegate requestCompletion];
//        }
//    }];
#warning simulation network request --- 模拟下拉刷新数据
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(2);
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!self.delegate) {
                return;
            }
            self.result = [self simulationRefresh];
            self.type = HttpManagerResultTypeSuccess;
            if ([self.delegate respondsToSelector:@selector(refreshDidCompletion)]) {
                [self.delegate refreshDidCompletion];
            }
            if ([self.delegate respondsToSelector:@selector(requestCompletion)]) {
                [self.delegate requestCompletion];
            }
        });
    });
}


- (void)loadMoreData {
    NSDictionary *params = self.params;
    if (self.delegate && [self.delegate respondsToSelector:@selector(willStartLoad)]) {
        params = [self.delegate willStartLoad];
    }
//    [KLHttpManager post:self.postUrl class:self.aClass params:params block:^(id result, HttpManagerResultType type) {
//        if (!self.delegate) {
//            return;
//        }
//        self.result = result;
//        self.type = type;
//        if ([self.delegate respondsToSelector:@selector(loadDidCompletion)]) {
//            [self.delegate loadDidCompletion];
//        }
//        if ([self.delegate respondsToSelector:@selector(requestCompletion)]) {
//            [self.delegate requestCompletion];
//        }
//        if (type == HttpManagerResultTypeNoData && [self.delegate respondsToSelector:@selector(loadLastDataCompletion)]) {
//            [self.delegate loadLastDataCompletion];
//        }
//    }];
#warning simulation network request --- 模拟上拉加载数据
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(2);
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!self.delegate) {
                return;
            }
            self.result = [self simulationLoad];
            self.type = HttpManagerResultTypeSuccess;
            if ([self.delegate respondsToSelector:@selector(loadDidCompletion)]) {
                [self.delegate loadDidCompletion];
            }
            if ([self.delegate respondsToSelector:@selector(requestCompletion)]) {
                [self.delegate requestCompletion];
            }
            /***与服务器商议好一个字段 , 如果没有更多数据 , 就调用此方法进行回调 , 隐藏上拉刷新***/
//            if ([self.delegate respondsToSelector:@selector(loadLastDataCompletion)]) {
//                [self.delegate loadLastDataCompletion];
//            }
        });
    });
}


#pragma mark - 模拟网络请求数据
- (SubRefreshModel *)simulationRefresh {
    NSMutableArray *ones = [NSMutableArray array];
    for (int i = 0; i < 3; i++) {
        SubRefreshOne *one = [[SubRefreshOne alloc] init];
        one.title = [NSString stringWithFormat:@"SubRefreshOne --> %d" ,i+1];
        [ones addObject:one];
    }
    NSMutableArray *twos = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        SubRefreshTwo *two = [[SubRefreshTwo alloc] init];
        two.content = [NSString stringWithFormat:@"SubRefreshTwo --> %d" ,i+1];
        [twos addObject:two];
    }
    SubRefreshModel *model = [[SubRefreshModel alloc] init];
    model.one = [ones copy];
    model.two = [twos copy];
    return model;
}
- (SubRefreshModel *)simulationLoad {
    NSMutableArray *twos = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        SubRefreshTwo *two = [[SubRefreshTwo alloc] init];
        two.content = [NSString stringWithFormat:@"Pull on loaded --> %d" ,i+1];
        [twos addObject:two];
    }
    SubRefreshModel *model = [[SubRefreshModel alloc] init];
    model.two = [twos copy];
    return model;
}


@end
