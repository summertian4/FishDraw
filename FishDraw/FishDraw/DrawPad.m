
//
//  DrawPadView.m
//  FishDraw
//
//  Created by 周凌宇 on 15/8/11.
//  Copyright (c) 2015年 周凌宇. All rights reserved.
//

#import "DrawPad.h"
#import "DrawTool.h"
#import "Shape.h"
#import "ToolController.h"
#import "DataController.h"
#import "ColorUtil.h"
#import "SelectTool.h"
#import "MoveTool.h"

@implementation DrawPad

- (void)drawRect:(CGRect)rect
{
    //先重绘制原先的对象，再绘制最新的对象
    for (Shape *shape in DataController.shapes) {
        //获取上下文
        CGContextRef ctx=UIGraphicsGetCurrentContext();
        [shape draw:ctx];
        //渲染
        CGContextStrokePath(ctx);
    }
    //获取上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    
    [DataController.currentShape draw:ctx];
    //渲染
    CGContextStrokePath(ctx);

}

/***********************************************
 *  清空图形
 */
-(void) clear {
    [self.dataController clear];
    DataController.currentShape = nil;
    [self setNeedsDisplay];
}

/**
 *  触摸开始
 *
 *  @param currentPoint 当前触摸点
 */
-(void) touchesBegan:(CGPoint)currentPoint{
    [self.toolController touchesBegan:currentPoint];
    [self setNeedsDisplay];
}
/**
 *  触摸移动
 *
 *  @param currentPoint 当前触摸点
 */
-(void) touchesMoved:(CGPoint)currentPoint {
    [self.toolController touchesMoved:currentPoint];
    [self setNeedsDisplay];
}
/**
 *  触摸结束
 *
 *  @param currentPoint 当前触摸点
 */
-(void) touchesEnded:(CGPoint)currentPoint {
    [self.toolController touchesEnded:currentPoint];
    [self setNeedsDisplay];
}

@end
