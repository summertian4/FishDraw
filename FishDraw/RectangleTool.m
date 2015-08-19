//
//  RectangleTool.m
//  FishDraw
//
//  Created by 周凌宇 on 15/8/11.
//  Copyright (c) 2015年 周凌宇. All rights reserved.
//

#import "RectangleTool.h"
#import "Rectangle.h"
#import "DataController.h"

@implementation RectangleTool

/**
 *  绘图开始
 *
 *  @param startPoint 当前触摸点
 */
-(void) touchesBegan:(CGPoint)currentPoint {
    DataController.currentShape = [[Rectangle alloc] init];
    DataController.currentShape.color = DataController.currentColor;
    DataController.currentShape.startPoint = currentPoint;
    //避免绘图点击的时候，图形只是设置了开始点，结束点为(0,0)而造成没有开始移动就已经有一个图形的BUG
    DataController.currentShape.endPoint = currentPoint;
}

/**
 *  绘图拖动中
 *
 *  @param currentPoint 当前触控点
 */
-(void) touchesMoved:(CGPoint)currentPoint {
    DataController.currentShape.endPoint = currentPoint;
    
}

/**
 *  绘图结束
 *
 *  @param currentPoint 结束时触控点
 */
-(void) touchesEnded:(CGPoint)currentPoint {
    DataController.currentShape.endPoint = currentPoint;
    [DataController.shapes addObject:DataController.currentShape];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        DataController.currentShape = [[Rectangle alloc]init];
        DataController.currentShape.color = DataController.currentColor;
    }
    return self;
}

@end
