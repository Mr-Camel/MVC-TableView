//
//  KLTableViewSectionObject.m
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/20.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import "KLTableViewSectionObject.h"

@implementation KLTableViewSectionObject

- (instancetype)init {
    self = [super init];
    if (self) {
        _sectionFooterTitle = nil;
        _sectionHeaderTitle = nil;
        _items = [NSMutableArray array];
    }
    return self;
}
- (instancetype)initWithItems:(NSMutableArray<KLTableViewRowItem *> *)items {
    self = [self init];
    if (self) {
        [self.items addObjectsFromArray:items];
    }
    return self;
}

@end
