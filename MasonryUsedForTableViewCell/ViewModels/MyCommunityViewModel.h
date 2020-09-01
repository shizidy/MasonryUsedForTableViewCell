//
//  MyCommunityViewModel.h
//  MasonryUsedForTableViewCell
//
//  Created by wdyzmx on 2020/9/1.
//  Copyright © 2020 wdyzmx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Masonry.h>
#import "MyCommunityModel.h"

#define kScreenWidth UIScreen.mainScreen.bounds.size.width
#define kScreenHeight UIScreen.mainScreen.bounds.size.height

NS_ASSUME_NONNULL_BEGIN

@interface MyCommunityViewModel : NSObject

@property (nonatomic, strong) NSMutableArray<MyCommunityModel *> *modelArray;

@end


NS_ASSUME_NONNULL_END
