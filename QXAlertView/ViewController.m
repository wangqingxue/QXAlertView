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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    QXAlertView *alertView = [QXAlertView initWithTitleSting:@"标题" andMessage:@"详细信息" andOtherBtn:@"取消" andSubMitStr:@"确定" andBackBlock:^(NSInteger select) {
        NSLog(@"%ld",select);
    }];
    [alertView showWithView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
