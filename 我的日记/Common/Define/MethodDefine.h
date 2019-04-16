//
//  MethodDefine.h
//  我的日记
//
//  Created by 鲁振 on 2019/4/9.
//  Copyright © 2019 鲁振. All rights reserved.
//

#ifndef MethodDefine_h
#define MethodDefine_h

#define BMImage(name)                       [UIImage imageNamed:name]
#define BMString(string,args...)            [NSString stringWithFormat:string, args]
#define BMHexColor(string)                  [UIColor colorWithHexString:string]
#define BMHexColorAlpha(string, value)      [UIColor colorWithHexString:string alpha:value]
#define BMFont(size)                        [UIFont systemFontOfSize:size]
#define BMBoldFont(size)                    [UIFont boldSystemFontOfSize:size]
#define BMUrl(string)                       [NSURL URLWithString:string]


#define Strong                                @property (nonatomic, strong)
#define Weak                                  @property (nonatomic, weak)
#define Copy                                  @property (nonatomic, copy)
#define Assign                                @property (nonatomic, assign)

#define NULLString(string) ((![string isKindOfClass:[NSString class]])||[string isEqualToString:@""] || (string == nil) || [string isEqualToString:@""] || [string isKindOfClass:[NSNull class]]||[[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0 || [string isEqualToString:@"(null)"])


#ifndef weakify
# define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#endif

#ifndef strongify
# define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#endif


#endif /* MethodDefine_h */
