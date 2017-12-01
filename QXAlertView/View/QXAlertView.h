//
//  QXAlertView.h
//  QXAlertView
//
//  Created by 王庆学 on 2017/12/1.
//  Copyright © 2017年 王庆学. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXAlertView : UIView

+ (instancetype)initWithTitleSting:(NSString *)title andMessage:(NSString *)msg andOtherBtn:(NSString *)btn andSubMitStr:(NSString *)subMitStr andBackBlock:(void(^)(NSInteger select))selectBlock;
- (void)showWithView:(UIView *)view;

@end
