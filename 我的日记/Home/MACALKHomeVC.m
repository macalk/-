//
//  MACALKHomeVC.m
//  我的日记
//
//  Created by 鲁振 on 2019/4/8.
//  Copyright © 2019 鲁振. All rights reserved.
//

#import "MACALKHomeVC.h"
#import "MACALKHomeDetialVC.h"

@interface MACALKHomeVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *dataArr;
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation MACALKHomeVC

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"记事本";
    self.view.backgroundColor = [UIColor redColor];
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    NSArray *dataArr = [[NSUserDefaults standardUserDefaults]objectForKey:@"dataArr"];
    if (dataArr && dataArr.count > 0) {
        self.dataArr = [NSMutableArray arrayWithArray:dataArr];
    }else {
        self.dataArr = [NSMutableArray array];
    }
    
    
    [self configView];
    
    // Do any additional setup after loading the view.
}

- (void)configView {
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 60;
    tableView.tableFooterView = [UIView new];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight |
    UIViewAutoresizingFlexibleWidth;
    self.tableView = tableView;
    [self.view addSubview:tableView];
}

- (UIView *)configTableFootView {
    UIView *footView = [[UIView alloc]init];
    footView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 60);
    
    UILabel *tit = [[UILabel alloc]init];
    tit.frame = CGRectMake(0, 0, self.view.bounds.size.width, 60);
    tit.textAlignment = NSTextAlignmentCenter;
    tit.text = @"新建笔记";
    tit.font = [UIFont systemFontOfSize:15];
    [footView addSubview:tit];
    
    return footView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    if (self.dataArr.count > 0 && indexPath.row<self.dataArr.count) {
        cell.imageView.image = [UIImage imageNamed:@"Icon"];
        cell.textLabel.text = [NSString stringWithFormat:@"%@",self.dataArr[indexPath.row]];;
        cell.textLabel.font = [UIFont systemFontOfSize:15];

    }
    if (indexPath.row == self.dataArr.count) {
        cell.imageView.image = [UIImage imageNamed:@"Icon-white"];
        
        UIImageView *addImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Icon-add"]];
        [cell.contentView addSubview:addImg];
        
        
        UILabel *title = [[UILabel alloc]init];
        title.text = @"新建笔记";
        title.font = [UIFont systemFontOfSize:15];
        title.textColor = [UIColor blackColor];
        title.textAlignment = NSTextAlignmentCenter;
        CGFloat strWidth = [title.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.width;
        [cell.contentView addSubview:title];
        
        [cell setSeparatorInset:UIEdgeInsetsZero];
        
        addImg.frame = CGRectMake(self.view.bounds.size.width/2-45, 20, 20, 20);
        title.frame = CGRectMake(self.view.bounds.size.width/2-15, 0, strWidth, 60);
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MACALKHomeDetialVC *detailVC = [[MACALKHomeDetialVC alloc]init];
    
    if (indexPath.row == self.dataArr.count) {
        detailVC.newText = ^(NSString *text) {
            [self.dataArr addObject:text];
            [[NSUserDefaults standardUserDefaults]setObject:self.dataArr forKey:@"dataArr"];
            [self.tableView reloadData];
        };
    }else {
        detailVC.text = [NSString stringWithFormat:@"%@",self.dataArr[indexPath.row]];
        detailVC.newText = ^(NSString *text) {
            [self.dataArr replaceObjectAtIndex:indexPath.row withObject:text];
            [[NSUserDefaults standardUserDefaults]setObject:self.dataArr forKey:@"dataArr"];
            [self.tableView reloadData];
        };
    }
    
    [detailVC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:detailVC animated:YES];
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
