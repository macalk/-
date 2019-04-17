//
//  AboutVC.m
//  我的日记
//
//  Created by 鲁振 on 2019/4/17.
//  Copyright © 2019 鲁振. All rights reserved.
//

#import "AboutVC.h"

@interface AboutVC ()

@end

@implementation AboutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"说明\n\n该应用一旦卸载，其保存的笔记将会遗失！";
    label.center = CGPointMake(self.view.center.x, self.view.center.y-100);
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.bounds = CGRectMake(0, 0, self.view.bounds.size.width, 200);
    [self.view addSubview:label];
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
