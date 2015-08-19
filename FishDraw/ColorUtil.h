//
//  ColorUtil.h
//  FishDraw
//
//  Created by 周凌宇 on 15/8/14.
//  Copyright (c) 2015年 周凌宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ColorUtil : NSObject
+(UIColor *) redColor ;
+(UIColor *) orangeColor;
+(UIColor *) yellowColor ;
+(UIColor *) greenColor ;
+(UIColor *) lightGreenColor ;
+(UIColor *) blueColor;
+(UIColor *) purpleColor;
+(UIColor *) blackColor;

+(UIColor *) hightLightColor:(UIColor *)color;

+(NSArray *) colorArray;

@end
