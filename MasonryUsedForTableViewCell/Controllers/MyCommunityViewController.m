//
//  MyCommunityViewController.m
//  MasonryUsedForTableViewCell
//
//  Created by wdyzmx on 2020/9/1.
//  Copyright © 2020 wdyzmx. All rights reserved.
//

#import "MyCommunityViewController.h"
#import "MyCommunityCell.h"
#import "MyCommunityViewModel.h"

@interface MyCommunityViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) MyCommunityViewModel *viewModel;
@end

@implementation MyCommunityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"朋友圈";
    [self setupUI];
}

- (void)setupUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:({
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        _tableView.estimatedRowHeight = 0;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        
        [_tableView registerClass:[MyCommunityCell class] forCellReuseIdentifier:NSStringFromClass([MyCommunityCell class])];
        
        _tableView;
    })];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.modelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyCommunityCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MyCommunityCell class]) forIndexPath:indexPath];
    [cell bindViewModel:self.viewModel indexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate

#pragma mark - 懒加载
- (MyCommunityViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[MyCommunityViewModel alloc] init];
    }
    return _viewModel;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
