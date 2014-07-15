//
//  DetailRoomViewController.m
//  oasis_test
//
//  Created by mk on 2014/07/10.
//  Copyright (c) 2014年 mk. All rights reserved.
//

#import "DetailRoomViewController.h"

@interface DetailRoomViewController ()

@end

@implementation DetailRoomViewController

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
    
    // UIScrollViewのインスタンス化
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = CGRectMake(0, 65, 320, 400);;
    
    // スクロールしたときバウンドさせないようにする
    scrollView.bounces = NO;
    
    
    // UIImageViewのインスタンス化
    // サンプルとして画面に収まりきらないサイズ
    CGRect rect = CGRectMake(0, 100, 320, 400);
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:rect];
    
    // 画像を設定
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.image = [UIImage imageNamed:@"example2.jpg"];
    
    // UIScrollViewのインスタンスに画像を貼付ける
    [scrollView addSubview:imageView];
    
    // ラベルをはりつける
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
    
    // 画像を設定
    label.text = @"渋谷の綺麗なオフィスです";
    // UIScrollViewのインスタンスに画像を貼付ける
    [scrollView addSubview:label];
    
    
    
    
    // UIScrollViewのコンテンツサイズを画像のサイズに合わせる
    scrollView.contentSize = CGRectMake(0, 0, 320, 800).size;
    
    // UIScrollViewのインスタンスをビューに追加
    [self.view addSubview:scrollView];
    
    // 表示されたときスクロールバーを点滅
    [scrollView flashScrollIndicators];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
