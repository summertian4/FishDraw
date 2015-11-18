//
//  ViewController.m
//  FishDraw
//
//  Created by 周凌宇 on 15/8/11.
//  Copyright (c) 2015年 周凌宇. All rights reserved.
//

#import "ViewController.h"
#import "DrawPad.h"
#import "LineTool.h"
#import "Shape.h"
#import "RectangleTool.h"
#import "ToolController.h"
#import "DataController.h"
#import "ColorUtil.h"
#import "MoveTool.h"
#import "SelectTool.h"
#import "ZoomTool.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet DrawPad *drawPadView;

@property (strong, nonatomic) UIButton *currentToolButton;

@property (weak, nonatomic) IBOutlet UIButton *btLine;
@property (weak, nonatomic) IBOutlet UIButton *btRectangle;

@property (weak, nonatomic) IBOutlet UIButton *btBlack;
@property (weak, nonatomic) IBOutlet UIButton *btRed;
@property (weak, nonatomic) IBOutlet UIButton *btOrange;
@property (weak, nonatomic) IBOutlet UIButton *btYellow;
@property (weak, nonatomic) IBOutlet UIButton *btGreen;
@property (weak, nonatomic) IBOutlet UIButton *btLightGreen;
@property (weak, nonatomic) IBOutlet UIButton *btBlue;
@property (weak, nonatomic) IBOutlet UIButton *btPurple;
@property (weak, nonatomic) IBOutlet UIButton *btSelect;

@property (strong, nonatomic) NSArray *colorButtons;
@property (strong, nonatomic) NSArray *drawShapeButtons;

- (IBAction)chooseDrawTool:(UIButton *)sender;
- (IBAction)chooseSelectTool:(UIButton *)sender;

- (IBAction)clear:(UIButton *)sender;
- (IBAction)selectColor:(UIButton *)sender;


@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    // 将颜色按钮放到数组中方便使用
    self.colorButtons = [[NSArray alloc]initWithObjects:self.btRed,self.btOrange,self.btYellow,self.btGreen,self.btLightGreen,self.btBlue,self.btPurple,self.btBlack, nil];
    self.drawShapeButtons = [[NSArray alloc]initWithObjects:self.btLine,self.btRectangle, nil];
    
    // view加载时，将toolController和dataController也初始化好，避免空指针
    self.drawPadView.toolController = [[ToolController alloc]init];
    self.drawPadView.dataController = [[DataController alloc]init];
    
    // 设置初始时选择的是直线按钮
    self.btLine.selected = YES;
    self.currentToolButton = self.btLine;
    
    // 设置初始时选择的是黑色按钮，当前颜色为黑色
    self.btBlack.selected = YES;
    DataController.currentColor = [ColorUtil blackColor];
    
    // 设置初始时的工具是直线工具
    DataController.currentTool = [[LineTool alloc]init];
    
}

/**
 *  隐藏状态栏
 *
 *  @return
 */
- (BOOL)prefersStatusBarHidden {
    return YES;
}

/******************************************
 *  触摸开始事件
 *
 *  @param touches
 *  @param even
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)even {
    CGPoint location = [[touches anyObject]locationInView:self.view];
    // 如果当前使用选择工具
    if (self.btSelect.selected == YES) {
        // 如果当前点击点在移动点附近，将会使用移动工具
        if([DataController.currentShape isInCenterRange:location]) {
            DataController.currentTool = [[MoveTool alloc] init];
        }
        // 如果当前点击点在控制点附近，将会使用移动工具
        else if([DataController.currentShape isInControlPointRange:location]) {
            DataController.currentTool = [[ZoomTool alloc] init];
        }
        // 如果不在一动点附近也不在控制点附近，使用选择工具
        else {
            DataController.currentTool = [[SelectTool alloc] init];
        }
    }
    [self.drawPadView touchesBegan:location];
}

/**
 *  触摸移动事件
 *
 *  @param touches
 *  @param event
 */
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint location = [[touches anyObject]locationInView:self.view];
    [self.drawPadView touchesMoved: location];
 
    
}

/**
 *  触摸结束事件
 *
 *  @param touches
 *  @param event
 */
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
     CGPoint location = [[touches anyObject]locationInView:self.view];
    [self.drawPadView touchesEnded: location];
   
}

/****************************************
 *  选择绘图工具按钮事件
 *
 *  @param sender
 */
- (IBAction)chooseDrawTool:(UIButton *)sender {
    // 设置好本组的按钮状态
    [self settingButtonState:self.drawShapeButtons selectedButton:sender];
    
    // 设置选择按钮状态
    self.btSelect.selected = NO;
    
    // 设置当前选中按钮为点击的绘图按钮
    self.currentToolButton = sender;
    
    switch (sender.tag) {
            //如果点的是直线按钮，当前工具设为直线工具
        case 1001:
            DataController.currentTool = [[LineTool alloc] init];
            break;
            //如果点的是直线按钮，当前工具设为圆形工具
        case 1002:
            DataController.currentTool = [[LineTool alloc] init];
            break;
            //如果点的是直线按钮，当前工具设为矩形工具
        case 1003:
            DataController.currentTool = [[RectangleTool alloc] init];
            break;
        default:
            break;
    }
}

/**
 *  选择选择工具事件
 *
 *  @param sender
 */
- (IBAction)chooseSelectTool:(UIButton *)sender {
    // 设置选择按钮状态
    self.btSelect.selected = YES;
    
    // 设置当前选中按钮位选择按钮
    self.currentToolButton = self.btSelect;
    
    // 设置绘图工具组按钮状态全部为未选中
    [self settingButtonState:self.drawShapeButtons selectedButton:nil];
    
    // 设置当前工具为选择工具
    DataController.currentTool = [[SelectTool alloc] init];
}

/**
 *  点击清除按钮事件
 *
 *  @param sender
 */
- (IBAction)clear:(UIButton *)sender {
    [self.drawPadView clear];
}

/**
 *  选择颜色按钮事件
 *
 *  @param sender 被点击的按钮
 */
- (IBAction)selectColor:(UIButton *)sender {
    int i = (int)[self.colorButtons indexOfObject:sender];
    // 设置当前颜色为被点击按钮对应的颜色
    DataController.currentColor = [ColorUtil colorArray][i];
    // 设置本组按钮状态
    [self settingButtonState:self.colorButtons selectedButton:sender];
}

/**
 *  设置一组按钮中选中和未被选中的按钮状态
 *
 *  @param array  按钮组
 *  @param button 选中的按钮
 */
-(void) settingButtonState:(NSArray *)array selectedButton:(UIButton *)button {
    for (UIButton *b in array) {
        // 如果按钮是被点击按钮 设置为选中状态
        if (b == button) {
            b.selected = YES;
        }
        // 如果按钮不是被点击按钮 设置为未选中状态
        else {
            b.selected = NO;
        }
    }
}

@end
