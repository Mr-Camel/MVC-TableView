//
//  SubPlainDataSource.m
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/23.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import "SubPlainDataSource.h"

@implementation SubPlainDataSource

- (instancetype)init {
    self = [super init];
    if (self) {
        NSMutableArray *mutable = [NSMutableArray array];
        for (int i = 0; i < 10; i++) {
            KLTableViewRowItem *item = [[KLTableViewRowItem alloc] initWithCellClassName:@"SubTableViewCell" model:[NSString stringWithFormat:@"第%d行" ,i+1]];
            [mutable addObject:item];
        }
        KLTableViewSectionObject *sectionOBJ = [[KLTableViewSectionObject alloc] initWithItems:mutable];
        self.sections = [NSMutableArray arrayWithObjects:sectionOBJ, nil];
    }
    return self;
}

@end
