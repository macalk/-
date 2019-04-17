//
//  BTDKHandle.m
//  KaiXinQianDai
//
//  Created by xiaoning on 2018/11/27.
//  Copyright © 2018年 xiaoning. All rights reserved.
//

#import "BMHandle.h"

@implementation BMHandle

+ (instancetype)shareHandle {
    static BMHandle *handle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        handle = [[BMHandle alloc] init];
    });
    return handle;
}

@end
