//
//  BezierView.m
//  BezierStudy
//
//  Created by 陈舒澳 on 16/4/16.
//  Copyright © 2016年 xingbida. All rights reserved.
//

#import "BezierView.h"
/** 常用的方法
 *
 *
 *
     创建基本路径
    + (instancetype)bezierPath;
    // 创建矩形路径
    + (instancetype)bezierPathWithRect:(CGRect)rect;
    // 创建椭圆路径
    + (instancetype)bezierPathWithOvalInRect:(CGRect)rect;
    // 创建圆角矩形
    + (instancetype)bezierPathWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius; // rounds all corners with the same horizontal and vertical radius
    // 创建指定位置圆角的矩形路径
    + (instancetype)bezierPathWithRoundedRect:(CGRect)rect byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;
    // 创建弧线路径
    + (instancetype)bezierPathWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;
    // 通过CGPath创建
    + (instancetype)bezierPathWithCGPath:(CGPathRef)CGPath;
 *
 *
 *
 *
 *
 */
@implementation BezierView
- (void)drawRect:(CGRect)rect{
//    [self drawRectPath];
//    [self drawTrianglePath];
//    [self drawRoundRectPath];
//    [self drawCirclePath];
//    [self drawArcPath];
//    [self drawSecondBezierPath];
    [self drawMostRoundPath];
    
}
#pragma mark --- 三次贝塞尔曲线
/**
 *   - (void)addCurveToPoint:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2;
 *
 *   endPoint 曲线终点  controlPoint1 控制点1    controlPoint2 控制点2
 *
 */
- (void)drawThirdBezierPath{
    [[UIColor redColor] set];
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(20, self.frame.size.height - 10)];
    [path addCurveToPoint:CGPointMake(self.frame.size.height - 10, self.frame.size.height- 40) controlPoint1:CGPointMake(40, 50) controlPoint2:CGPointMake(150 , self.frame.size.height - 10)];
    [path stroke];
}
#pragma mark --- 二次贝塞尔曲线
/**
 *  - (void)addQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint;
 *
 *      endPoint 曲线终点   controlPoint 控制点
 *
 */
- (void)drawSecondBezierPath{
    [[UIColor redColor] set];
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(20, self.frame.size.height - 20)];
    [path addQuadCurveToPoint:CGPointMake(self.frame.size.height - 30, self.frame.size.height - 30) controlPoint:CGPointMake(50, 50)];
    [path stroke];
}
#pragma mark --- 扇形
/**
 *  - (void)addArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise
 *
 *
 */
- (void)drawMostRoundPath{
    [[UIColor redColor] set];
    CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    UIBezierPath * path = [UIBezierPath bezierPath];
    path.lineWidth = 2;
    [path moveToPoint:CGPointMake(100, 100)];
    [path addArcWithCenter:center radius:50 startAngle:0 endAngle:3.1415 / 2 clockwise:NO];
    [path closePath];
    [path stroke];
}
#pragma mark --- 圆弧
/**
 * + (instancetype)bezierPathWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;
 *
 *  center 圆弧圆心坐标    radius  弧线半径     startAngle  弧线起始角度（弧度制）   endAngle 弧线结束角度   clockwise 是否顺势针绘制
 *
 */
#define   kDegreesToRadians(degrees)  ((pi * degrees)/ 180)
- (void)drawArcPath{
    const CGFloat pi = 3.14159265359;
    [[UIColor redColor] set];
    CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:center radius:50 startAngle:0 endAngle:kDegreesToRadians(180) clockwise:YES];
    path.lineWidth = 3;
    [path stroke];
}
#pragma mark --- 椭圆
/**
 *  + (instancetype)bezierPathWithOvalInRect:(CGRect)rect; 传过来的坐标不是正方形就ok
 *
 **/
- (void)drawOvalPath{
    [[UIColor redColor] set];
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, self.frame.size.height - 40, self.frame.size.width - 20)];
    [path stroke];
}
#pragma mark --- 圆
/**
 *  + (instancetype)bezierPathWithOvalInRect:(CGRect)rect; 传过来的坐标要是正方形才能画成圆
 *
 **/
- (void)drawCirclePath{
    [[UIColor redColor]  set];
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 40)];
    path.lineWidth = 3;
    [path stroke];
    
}
#pragma mark --- 三角形
- (void)drawTrianglePath{
    UIBezierPath * path = [UIBezierPath bezierPath];
    //设置画笔的起点
    [path moveToPoint:CGPointMake(20, 20)];
    //从当前点到指定点绘制直线
    [path addLineToPoint:CGPointMake(self.frame.size.width - 20, 20)];
    [path addLineToPoint:CGPointMake(self.frame.size.width / 2, self.frame.size.height - 20)];
    //最后的闭合线可以通过调用closePath方法来自动生成，也可以调用 addLineToPoint：方法来添加
    //[path addLineToPoint:CGPointMake(20, 20)];
    [path closePath];
    
    path.lineWidth = 3;
    UIColor * fillColor = [UIColor greenColor];
    [fillColor set];
    [path fill];
    
    UIColor * strokeColor = [UIColor blueColor];
    [strokeColor set];
    
    [path stroke];
}
#pragma mark --- 带圆角的矩形
/**
 *
 *  + (instancetype)bezierPathWithRoundedRect:(CGRect)rect byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;
 *  rect 画图的位置   corners 要设置的圆角   cornerRadii 圆角大小
 *
 */
- (void)drawRoundRectPath{
    [[UIColor redColor] set];
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 40) byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(10, 10)];
    [path stroke];
}
#pragma mark --- 矩形
- (void)drawRectPath{
    UIBezierPath * path = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 40)];
    
    //线条宽度
    path.lineWidth = 1.5;
    
    //终点类型
    path.lineCapStyle = kCGLineCapRound;
    //交叉点类型
    path.lineJoinStyle = kCGLineJoinBevel;
    
    //设置填充颜色
    UIColor * fillColor = [UIColor yellowColor];
    [fillColor set];
    //填充
    [path fill];
    
    //设置画笔颜色
    UIColor * strokeColor = [UIColor redColor];
    [strokeColor set];
    //根据我们设置的各个点连线，路径绘制
    [path stroke];
}
@end
