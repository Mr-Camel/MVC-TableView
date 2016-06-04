//
//  UITableViewCell+ConfigModel.h
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/20.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KLTableViewRowItem;

@interface UITableViewCell (ConfigModel)

@property (nonatomic, copy) void (^cellBlock)(UITableViewCell *blockCell ,NSString *callbackID);

/**
 * 由子类重写此方法
 */
- (void)configWithModel:(id)model;

/**
 *  默认返回高度为44.0f , 可以由子类重写此方法计算高度.
 *  如果需要自动计算行高 , 也可以在这返回UITableViewAutomaticDimension
 *  只要计算过一次行高 , 即可保存到KLTableViewRowItem对象中 , 不会再次计算
 */
+ (CGFloat)tableView:(UITableView *)tableView rowHeightForItem:(KLTableViewRowItem *)item;

@end
