//
//  Shape.h
//  FishDraw
//
//  Created by 周凌宇 on 15/8/11.
//  Copyright (c) 2015年 周凌宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Shape : NSObject

@property (nonatomic,strong) UIColor *color;
@property (nonatomic,strong) UIColor *tempColor;

@property (nonatomic,assign) CGPoint startPoint;
@property (nonatomic,assign) CGPoint endPoint;
@property (nonatomic,assign) NSString *controlPointName;

/**
 *  绘出图形
 *
 *  @param ctx 上下文
 */
-(void) draw:(CGContextRef)ctx;
/**
 *  缩放图形
 *
 *  @param ctx 上下文
 */
-(void) zoom:(CGPoint)currentPoint;

/**
 *  判断点击点是否在图形的范围内
 *
 *  @param point 点击点
 *
 *  @return 是否在范围内
 */
-(BOOL)isInRange:(CGPoint)point;

/**
 *  判断点击点是否在中心范围
 *
 *  @param point 点击点
 *
 *  @return 是否在中心范围
 */
-(BOOL)isInCenterRange:(CGPoint)point;

/**
 *  判断点击点是否在控制点范围
 *
 *  @param point 点击点
 *
 *  @return 是否在控制点范围
 */
-(BOOL)isInControlPointRange:(CGPoint)point;

/**
 *  根据当前触控点确定控制点
 *
 *  @param point 当前触控点
 *
 *  @return 控制点名称
 */
-(NSString *) controlPointName:(CGPoint)point;

/**
 *  获取中心点
 *
 *  @return 中心点
 */
-(CGPoint)centerPoint;

@end

