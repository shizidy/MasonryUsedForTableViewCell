//
//  MyCommunityCell.m
//  MasonryUsedForTableViewCell
//
//  Created by wdyzmx on 2020/9/1.
//  Copyright © 2020 wdyzmx. All rights reserved.
//

#import "MyCommunityCell.h"
#import "MyCommunityGridPicView.h"

@interface MyCommunityCell()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) MyCommunityGridPicView *picView;

@end

@implementation MyCommunityCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self setupSubviews];
        [self setupSubviewsConstraints];
    }
    return self;
}

- (void)setupSubviews {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _iconView = [[UIImageView alloc] init];
    [self.contentView addSubview:_iconView];
    
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.font = [UIFont systemFontOfSize:16];
    _nameLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_nameLabel];

    _timeLabel = [[UILabel alloc] init];
    _timeLabel.font = [UIFont systemFontOfSize:14];
    _timeLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_timeLabel];

    _contentLabel = [[UILabel alloc] init];
    _contentLabel.font = [UIFont systemFontOfSize:15];
    _contentLabel.numberOfLines = 0;
    [self.contentView addSubview:_contentLabel];
    
    _picView = [[MyCommunityGridPicView alloc] init];
    [self.contentView addSubview:_picView];
    _picView.clipsToBounds = YES;
}

- (void)setupSubviewsConstraints {
    CGFloat margin = 10;
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(margin);
        make.top.mas_equalTo(margin);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];

    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconView.mas_right).offset(margin);
        make.top.equalTo(self.iconView);
        make.right.mas_lessThanOrEqualTo(-10);
    }];

    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
        make.bottom.equalTo(self.iconView);
        make.width.mas_lessThanOrEqualTo(100);
    }];

    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconView);
        make.top.equalTo(self.iconView.mas_bottom).offset(margin);
        make.right.mas_equalTo(-margin);
    }];

    [self.picView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLabel.mas_bottom).offset(margin);
        make.left.and.right.mas_equalTo(0.0);
        make.bottom.mas_equalTo(-margin);
    }];
    
}

- (void)bindViewModel:(MyCommunityViewModel *)viewModel indexPath:(NSIndexPath *)indexPath {
    MyCommunityModel *model = viewModel.modelArray[indexPath.row];
    self.nameLabel.text = model.name;
    self.timeLabel.text = model.time;
    self.contentLabel.text = model.content;
    self.iconView.image = [UIImage imageNamed:model.headPic];
        // 运用sizeToFit自动高度和宽度
    //    [self.nameLabel sizeToFit];  // 如果想让label自动宽度，masonry就不要同时设置left,right否则sizeToFit方法失效
    //    [self.timeLabel sizeToFit];  // 使用了masonry约束后，再使用sizeToFit方法，如果masonry同时约束了top,bottom或者height那么sizeToFit将对该控件的高度无效，同理，如果masonry同时约束了left,right或者width那么sizeToFit将对该控件的宽度无效
        //
    [self.picView bindViewModel:viewModel indexPath:indexPath];
    // 更新picView的constraints
    // 计算行数
    NSInteger row = model.pics.count != 0 ? (model.pics.count - 1) / 3 + 1 : 0;
    CGFloat margin = 10;
    CGFloat lineSpace = 5;
    CGFloat interItemSpace = 5;
    CGFloat imgW = (kScreenWidth - margin * 2 - interItemSpace * 2) / 3;
    CGFloat imgH = imgW;
    if (row == 0) {
        [self.picView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0.0).priorityHigh();
        }];
    } else {
        [self.picView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(row * imgH + (row - 1) * lineSpace).priorityHigh();
        }];
    }
    self.picView.hidden = !model.pics.count;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
