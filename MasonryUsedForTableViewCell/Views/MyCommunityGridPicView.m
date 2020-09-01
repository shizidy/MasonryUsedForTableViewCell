//
//  MyCommunityGridPicView.m
//  MasonryUsedForTableViewCell
//
//  Created by wdyzmx on 2020/9/1.
//  Copyright © 2020 wdyzmx. All rights reserved.
//

#import "MyCommunityGridPicView.h"

@interface MyCommunityGridPicView ()
// 九宫格图片
@property (nonatomic, strong) UIImageView *imgView1;
@property (nonatomic, strong) UIImageView *imgView2;
@property (nonatomic, strong) UIImageView *imgView3;
@property (nonatomic, strong) UIImageView *imgView4;
@property (nonatomic, strong) UIImageView *imgView5;
@property (nonatomic, strong) UIImageView *imgView6;
@property (nonatomic, strong) UIImageView *imgView7;
@property (nonatomic, strong) UIImageView *imgView8;
@property (nonatomic, strong) UIImageView *imgView9;
@end

@implementation MyCommunityGridPicView

- (instancetype)init {
    if (self = [super init]) {
        [self setupSubviews];
        [self setupSubviewsConstraints];
    }
    return self;
}

- (instancetype)initWithViewModel:(MyCommunityViewModel *)viewModel {
    if (self = [super init]) {
        [self setupSubviews];
        [self setupSubviewsConstraints];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame viewModel:(MyCommunityViewModel *)viewModel {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
        [self setupSubviewsConstraints];
    }
    return self;
}



- (void)setupSubviews {
    
}

- (void)setupSubviewsConstraints {
    CGFloat margin = 10;
    CGFloat lineSpace = 5;
    CGFloat interItemSpace = 5;
    CGFloat imgW = (kScreenWidth - margin * 2 - interItemSpace * 2) / 3;
    CGFloat imgH = imgW;
    
    for (int i = 0; i < 9; i++) {
        int row = i / 3;
        int col = i % 3;
        CGFloat imgX = margin + col * (imgW + interItemSpace);
        CGFloat imgY = row * (imgH + lineSpace);
        UIImageView *imgView = [[UIImageView alloc] init];
        [self addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imgX);
            make.top.mas_equalTo(imgY);
            make.size.mas_equalTo(CGSizeMake(imgW, imgH));
        }];
        switch (i) {
            case 0:
            {
                self.imgView1 = imgView;
            }
                break;
                
            case 1:
            {
                self.imgView2 = imgView;
            }
                break;
                
            case 2:
            {
                self.imgView3 = imgView;
            }
                break;
                
            case 3:
            {
                self.imgView4 = imgView;
            }
                break;
                
            case 4:
            {
                self.imgView5 = imgView;
            }
                break;
                
            case 5:
            {
                self.imgView6 = imgView;
            }
                break;
                
            case 6:
            {
                self.imgView7 = imgView;
            }
                break;
                
            case 7:
            {
                self.imgView8 = imgView;
            }
                break;
                
            case 8:
            {
                self.imgView9 = imgView;
            }
                break;
                
            default:
                break;
        }
    }
}

- (void)bindViewModel:(MyCommunityViewModel *)viewModel indexPath:(NSIndexPath *)indexPath {
    MyCommunityModel *model = viewModel.modelArray[indexPath.row];
    if (model.pics.count == 0) {
        for (UIImageView *view in self.subviews) {
            view.hidden = YES;
        }
    } else {
        for (int i = 0; i < 9; i++) {
            UIImageView *imgView = (UIImageView *)self.subviews[i];
            if (i < model.pics.count) {
                imgView.image = [UIImage imageNamed:model.pics[i]];
                imgView.hidden = NO;
            } else {
                imgView.image = nil;
                imgView.hidden = YES;
            }
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
