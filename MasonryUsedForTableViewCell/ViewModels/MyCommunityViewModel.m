//
//  MyCommunityViewModel.m
//  MasonryUsedForTableViewCell
//
//  Created by wdyzmx on 2020/9/1.
//  Copyright © 2020 wdyzmx. All rights reserved.
//

#import "MyCommunityViewModel.h"

NSString * const text1 = @"这是最为常用的格式，在平时常用的的文本编辑器中大多是这样现的：输入文本、选中文本、设置标题格式";
NSString * const text2 = @"这是最为常用的格式，在平时常用的的文本编辑器中大多是这样现的：输入文本、选中文本、设置标题格式。而在 Markdown 中，你只需要在文本前面加上 # 即可，同理、你还可以增加二级标题、三级标题、四级标题、五级标题和六级标题，总共六级，只需要增加 # 即可，标题字号相应降低。例如";
NSString * const text3 = @"在平时常用的的文本编辑器中大多是这样现的：输入文本、选中文本、设置标题格式。而在 Markdown";
NSString * const text4 = @"你只需要在文本前面加上 # 即可，同理、你还可以增加二级标题、三级标题、四级标题、五级输入文本、选中文本、设置标题格式。而在 Markdown";
NSString * const text5 = @"这是最为常用的格式，在平时常用的的文本编辑器中大多是这样现的：输入文本、选中文本、设置标题格式。而在 Markdown 中，你只需要在文本前面加上 # 即可，同理、你还可以增加二级标题、三级标题";

@interface MyCommunityViewModel ()

@end

@implementation MyCommunityViewModel

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (NSMutableArray<MyCommunityModel *> *)modelArray {
    if (!_modelArray) {
        _modelArray = [NSMutableArray arrayWithCapacity:12];
        NSArray *contentArray = [NSArray arrayWithObjects:
                                 text1,
                                 text2,
                                 text3,
                                 text4,
                                 text5, nil];
        
        NSArray *names = @[
            @"这里是标题这里是标题这里是标题这里是标题这里是标题这里是标题这里是标题这里是标题这",
            @"这里是标题这里是标题这里是标题这里是标题这里是标题这里是标题这里是标题这里是标题这里是标题这里是标题这里是标题这里是标题",
            @"这里是标题这里是标题这里",
            @"这里是标题这里是标题这里是标题这里是",
            @"这里是时",
        ];
        
        NSArray *times = @[
            @"副标题",
            @"副标题标题标题标题标题标题标题标题标题标题",
            @"副标题标题标题标题标题标题标题标题标题标题",
            @"副标题标题标题标题标题",
            @"副标题标题标题标题标题标题标题标题",
        ];
                
        for (int i = 0; i < 11; i++) {
            MyCommunityModel *model = [[MyCommunityModel alloc] init];
            model.name = [names objectAtIndex:(i % 5)];
            model.time = [times objectAtIndex:(i % 5)];
            model.content = [contentArray objectAtIndex:(i % 5)];
            model.headPic = [NSString stringWithFormat:@"pic%d",  i];
            // 随机生成10组图片数组
            int count = arc4random() % 10;
            NSMutableArray *picsArray = [NSMutableArray arrayWithCapacity:9];
            for (int i = 0; i < count; i++) {
                NSString *name = [NSString stringWithFormat:@"pic%d",  i];
                [picsArray addObject:name];
            }
            model.pics = picsArray.copy;
            [_modelArray addObject:model];
        }
    }
    return _modelArray;
}

@end
