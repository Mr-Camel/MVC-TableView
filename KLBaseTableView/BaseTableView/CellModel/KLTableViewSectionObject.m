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
        _sectionHeaderHeight = 0;
        _sectionFooterHeight = 0;
        _sectionFooterTitle = nil;
        _sectionHeaderTitle = nil;
        _sectionHeaderView = nil;
        _sectionFooterView = nil;
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

- (void)setSectionFooterTitle:(NSString *)sectionFooterTitle {
    _sectionFooterTitle = sectionFooterTitle;
    if (sectionFooterTitle != nil) {
        self.sectionFooterView = nil;
        self.sectionFooterHeight = 24;
    }
}
- (void)setSectionHeaderTitle:(NSString *)sectionHeaderTitle {
    _sectionHeaderTitle = sectionHeaderTitle;
    if (sectionHeaderTitle != nil) {
        self.sectionHeaderView = nil;
        self.sectionHeaderHeight = 24;
    }
}
- (void)setSectionHeaderView:(UIView *)sectionHeaderView {
    _sectionHeaderView = sectionHeaderView;
    if (sectionHeaderView != nil) {
        self.sectionHeaderTitle = nil;
    }
    self.sectionHeaderHeight = CGRectGetHeight(sectionHeaderView.frame);
}
- (void)setSectionFooterView:(UIView *)sectionFooterView {
    _sectionFooterView = sectionFooterView;
    if (sectionFooterView) {
        self.sectionFooterTitle = nil;
    }
    self.sectionFooterHeight = CGRectGetHeight(sectionFooterView.frame);
}
@end
