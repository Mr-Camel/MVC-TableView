//
//  SubCallbackDataSource.m
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 2016/6/4.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import "SubCallbackDataSource.h"
#import "CallbackModel.h"
#import "CallbackCell.h"

@implementation SubCallbackDataSource

- (instancetype)init {
    self = [super init];
    if (self) {
        NSMutableArray *items = [NSMutableArray array];
        for (int i = 0; i < 20; i++) {
            CallbackModel *model = [[CallbackModel alloc] init];
            model.name = [NSString stringWithFormat:@"callback %d" ,i];
            model.imgName = @"yellow.jpeg";
            KLTableViewRowItem *item = [[KLTableViewRowItem alloc] initWithCellClassName:NSStringFromClass([CallbackCell class]) model:model];
            [items addObject:item];
        }
        KLTableViewSectionObject *section = [[KLTableViewSectionObject alloc] initWithItems:items];
        [self.sections addObject:section];
    }
    return self;
}

@end
