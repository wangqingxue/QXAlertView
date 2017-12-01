//
//  QXAlertView.m
//  QXAlertView
//
//  Created by 王庆学 on 2017/12/1.
//  Copyright © 2017年 王庆学. All rights reserved.
//

#import "QXAlertView.h"

@interface QXAlertView()

@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *subMitBtn;
@property (nonatomic, copy) void(^selectBlock)(NSInteger select);

@end

@implementation QXAlertView

+ (instancetype)initWithTitleSting:(NSString *)title andMessage:(NSString *)msg andOtherBtn:(NSString *)btn andSubMitStr:(NSString *)subMitStr andBackBlock:(void(^)(NSInteger select))selectBlock{
    QXAlertView *alertView = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]firstObject];
    alertView.selectBlock = selectBlock;
    return alertView;
}

- (IBAction)subMitClick:(id)sender {
    if (self.selectBlock) self.selectBlock(1);
    [self removeFromSuperview];
}

- (IBAction)cancelBtnClick:(id)sender {
    if (self.selectBlock) self.selectBlock(0);
    [self removeFromSuperview];
}
- (IBAction)cancelClick:(id)sender {
    [self removeFromSuperview];
}

- (void)showWithView:(UIView *)view{
    [view addSubview:self];
}

- (void)dealloc{
    NSLog(@"告诉我，我被销毁了吗");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
