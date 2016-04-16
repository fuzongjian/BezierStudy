//
//  ViewController.m
//  BezierStudy
//
//  Created by 陈舒澳 on 16/4/16.
//  Copyright © 2016年 xingbida. All rights reserved.
//

#import "ViewController.h"
#import "BezierView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BezierView * view = [[BezierView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    view.center = self.view.center;
    view.backgroundColor = [UIColor whiteColor];
    view.layer.borderColor = [UIColor greenColor].CGColor;
    view.layer.borderWidth = 3;
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
