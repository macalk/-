//
//  MACALKHomeDetialVC.h
//  我的日记
//
//  Created by 鲁振 on 2019/4/10.
//  Copyright © 2019 鲁振. All rights reserved.
//

#import "MACALKBaseVC.h"



@interface MACALKHomeDetialVC : MACALKBaseVC

@property (nonatomic,copy) void(^newText) (NSString *text);
@property (nonatomic,copy) NSString *text;

@end


