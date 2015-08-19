//
//  DataController.m
//  FishDraw
//
//  Created by 周凌宇 on 15/8/11.
//  Copyright (c) 2015年 周凌宇. All rights reserved.
//

#import "DataController.h"
#import "Shape.h"

/**
 *  存放所有图形的数组
 */
static NSMutableArray *_shapes;
/**
 *  存放当前颜色
 */
static UIColor *_currentColor;
/**
 *  存放当前图形
 */
static Shape *_currentShape;
/**
 *  存放当前工具
 */
static Tool *_currentTool;

@implementation DataController

/**
 *  设置图形数组
 *
 *  @param shapes 图形数组
 */
+(void) setShapes:(NSMutableArray *)shapes {
    _shapes = shapes;
}
/**
 *  获取图形数组
 *
 *  @return 图形数组
 */
+(NSMutableArray *) shapes {
    if (_shapes == nil) {
        _shapes = [NSMutableArray array];
    }
    return _shapes;
}

/**
 *  设置当前颜色
 *
 *  @param currentColor 颜色
 */
+(void) setCurrentColor:(UIColor *)currentColor {
    _currentColor = currentColor;
}
/**
 *  获取当前颜色
 *
 *  @return 当前颜色
 */
+(UIColor *) currentColor {
//    if (_currentColor == nil) {
//        _currentColor = [[UIColor alloc] init];
//    }
    return _currentColor;
}

/**
 *  设置当前图形
 *
 *  @param currentShape 图形
 */
+(void) setCurrentShape:(Shape *)currentShape {
    _currentShape = currentShape;
}
/**
 *  获取当前图形
 *
 *  @return 当前图形
 */
+(Shape *) currentShape {
    return _currentShape;
}

/**
 *  设置当前工具
 *
 *  @param currentTool 工具
 */
+(void) setCurrentTool:(Tool *)currentTool {
    _currentTool = currentTool;
}
/**
 *  获取当前工具
 *
 *  @return 当前工具
 */
+(Tool *) currentTool {
    return _currentTool;
}

/**
 *  清空数组中的图形
 */
-(void)clear {
    [_shapes removeAllObjects];
}

@end
