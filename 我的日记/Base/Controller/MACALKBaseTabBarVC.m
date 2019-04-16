//
//  MACBaseViewController.m
//  我的日记
//
//  Created by 鲁振 on 2019/4/8.
//  Copyright © 2019 鲁振. All rights reserved.
//

#import "MACALKBaseTabBarVC.h"
#import "MACALKBaseNAVC.h"
#import "MACALKHomeVC.h"
#import "MACALKContentVC.h"
#import "MACALKMineVC.h"


@interface MACALKBaseTabBarVC ()<UITabBarControllerDelegate>

@property (nonatomic,assign) BOOL showWeb;

@end

@implementation MACALKBaseTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.translucent = NO;
    self.delegate = self;
    [self configTabBar];
}

- (void)configTabBar {
    
    if (!self.showWeb) {
        
        MACALKContentVC *contentVC = [[MACALKContentVC alloc]init];
        contentVC.view.backgroundColor = [UIColor whiteColor];
        contentVC.tabBarItem.title = @"首页";
        contentVC.tabBarItem.image = [[UIImage imageNamed:@"bottom_icon_home2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        contentVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"bottom_icon_home"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [contentVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:Tab_Color_Normal} forState:UIControlStateNormal];
        [contentVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:Tab_Color_Selected} forState:UIControlStateSelected];
        [self addChildViewController:contentVC];
        
    }else {
        MACALKHomeVC *homeVC = [[MACALKHomeVC alloc]init];
        MACALKBaseNAVC *nav1 = [[MACALKBaseNAVC alloc]initWithRootViewController:homeVC];
        nav1.tabBarItem.title = @"笔记";
        nav1.tabBarItem.image = [[UIImage imageNamed:@"bottom_icon_home2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nav1.tabBarItem.selectedImage = [[UIImage imageNamed:@"bottom_icon_home"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [nav1.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:Tab_Color_Normal} forState:UIControlStateNormal];
        [nav1.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:Tab_Color_Selected} forState:UIControlStateSelected];
        [self addChildViewController:nav1];
        
    }
    MACALKMineVC *mineVC = [[MACALKMineVC alloc]init];
    MACALKBaseNAVC *nav3 = [[MACALKBaseNAVC alloc]initWithRootViewController:mineVC];
    nav3.tabBarItem.title = @"我的";
    nav3.tabBarItem.image = [[UIImage imageNamed:@"bottom_icon_me2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav3.tabBarItem.selectedImage = [[UIImage imageNamed:@"bottom_icon_me"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [nav3.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:Tab_Color_Normal} forState:UIControlStateNormal];
    [nav3.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:Tab_Color_Selected} forState:UIControlStateSelected];
    [self addChildViewController:nav3];
    
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
//    [self MACALKAnimateTabBarButton];
}

- (void)MACALKAnimateTabBarButton {
    NSMutableArray *tabBarButtons = [[NSMutableArray alloc]initWithCapacity:0];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]){
            [tabBarButtons addObject:tabBarButton];
        }
    }
    UIControl *tabBarButton = [tabBarButtons objectAtIndex:self.selectedIndex];
    for (UIView *imageView in tabBarButton.subviews) {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.0,@1.1,@0.9,@1.0];
            animation.duration = 0.3;
            animation.calculationMode = kCAAnimationCubic;
            [imageView.layer addAnimation:animation forKey:nil];
            break;
        }
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
