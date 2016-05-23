//
//  SubGroupDataSource.m
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/23.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import "SubGroupDataSource.h"

@implementation SubGroupDataSource

- (instancetype)init {
    self = [super init];
    if (self) {
        NSMutableArray *mutable = [NSMutableArray array];
        for (int j = 0; j < 3; j++) {
            KLTableViewSectionObject *sectionOBJ = [[KLTableViewSectionObject alloc] init];
            sectionOBJ.sectionHeaderTitle = [NSString stringWithFormat:@"第%d区" ,j+1];
            for (int i = 0; i < 10; i++) {
                KLTableViewRowItem *item = [[KLTableViewRowItem alloc] initWithCellClassName:@"SubTableViewCell" model:[NSString stringWithFormat:@"第%d行" ,i+1]];
                [sectionOBJ.items addObject:item];
            }
            [mutable addObject:sectionOBJ];
        }
        self.sections = mutable;
    }
    return self;
}

@end
