//
//  UIView+Badge.m
//  GetBadgeDemo
//
//  Created by csj on 13-3-15.
//  Copyright (c) 2013年 eu. All rights reserved.
//

#import "UIView+Badge.h"

@implementation UIView ( UIView_Badge)

- (UIView *)showBadgeValue:(NSString *)strBadgeValue
{
    UITabBar *tabBar = [[UITabBar alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"" image:nil tag:0];
    item.badgeValue = strBadgeValue;
    NSArray *array = [[NSArray alloc] initWithObjects:item, nil];
    tabBar.items = array;
    [item release];
    [array release];
    //寻找
    
    for (UIView *viewTab in tabBar.subviews) {
        for (UIView *subview in viewTab.subviews) {
            NSString *strClassName = [NSString stringWithUTF8String:object_getClassName(subview)];
            if ([strClassName isEqualToString:@"UITabBarButtonBadge"] ||
                [strClassName isEqualToString:@"_UIBadgeView"]) {
                //从原视图上移除
                [subview removeFromSuperview];
                [self addSubview:subview];
                subview.frame = CGRectMake(self.frame.size.width-subview.frame.size.width, 0,
                                           subview.frame.size.width, subview.frame.size.height);
                [tabBar release];
                return subview;
            }
        }
    }
    [tabBar release];
    return nil;
}

- (void)removeBadgeValue
{
    //
    for (UIView *subview in self.subviews) {
        NSString *strClassName = [NSString stringWithUTF8String:object_getClassName(subview)];
        if ([strClassName isEqualToString:@"UITabBarButtonBadge"] ||
            [strClassName isEqualToString:@"_UIBadgeView"]) {
            [subview removeFromSuperview];
            break;
        }
    }
}

@end
