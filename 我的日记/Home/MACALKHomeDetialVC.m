//
//  MACALKHomeDetialVC.m
//  我的日记
//
//  Created by 鲁振 on 2019/4/10.
//  Copyright © 2019 鲁振. All rights reserved.
//

#import "MACALKHomeDetialVC.h"

@interface MACALKHomeDetialVC ()

@property (nonatomic,strong)UITextView *textView;

@end

@implementation MACALKHomeDetialVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self configView];
    // Do any additional setup after loading the view.
}

- (void)configView {
    self.textView = [[UITextView alloc]initWithFrame:self.view.bounds];
    self.textView.font = [UIFont systemFontOfSize:14];
    self.textView.autoresizingMask = UIViewAutoresizingFlexibleHeight |
    UIViewAutoresizingFlexibleWidth;
    [self.textView resignFirstResponder];
    [self.view addSubview:self.textView];
    
    if (self.text) {
        self.textView.text = self.text;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.newText(self.textView.text);
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
