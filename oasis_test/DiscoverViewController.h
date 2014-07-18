//
//  DiscoverViewController.h
//  oasis_test
//
//  Created by mk on 2014/07/12.
//  Copyright (c) 2014年 mk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscoverViewController : UIViewController

//http://development.hatenadiary.com/entry/20131222/1387684551
//セグメントで内容を変更する
// セグメンテッドコントローラ
@property (weak, nonatomic) IBOutlet UISegmentedControl *typeSegmentedControl;
// 切り替えるコンテンツを表示させる領域
@property (weak, nonatomic) IBOutlet UIView *contentView;
// 現在のViewControllerを保持しておく変数
@property (weak, nonatomic) IBOutlet UIViewController *currentViewController;
// SegmentedControlの値を変更したときに呼ばれる
- (IBAction)segmentChange:(UISegmentedControl *)sender;

@end
