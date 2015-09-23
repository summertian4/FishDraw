//
//  ToolController.h
//  FishDraw
//
//  Created by 周凌宇 on 15/8/11.
//  Copyright (c) 2015年 周凌宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Tool;

@interface ToolController : NSObject

/**
 *  触摸开始
 *
 *  @param currentPoint 当前触摸点
 */
-(void) touchesBegan:(CGPoint)currentPoint;
/**
 *  触摸移动
 *
 *  @param currentPoint 当前触摸点
 */
-(void) touchesMoved:(CGPoint)currentPoint;
/**
 *  触摸结束
 *
 *  @param currentPoint 当前触摸点
 */
-(void) touchesEnded:(CGPoint)currentPoint;

@end
