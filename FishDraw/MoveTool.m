//
//  MoveTool.m
//  FishDraw
//
//  Created by 周凌宇 on 15/8/13.
//  Copyright (c) 2015年 周凌宇. All rights reserved.
//

#import "MoveTool.h"
#import "Shape.h"
#import "DataController.h"

@implementation MoveTool

/**
 *  移动开始
 *
 *  @param currentPoint 当前触摸点
 */
-(void) touchesBegan:(CGPoint)currentPoint{
}

/**
 *  移动移动
 *
 *  @param currentPoint 当前触摸点
 */
-(void) touchesMoved:(CGPoint)currentPoint {
    float variationX = currentPoint.x - DataController.currentShape.centerPoint.x;
    float variationY = currentPoint.y - DataController.currentShape.centerPoint.y;
    DataController.currentShape.startPoint = CGPointMake(DataController.currentShape.startPoint.x + variationX, DataController.currentShape.startPoint.y + variationY);
    DataController.currentShape.endPoint = CGPointMake(DataController.currentShape.endPoint.x + variationX, DataController.currentShape.endPoint.y + variationY);
}

/**
 *  移动结束
 *
 *  @param currentPoint 当前触摸点
 */
-(void) touchesEnded:(CGPoint)currentPoint {
    float variationX = currentPoint.x - DataController.currentShape.centerPoint.x;
    float variationY = currentPoint.y - DataController.currentShape.centerPoint.y;
    DataController.currentShape.startPoint = CGPointMake(DataController.currentShape.startPoint.x + variationX, DataController.currentShape.startPoint.y + variationY);
    DataController.currentShape.endPoint = CGPointMake(DataController.currentShape.endPoint.x + variationX, DataController.currentShape.endPoint.y + variationY);
}

@end
