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
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *alertView;

@end

@implementation QXAlertView

+ (instancetype)initWithTitleSting:(NSString *)title andMessage:(NSString *)msg andOtherBtn:(NSString *)btn andSubMitStr:(NSString *)subMitStr andBackBlock:(void(^)(NSInteger select))selectBlock{
    QXAlertView *alertView = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]firstObject];
    alertView.duration = 1;
    alertView.titleLabel.text = title;
    [alertView.cancelBtn setTitle:btn forState:UIControlStateNormal];
    [alertView.subMitBtn setTitle:subMitStr forState:UIControlStateNormal];
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
    switch (_alertType) {
        case AlertViewSelectTypeUpToDown:{
            CGPoint pointStart = CGPointMake(view.center.x, 0);
            self.alertView.layer.position = pointStart;
            CGPoint pointEnd = CGPointMake(view.center.x, view.center.y);
            [UIView animateWithDuration:_duration animations:^{
                self.alertView.layer.position = pointEnd;
            }];
            break;
        }
        case AlertViewSelectTypeZoom:{
            [UIView animateWithDuration:0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                [self.alertView.layer setValue:@(0) forKeyPath:@"transform.scale"];
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.03 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    [self.alertView.layer setValue:@(1.2) forKeyPath:@"transform.scale"];
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.09 delay:0.02 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                        [self.alertView.layer setValue:@(.9) forKeyPath:@"transform.scale"];
                    } completion:^(BOOL finished) {
                        [UIView animateWithDuration:0.05 delay:0.02 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                            [self.alertView.layer setValue:@(1.0) forKeyPath:@"transform.scale"];
                        } completion:^(BOOL finished) {
                            
                        }];
                    }];
                }];
            }];
            break;
        }
        case AlertViewSelectTypeLeftToRight:{
            CGPoint pointStart = CGPointMake(0, view.center.y);
            self.alertView.layer.position = pointStart;
            [UIView animateWithDuration:_duration animations:^{
                self.alertView.layer.position = CGPointMake(view.center.x, view.center.y);
            }];
            break;
        }
        case AlertViewSelectTypeRightToLeft:{
            CGPoint pointStart = CGPointMake(view.frame.size.width, view.center.y);
            self.alertView.layer.position = pointStart;
            [UIView animateWithDuration:_duration animations:^{
                self.alertView.layer.position = CGPointMake(view.center.x, view.center.y);
            }];
            break;
        }
        default:
            break;
    }
    
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
