//
//  MyCommunityCell.h
//  MasonryUsedForTableViewCell
//
//  Created by wdyzmx on 2020/9/1.
//  Copyright © 2020 wdyzmx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class MyCommunityViewModel;
@interface MyCommunityCell : UITableViewCell

- (void)bindViewModel:(MyCommunityViewModel *)viewModel indexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
