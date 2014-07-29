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
    
    // UIScrollViewのコンテンツサイズを画像のサイズに合わせる
    scrollView.contentSize = CGRectMake(0, 0, 320, 900).size;
    
    
    // スクロールしたときバウンドさせないようにする
    scrollView.bounces = NO;
    
    
    // UIImageViewのインスタンス化
    // サンプルとして画面に収まりきらないサイズ
    CGRect rect = CGRectMake(0, 0, 320, 300);
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:rect];
    
    // 画像を設定
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = [UIImage imageNamed:@"example2.jpg"];
    
    // UIScrollViewのインスタンスに画像を貼付ける
    [scrollView addSubview:imageView];
    
    // ラベルをはりつける
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 320, 320, 100)];
    // 中身
    label.text = @"渋谷の綺麗なオフィスです";
    // UIScrollViewのインスタンスに画像を貼付ける
    [scrollView addSubview:label];
    
    
    // ラベルをはりつける
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(10, 350, 320, 100)];
    // 中身
    label2.text = @"渋谷から徒歩５分です";
    // UIScrollViewのインスタンスに画像を貼付ける
    [scrollView addSubview:label2];

    // 画像を設定
    // サンプルとして画面に収まりきらないサイズ
    rect = CGRectMake(0, 370, 320, 300);
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:rect];
    imageView2.contentMode = UIViewContentModeScaleAspectFit;
    imageView2.image = [UIImage imageNamed:@"example3.jpg"];
    
    // UIScrollViewのインスタンスに画像を貼付ける
    [scrollView addSubview:imageView2];

    // ラベルをはりつける
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(10, 680, 320, 100)];
    // 中身
    label3.text = @"13:00-19:00";
    // UIScrollViewのインスタンスに画像を貼付ける
    [scrollView addSubview:label3];
    
    // アメニティ
    // サンプルとして画面に収まりきらないサイズ
    rect = CGRectMake(10, 750, 30, 30);
    UIImageView *imageView3 = [[UIImageView alloc]initWithFrame:rect];
    imageView3.contentMode = UIViewContentModeScaleAspectFit;
    imageView3.image = [UIImage imageNamed:@"ame1.png"];
    [scrollView addSubview:imageView3];

    // アメニティ
    // サンプルとして画面に収まりきらないサイズ
    rect = CGRectMake(50, 750, 30, 30);
    UIImageView *imageView4 = [[UIImageView alloc]initWithFrame:rect];
    imageView4.contentMode = UIViewContentModeScaleAspectFit;
    imageView4.image = [UIImage imageNamed:@"ame2.png"];
    [scrollView addSubview:imageView4];

    // アメニティ
    // サンプルとして画面に収まりきらないサイズ
    rect = CGRectMake(90, 750, 30, 30);
    UIImageView *imageView5 = [[UIImageView alloc]initWithFrame:rect];
    imageView5.contentMode = UIViewContentModeScaleAspectFit;
    imageView5.image = [UIImage imageNamed:@"ame3.png"];
    [scrollView addSubview:imageView5];

    // アメニティ
    // サンプルとして画面に収まりきらないサイズ
    rect = CGRectMake(130, 750, 30, 30);
    UIImageView *imageView6 = [[UIImageView alloc]initWithFrame:rect];
    imageView6.contentMode = UIViewContentModeScaleAspectFit;
    imageView6.image = [UIImage imageNamed:@"wifi.png"];
    [scrollView addSubview:imageView6];
    
    
    // UIScrollViewのインスタンスに画像を貼付ける
    [scrollView addSubview:imageView2];
    
    
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
