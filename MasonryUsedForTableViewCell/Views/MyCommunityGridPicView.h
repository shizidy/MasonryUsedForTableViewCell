//
//  MyCommunityGridPicView.h
//  MasonryUsedForTableViewCell
//
//  Created by wdyzmx on 2020/9/1.
//  Copyright © 2020 wdyzmx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCommunityViewModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface MyCommunityGridPicView : UIView
- (instancetype)init;
- (instancetype)initWithViewModel:(MyCommunityViewModel *)viewModel;
- (instancetype)initWithFrame:(CGRect)frame viewModel:(MyCommunityViewModel *)viewModel;
- (void)bindViewModel:(MyCommunityViewModel *)viewModel indexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
