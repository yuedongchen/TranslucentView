//
//  UIView+Translucent.m
//  Insights-GateA
//
//  Created by 陈越东 on 2017/10/11.
//  Copyright © 2017年 Pinssible. All rights reserved.
//

#import "UIView+Translucent.h"

@implementation UIView (Translucent)

- (void)showInView:(UIView *)view atFrame:(CGRect)frame withColorStyle:(UIBlurEffectStyle)style
{
    self.backgroundColor = [UIColor colorWithPatternImage:[self getSnapshotImageWithFrame:frame]];
    
    self.frame = frame;
    [view addSubview:self];
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:style];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    effectView.frame = self.frame;
    
    [self insertSubview:effectView atIndex:0];
}

- (UIImage *)getSnapshotImageWithFrame:(CGRect)frame
{
    UIGraphicsBeginImageContext([UIApplication sharedApplication].keyWindow.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    UIRectClip(frame);
    [[UIApplication sharedApplication].keyWindow.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    theImage = [UIImage imageWithCGImage:CGImageCreateWithImageInRect([theImage CGImage],frame)];
    return  theImage;
}

@end
