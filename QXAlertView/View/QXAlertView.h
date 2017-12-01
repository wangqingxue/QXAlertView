//
//  QXAlertView.h
//  QXAlertView
//
//  Created by 王庆学 on 2017/12/1.
//  Copyright © 2017年 王庆学. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, AlertViewSelectType){
    AlertViewSelectTypeUpToDown,
    AlertViewSelectTypeZoom,
    AlertViewSelectTypeLeftToRight,
    AlertViewSelectTypeRightToLeft,
    AlertViewSelectTypeBigToSmall,
};

@interface QXAlertView : UIView

+ (instancetype)initWithTitleSting:(NSString *)title andMessage:(NSString *)msg andOtherBtn:(NSString *)btn andSubMitStr:(NSString *)subMitStr andBackBlock:(void(^)(NSInteger select))selectBlock;
- (void)showWithView:(UIView *)view;
//动画类型
@property (nonatomic, assign) AlertViewSelectType alertType;
//动画时间
@property (nonatomic, assign) NSInteger duration;

@end
