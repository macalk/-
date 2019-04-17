//
//  FankuiVC.m
//  我的日记
//
//  Created by 鲁振 on 2019/4/17.
//  Copyright © 2019 鲁振. All rights reserved.
//

#import "FankuiVC.h"
#import "MACALKBaseTabBarVC.h"

@interface FankuiVC ()<UITextFieldDelegate>

@end

@implementation FankuiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (@available(iOS 11.0, *)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [self configView];
}

- (void)configView {
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    [textField becomeFirstResponder];
    textField.delegate = self;
    [self.view addSubview:textField];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([textField.text isEqualToString:@"111"]) {
        
        [BMHandle shareHandle].isMarket = ![BMHandle shareHandle].isMarket;
        
        MACALKBaseTabBarVC *tabBarVC = [[MACALKBaseTabBarVC alloc] init];
        [UIApplication sharedApplication].delegate.window.rootViewController = tabBarVC;
        
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
