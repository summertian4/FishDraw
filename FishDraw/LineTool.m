//
//  LineTool.m
//  FishDraw
//
//  Created by 周凌宇 on 15/8/11.
//  Copyright (c) 2015年 周凌宇. All rights reserved.
//

#import "LineTool.h"
#import "Shape.h"
#import "Line.h"
#import "DataController.h"

@implementation LineTool

/**
 *  绘图开始
 *
 *  @param currentPoint 当前触摸点
 */
-(void) touchesBegan:(CGPoint)currentPoint {
    DataController.currentShape = [[Line alloc] init];
    DataController.currentShape.color = DataController.currentColor;
    DataController.currentShape.startPoint = currentPoint;
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
        DataController.currentShape = [[Line alloc]init];
        DataController.currentShape.color = DataController.currentColor;
    }
    return self;
}

@end
