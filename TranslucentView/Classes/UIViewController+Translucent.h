//
//  UIViewController+Translucent.h
//  Insights
//
//  Created by 陈越东 on 17/2/13.
//  Copyright © 2017年 Pinssible. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Translucent)

- (void)presentTranslucentViewController:(UIViewController *)vc withColorStyle:(UIBlurEffectStyle)style completion:(void (^ )(void))completion;

@end
