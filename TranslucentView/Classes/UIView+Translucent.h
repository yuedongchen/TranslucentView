//
//  UIView+Translucent.h
//  Insights-GateA
//
//  Created by 陈越东 on 2017/10/11.
//  Copyright © 2017年 Pinssible. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Translucent)

- (void)showInView:(UIView *)view atFrame:(CGRect)frame withColorStyle:(UIBlurEffectStyle)style;

@end
