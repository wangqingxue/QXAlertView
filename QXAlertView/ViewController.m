//
//  ViewController.m
//  QXAlertView
//
//  Created by 王庆学 on 2017/12/1.
//  Copyright © 2017年 王庆学. All rights reserved.
//

#import "ViewController.h"
#import "QXAlertView.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)upToDown:(id)sender {
    QXAlertView *alertView = [QXAlertView initWithTitleSting:@"标题title" andMessage:@"详细信息" andOtherBtn:@"取消" andSubMitStr:@"确定" andBackBlock:^(NSInteger select) {
        NSLog(@"%ld",select);
    }];
    alertView.duration = 0.8;
    alertView.alertType = AlertViewSelectTypeUpToDown;
    [alertView showWithView:self.view];
}

- (IBAction)leftToRight:(id)sender {
    QXAlertView *alertView = [QXAlertView initWithTitleSting:@"标题title" andMessage:@"详细信息" andOtherBtn:@"取消" andSubMitStr:@"确定" andBackBlock:^(NSInteger select) {
        NSLog(@"%ld",select);
    }];
    alertView.duration = 1.2;
    alertView.alertType = AlertViewSelectTypeZoom;
    [alertView showWithView:self.view];
}
- (IBAction)rightToLeft:(id)sender {
    QXAlertView *alertView = [QXAlertView initWithTitleSting:@"标题title" andMessage:@"详细信息" andOtherBtn:@"取消" andSubMitStr:@"确定" andBackBlock:^(NSInteger select) {
        NSLog(@"%ld",select);
    }];
    alertView.duration = 1.2;
    alertView.alertType = AlertViewSelectTypeRightToLeft;
    [alertView showWithView:self.view];
}
- (IBAction)leftToRightAnimate:(id)sender {
    QXAlertView *alertView = [QXAlertView initWithTitleSting:@"标题title" andMessage:@"详细信息" andOtherBtn:@"取消" andSubMitStr:@"确定" andBackBlock:^(NSInteger select) {
        NSLog(@"%ld",select);
    }];
    alertView.duration = 1.2;
    alertView.alertType = AlertViewSelectTypeLeftToRight;
    [alertView showWithView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
