//
//  MyCommunityModel.h
//  MasonryUsedForTableViewCell
//
//  Created by wdyzmx on 2020/9/1.
//  Copyright © 2020 wdyzmx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyCommunityModel : NSObject
@property (nonatomic, copy) NSString *headPic;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, strong) NSArray *pics;
@end

NS_ASSUME_NONNULL_END
