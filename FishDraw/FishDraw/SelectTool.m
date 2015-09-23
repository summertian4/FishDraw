//
//  SelectTool.m
//  FishDraw
//
//  Created by 周凌宇 on 15/8/11.
//  Copyright (c) 2015年 周凌宇. All rights reserved.
//

#import "SelectTool.h"
#import "Shape.h"
#import "DataController.h"
#import "ColorUtil.h"

@interface SelectTool ()

@end

@implementation SelectTool

/**
 *  选择开始
 *
 *  @param currentPoint 当前触摸点
 */
-(void) touchesBegan:(CGPoint)currentPoint {
    Shape *shape = nil;
    for (Shape *s in DataController.shapes) {
        if ([s isInRange: currentPoint]) {
            shape = s;
        }
    }
    DataController.currentShape = shape;
    if (DataController.currentShape != nil) {
        DataController.currentShape.tempColor = DataController.currentShape.color;
        DataController.currentShape.color = [ColorUtil hightLightColor:DataController.currentShape.color];
    }
}

/**
 *  选择移动
 *
 *  @param currentPoint 当前触摸点
 */
-(void) touchesMoved:(CGPoint)currentPoint {
    
}

/**
 *  选择结束
 *
 *  @param currentPoint 当前触摸点
 */
-(void) touchesEnded:(CGPoint)currentPoint {
    DataController.currentShape.color = DataController.currentShape.tempColor;
}

@end
