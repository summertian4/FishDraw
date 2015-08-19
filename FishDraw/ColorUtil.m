//
//  ColorUtil.m
//  FishDraw
//
//  Created by 周凌宇 on 15/8/14.
//  Copyright (c) 2015年 周凌宇. All rights reserved.
//

#import "ColorUtil.h"
#import <UIKit/UIKit.h>

@implementation ColorUtil
+(UIColor *) redColor {
    return [UIColor colorWithRed:255/255.0 green:105/255.0 blue:105/255.0 alpha:1.0];
}
+(UIColor *) orangeColor {
    return [UIColor colorWithRed:255/255.0 green:165/255.0 blue:0.0 alpha:1.0];
}
+(UIColor *) yellowColor {
    return [UIColor colorWithRed:255/255.0 green:255/255.0 blue:0.0 alpha:1.0];
}
+(UIColor *) greenColor {
    return [UIColor colorWithRed:60/255.0 green:179/255.0 blue:113/255.0 alpha:1.0];
}
+(UIColor *) lightGreenColor {
    return [UIColor colorWithRed:127/255.0 green:255/255.0 blue:212/255.0 alpha:1.0];
}
+(UIColor *) blueColor {
    return [UIColor colorWithRed:0.0 green:191/255.0 blue:255/255.0 alpha:1.0];
}
+(UIColor *) purpleColor {
    return [UIColor colorWithRed:132/255.0 green:112/255.0 blue:255/255.0 alpha:1.0];
}
+(UIColor *) blackColor {
    return [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
    
}

+(UIColor *) hightLightColor:(UIColor *)color {
    const CGFloat *components = CGColorGetComponents([color CGColor]);
    return [UIColor colorWithRed:components[0] green:components[1] blue:components[2] alpha:0.5];
}

+(NSArray *) colorArray {
    NSArray *array =[[NSArray alloc]initWithObjects:[UIColor colorWithRed:255/255.0 green:105/255.0 blue:105/255.0 alpha:1.0],[UIColor colorWithRed:255/255.0 green:165/255.0 blue:0.0 alpha:1.0],[UIColor colorWithRed:255/255.0 green:255/255.0 blue:0.0 alpha:1.0],[UIColor colorWithRed:60/255.0 green:179/255.0 blue:113/255.0 alpha:1.0],[UIColor colorWithRed:127/255.0 green:255/255.0 blue:212/255.0 alpha:1.0],[UIColor colorWithRed:0.0 green:191/255.0 blue:255/255.0 alpha:1.0],[UIColor colorWithRed:132/255.0 green:112/255.0 blue:255/255.0 alpha:1.0],[UIColor colorWithRed:0 green:0 blue:0 alpha:1.0],nil];
    return array;
}

@end
