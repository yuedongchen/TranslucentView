//
//  UIViewController+Translucent.m
//  Insights
//
//  Created by 陈越东 on 17/2/13.
//  Copyright © 2017年 Pinssible. All rights reserved.
//

#import "UIViewController+Translucent.h"

@implementation UIViewController (Translucent)

- (void)presentTranslucentViewController:(UIViewController *)vc withColorStyle:(UIBlurEffectStyle)style completion:(void (^)(void))completion
{
    vc.view.backgroundColor = [UIColor colorWithPatternImage:[self getSnapshotImage]];
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:style];
    UIVisualEffectView *view = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    view.frame = vc.view.frame;
    
    [vc.view insertSubview:view atIndex:0];
    
    [self presentViewController:vc animated:YES completion:completion];
}

- (UIImage *)getSnapshotImage
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(CGRectGetWidth([UIApplication sharedApplication].keyWindow.frame), CGRectGetHeight([UIApplication sharedApplication].keyWindow.frame)), NO, 1);
    [[UIApplication sharedApplication].keyWindow drawViewHierarchyInRect:CGRectMake(0, 0, CGRectGetWidth([UIApplication sharedApplication].keyWindow.frame), CGRectGetHeight([UIApplication sharedApplication].keyWindow.frame)) afterScreenUpdates:NO];
    UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snapshot;
}

@end
