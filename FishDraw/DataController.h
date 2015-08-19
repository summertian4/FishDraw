//
//  DataController.h
//  FishDraw
//
//  Created by 周凌宇 on 15/8/11.
//  Copyright (c) 2015年 周凌宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Shape;
@class Tool;

@interface DataController : NSObject

/**
 *  设置图形数组
 *
 *  @param shapes 图形数组
 */
+(void) setShapes:(NSMutableArray *)shapes;
/**
 *  获取图形数组
 *
 *  @return 图形数组
 */
+(NSMutableArray *) shapes;

/**
 *  设置当前颜色
 *
 *  @param currentColor 颜色
 */
+(void) setCurrentColor:(UIColor *)currentColor;
/**
 *  获取当前颜色
 *
 *  @return 当前颜色
 */
+(UIColor *) currentColor;

/**
 *  设置当前图形
 *
 *  @param currentShape 图形
 */
+(void) setCurrentShape:(Shape *)currentShape;
/**
 *  获取当前图形
 *
 *  @return 当前图形
 */
+(Shape *) currentShape;

/**
 *  设置当前工具
 *
 *  @param currentTool 工具
 */
+(void) setCurrentTool:(Tool *)currentTool;
/**
 *  获取当前工具
 *
 *  @return 当前工具
 */
+(Tool *) currentTool;

/**
 *  清空数组中的图形
 */
-(void)clear;


@end
