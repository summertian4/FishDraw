//
//  ToolController.m
//  FishDraw
//
//  Created by 周凌宇 on 15/8/11.
//  Copyright (c) 2015年 周凌宇. All rights reserved.
//

#import "ToolController.h"
#import "DataController.h"
#import "Tool.h"

@interface ToolController()

/**
 *  工具
 */
@property (nonatomic,strong) Tool *tool;

@end


@implementation ToolController

/**
 *  触摸开始
 *
 *  @param currentPoint 当前触摸点
 */
-(void) touchesBegan:(CGPoint)currentPoint{
    self.tool = DataController.currentTool;
    [self.tool touchesBegan:currentPoint];
}
/**
 *  触摸移动
 *
 *  @param currentPoint 当前触摸点
 */
-(void) touchesMoved:(CGPoint)currentPoint {
    [self.tool touchesMoved:currentPoint];
}
/**
 *  触摸结束
 *
 *  @param currentPoint 当前触摸点
 */
-(void) touchesEnded:(CGPoint)currentPoint {
    [self.tool touchesEnded:currentPoint];
}

@end
