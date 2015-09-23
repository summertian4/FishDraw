//
//  Line.m
//  FishDraw
//
//  Created by 周凌宇 on 15/8/11.
//  Copyright (c) 2015年 周凌宇. All rights reserved.
//

#import "Line.h"
#import "LineTool.h"
#import "math.h"

@implementation Line

/**
 *  绘出图形
 *
 *  @param ctx 上下文
 */
-(void) draw:(CGContextRef)ctx {
    //绘图

    const CGFloat *components = CGColorGetComponents([self.color CGColor]);
    CGContextSetRGBStrokeColor(ctx, components[0], components[1], components[2], components[3]);
    CGContextMoveToPoint(ctx, self.startPoint.x, self.startPoint.y);
    CGContextAddLineToPoint(ctx, self.endPoint.x, self.endPoint.y);
}

/**
 *  判断点击点是否在图形的范围内
 *
 *  @param point 点击点
 *
 *  @return 是否在范围内
 */
-(BOOL)isInRange:(CGPoint)point {
    float A,B,C;
    A = self.endPoint.y - self.startPoint.y;
    B = self.startPoint.x - self.endPoint.x;
    C = self.startPoint.y * self.endPoint.x - self.endPoint.y * self.startPoint.x;
    
    float d;
    d = fabs(A*point.x+B*point.y+C)/sqrtf(A*A+B*B);
    if (d < 10) {
        return YES;
    }
    else {
        return NO;
    }
}

/**
 *  判断点击点是否在中心范围
 *
 *  @param point 点击点
 *
 *  @return 是否在中心范围
 */
-(BOOL)isInCenterRange:(CGPoint)point {
    CGPoint centerPoint = self.centerPoint;
    float d;
    d = fabs(pow((point.x - centerPoint.x),2) + pow((point.y - centerPoint.y),2));
    if (d < 10) {
        return YES;
    } else {
        return NO;
    }
}

/**
 *  获取中心点
 *
 *  @return 中心点
 */
-(CGPoint)centerPoint {
    return CGPointMake((self.startPoint.x + self.endPoint.x)/2, (self.startPoint.y + self.endPoint.y)/2);
}

/**
 *  判断点击点是否在控制点范围
 *
 *  @param point 点击点
 *
 *  @return 是否在控制点范围
 */
-(BOOL)isInControlPointRange:(CGPoint)point {
    float d1,d2;
    d1 = fabs(pow((point.x - self.startPoint.x),2) + pow((point.y - self.startPoint.y),2));
    d2 = fabs(pow((point.x - self.endPoint.x),2) + pow((point.y - self.endPoint.y),2));
    if (d1 < 10 || d2 < 10) {
        return YES;
    } else {
        return NO;
    }
}

/**
 *  根据当前触控点确定控制点
 *
 *  @param point 当前触控点
 *
 *  @return 控制点名称
 */
-(NSString *) controlPointName:(CGPoint)point; {
    float d1,d2;
    d1 = fabs(pow((point.x - self.startPoint.x),2) + pow((point.y - self.startPoint.y),2));
    d2 = fabs(pow((point.x - self.endPoint.x),2) + pow((point.y - self.endPoint.y),2));
    if (d1 <= d2) {
        return @"startPoint";
    } else {
        return @"endPoint";
    }
}

/**
 *  缩放图形
 *
 *  @param currentPoint 当前触控点
 */
-(void) zoom:(CGPoint)currentPoint {
    if ([self.controlPointName isEqual:@"startPoint"]) {
        self.startPoint = CGPointMake(currentPoint.x, currentPoint.y);
    }
    if ([self.controlPointName isEqual:@"endPoint"]) {
        self.endPoint = CGPointMake(currentPoint.x, currentPoint.y);
    }
}

@end
