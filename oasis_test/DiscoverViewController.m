//
//  DiscoverViewController.m
//  oasis_test
//
//  Created by mk on 2014/07/12.
//  Copyright (c) 2014年 mk. All rights reserved.
//

#import "DiscoverViewController.h"
@interface DiscoverViewController ()

@end

@implementation DiscoverViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // SegmentedControlの値により異なるControllerを取得する
    UIViewController *vc = [self viewControllerForSegmentIndex:self.typeSegmentedControl.selectedSegmentIndex];
    // 取得したコントローラを子コントローラとして追加する
    [self addChildViewController:vc];
    
    // 子コントローラのViewを親コントローラのContent表示領域のサイズにする
    // スクロール対応していない場合などは画面から見切れる可能性があるので気をつけてください
    //vc.view.frame = self.contentView.bounds;
    vc.view.frame = CGRectMake(0, 50, 320, 450);
    [self.contentView addSubview:vc.view];
    self.currentViewController = vc;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// SegmentedControlの値により異なるControllerを取得する
- (UIViewController *)viewControllerForSegmentIndex:(NSInteger)index {
    NSLog(@"Segment changed %ld",(long)index);
    UIViewController *vc;
    switch (index) {
        case 0:
            vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MapViewController"];
            break;
        case 1:
            vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ListTableViewController"];
            break;
    }
    return vc;
}

// SegmentedControlの値を変更したときに呼ばれる
- (IBAction)segmentChange:(UISegmentedControl *)sender
{
    NSLog(@"Segment changed %ld",(long)sender.selectedSegmentIndex);
    // SegmentedControlの値により異なるControllerを取得する
    UIViewController *vc = [self viewControllerForSegmentIndex:sender.selectedSegmentIndex];
    // 取得したコントローラを子コントローラとして追加する
    [self addChildViewController:vc];
    // ビューを変更する
    [self.currentViewController.view removeFromSuperview];
    vc.view.frame = self.contentView.bounds;
    vc.view.frame = CGRectMake(0, 65, 320, 450);
    [self.contentView addSubview:vc.view];
    [vc didMoveToParentViewController:self];
    [self.currentViewController removeFromParentViewController];
    self.currentViewController = vc;

    /*
    [self transitionFromViewController:self.currentViewController toViewController:vc duration:0.5
                               options:UIViewAnimationOptionTransitionNone  // 変更するアニメーションを指定
                            animations:^{
                                [self.currentViewController.view removeFromSuperview];
                                vc.view.frame = self.contentView.bounds;
                                [self.contentView addSubview:vc.view];
                            } completion:^(BOOL finished) {
                                [vc didMoveToParentViewController:self];
                                [self.currentViewController removeFromParentViewController];
                                self.currentViewController = vc;
                            }];
     */
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
