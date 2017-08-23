//
//  ViewController.m
//  阴影
//
//  Created by 胡高广 on 2017/8/23.
//  Copyright © 2017年 胡高广. All rights reserved.
//

#import "ViewController.h"
#define TCUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue &0xFF00) >>8))/255.0 blue:((float)(rgbValue &0xFF))/255.0 alpha:1.0]
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leftbackiamge"]];
    image.frame = CGRectMake(100, self.view.frame.size.height - 300, 100, 100);
    //加个图层 设置阴影
    CALayer *layer = [[CALayer alloc] init];
    layer.frame = CGRectMake(100, self.view.frame.size.height - 300, 100, 100);
    layer.shadowOffset = CGSizeMake(0, 5);
    layer.backgroundColor = [UIColor brownColor].CGColor;
    layer.shadowColor = [UIColor brownColor].CGColor;
    layer.shadowOpacity = 0.7;
    layer.cornerRadius = 50;
    [self.view.layer addSublayer:layer];
    image.layer.masksToBounds = YES;
    image.layer.cornerRadius = 50;
    //注意一定要先上层再上image，这样保证image在层之上。
    [self.view addSubview:image];
    
    
    
    //渐变的按钮
    UIButton *lookBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    lookBtn.frame = CGRectMake(100, 100,100, 100);
    [lookBtn setTitle:@"查看详情" forState:(UIControlStateNormal)];
    [lookBtn addTarget:self action:@selector(lookBtn) forControlEvents:(UIControlEventTouchUpInside)];
    lookBtn.layer.shadowColor=[TCUIColorFromRGB(0x24A7F2) colorWithAlphaComponent:0.5].CGColor;
    lookBtn.layer.shadowOffset=CGSizeMake(4, 4);
    lookBtn.layer.shadowOpacity=0.5;
    lookBtn.layer.shadowRadius= 5;
    
    //渐变颜色
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)TCUIColorFromRGB(0x5FCAFF).CGColor, (__bridge id)TCUIColorFromRGB(0x24A7F2).CGColor];
    gradientLayer.locations = @[@0.3, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = CGRectMake(0, 0,  100, 100);
    gradientLayer.cornerRadius = 50;
    [lookBtn.layer addSublayer:gradientLayer];
    [self.view addSubview:lookBtn];
    


    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark -- 点击事件
- (void)lookBtn
{
    NSLog(@"点击事件");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
