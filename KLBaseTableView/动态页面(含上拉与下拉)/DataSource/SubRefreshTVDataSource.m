//
//  SubRefreshTVDataSource.m
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/23.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import "SubRefreshTVDataSource.h"
#import "SubRefreshModel.h"

@implementation SubRefreshTVDataSource

- (void)refreshWithModel:(SubRefreshModel *)model {
    KLTableViewSectionObject *firstSection = [[KLTableViewSectionObject alloc] init];
    for (SubRefreshOne *one in model.one) {
        KLTableViewRowItem *item = [[KLTableViewRowItem alloc] initWithCellClassName:@"SubRefreshOneTableViewCell" model:one];
        [firstSection.items addObject:item];
    }
    KLTableViewSectionObject *secondSection = [[KLTableViewSectionObject alloc] init];
    secondSection.sectionHeaderTitle = @"two";
    for (SubRefreshTwo *two in model.two) {
        KLTableViewRowItem *item = [[KLTableViewRowItem alloc] initWithCellClassName:@"SubRefreshTwoTableViewCell"model:two];
        [secondSection.items addObject:item];
    }
    self.sections = [@[firstSection, secondSection] mutableCopy];
}

- (void)loadWithModel:(SubRefreshModel *)model {
    KLTableViewSectionObject *secondSection = (self.sections.count > 1) ? self.sections[1] :  [[KLTableViewSectionObject alloc] init];
    secondSection.sectionHeaderTitle = @"two";
    for (SubRefreshTwo *two in model.two) {
        KLTableViewRowItem *item = [[KLTableViewRowItem alloc] initWithCellClassName:@"SubRefreshTwoTableViewCell" model:two];
        [secondSection.items addObject:item];
    }
    self.sections[1] = secondSection;
}


@end
