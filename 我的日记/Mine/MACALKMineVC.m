//
//  MACALKMineVC.m
//  我的日记
//
//  Created by 鲁振 on 2019/4/8.
//  Copyright © 2019 鲁振. All rights reserved.
//

#import "MACALKMineVC.h"
#import "AboutVC.h"
#import "FankuiVC.h"
#import "SetVC.h"


@interface MACALKMineVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MACALKMineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    self.title = @"我的";
    
    [self configView];

    // Do any additional setup after loading the view.
}

- (void)configView {
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [UIView new];
    [self.view addSubview:tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSArray *imgArr = @[@"Icon-guanyu",@"Icon-fankui",@"Icon-shezhi"];
    NSArray *titArr = @[@"关于",@"反馈",@"设置"];
    
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",imgArr[indexPath.row]]];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",titArr[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.row == 0) {
        AboutVC *about = [[AboutVC alloc]init];
        about.view.backgroundColor = [UIColor whiteColor];
        [about setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:about animated:YES];
    }else if (indexPath.row == 1) {
        FankuiVC *fankui = [[FankuiVC alloc]init];
        fankui.view.backgroundColor = [UIColor whiteColor];
        [fankui setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:fankui animated:YES];
    }else {
        SetVC *set = [[SetVC alloc]init];
        set.view.backgroundColor = [UIColor whiteColor];
        [set setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:set animated:YES];
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
