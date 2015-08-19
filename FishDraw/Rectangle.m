//
//  Rectangle.m
//  FishDraw
//
//  Created by 周凌宇 on 15/8/11.
//  Copyright (c) 2015年 周凌宇. All rights reserved.
//

#import "Rectangle.h"
#import "math.h"

@implementation Rectangle

/**
 *  绘出图形
 *
 *  @param ctx 上下文
 */
-(void) draw:(CGContextRef)ctx {
    //绘图

    // 定义矩形的rect
    CGRect rectangle = CGRectMake(self.startPoint.x, self.startPoint.y, self.endPoint.x-self.startPoint.x, self.endPoint.y-self.startPoint.y);
    
    // 在当前路径下添加一个矩形路径
    CGContextAddRect(ctx, rectangle);
    
    // 设置试图的当前填充色
    CGContextSetFillColorWithColor(ctx, self.color.CGColor);
    
    // 绘制当前路径区域
    CGContextFillPath(ctx);
}

/**
 *  判断点击点是否在图形的范围内
 *
 *  @param point 点击点
 *
 *  @return 是否在范围内
 */
-(BOOL)isInRange:(CGPoint)point {
    
    if((point.x > fmin(self.startPoint.x, self.endPoint.x)) && (point.x < fmax(self.startPoint.x, self.endPoint.x))&&(point.y > fmin(self.startPoint.y, self.endPoint.y)) && (point.y < fmax(self.startPoint.y, self.endPoint.y))){
        return YES;
    }
    else
    {
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
    if (d < 30) {
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
    float d1,d2,d3,d4;
    d1 = fabs(pow((point.x - self.startPoint.x),2) + pow((point.y - self.startPoint.y),2));
    d2 = fabs(pow((point.x - self.endPoint.x),2) + pow((point.y - self.endPoint.y),2));
    d3 = fabs(pow((point.x - self.startPoint.x),2) + pow((point.y - self.endPoint.y),2));
    d4 = fabs(pow((point.x - self.endPoint.x),2) + pow((point.y - self.startPoint.y),2));
    if (d1 < 20 || d2 < 20 || d3 < 20 || d4 < 20) {
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
    float d[4];
    d[0] = fabs(pow((point.x - self.startPoint.x),2) + pow((point.y - self.startPoint.y),2));
    d[1] = fabs(pow((point.x - self.endPoint.x),2) + pow((point.y - self.endPoint.y),2));
    d[2] = fabs(pow((point.x - self.startPoint.x),2) + pow((point.y - self.endPoint.y),2));
    d[3] = fabs(pow((point.x - self.endPoint.x),2) + pow((point.y - self.startPoint.y),2));
    float minD = 10000;
    for (int i = 0; i < 4; i++) {
        if (d[i]<minD) {
            minD = d[i];
        }
    }
    if (minD == d[0]) {
        return @"startPoint";
    }
    if (minD == d[1]) {
        return @"endPoint";
    }
    if (minD == d[2]) {
        return @"C";
    }
    if (minD == d[3]) {
        return @"D";
    }
    return nil;
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
    if ([self.controlPointName isEqual:@"C"]) {
        self.startPoint = CGPointMake(currentPoint.x, self.startPoint.y);
        self.endPoint = CGPointMake(self.endPoint.x, currentPoint.y);
    }
    if ([self.controlPointName isEqual:@"D"]) {
        self.startPoint = CGPointMake(self.startPoint.x, currentPoint.y);
        self.endPoint = CGPointMake(currentPoint.x, self.endPoint.y);
    }
}

@end
