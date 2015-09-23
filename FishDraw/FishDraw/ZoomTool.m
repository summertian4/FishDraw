//
//  ZoomTool.m
//  FishDraw
//
//  Created by 周凌宇 on 15/8/14.
//  Copyright (c) 2015年 周凌宇. All rights reserved.
//

#import "ZoomTool.h"
#import "Shape.h"
#import "DataController.h"

@implementation ZoomTool

/**
 *  缩放开始
 *
 *  @param shape 要缩放的图形
 */
-(void) touchesBegan:(CGPoint)currentPoint {
    DataController.currentShape.controlPointName = [DataController.currentShape controlPointName:currentPoint];
}

/**
 *  缩放移动中
 *
 *  @param currentPoint 当前点
 */
-(void) touchesMoved:(CGPoint)currentPoint {
    [DataController.currentShape zoom :currentPoint];
}
/**
 *  缩放结束
 *
 *  @param currentPoint 当前点
 */
-(void) touchesEnded:(CGPoint)currentPoint {
    [DataController.currentShape zoom :currentPoint];
}

@end
