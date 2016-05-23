//
//  KLTableViewRowItem.m
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/20.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import "KLTableViewRowItem.h"

CGFloat const CellDefaultHeight = -1.0;

@implementation KLTableViewRowItem

- (instancetype _Nullable)initWithCellClassName:(NSString * _Nonnull)cellClassName model:(id _Nullable)model {
    self = [super init];
    if (self) {
        if (!cellClassName || cellClassName.length == 0) {
            @throw [NSException exceptionWithName:@"cellClassName cann't be empty"
                                           reason:@"You must set a value"
                                         userInfo:nil];
        }
        _cellClassName = cellClassName;
        _model = model;
        _cellHeight = CellDefaultHeight;
    }
    return self;
}

@end
