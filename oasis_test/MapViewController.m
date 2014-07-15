//
//  MapViewController.m
//  oasis_test
//
//  Created by mk on 2014/07/09.
//  Copyright (c) 2014年 mk. All rights reserved.
//

#import "MapViewController.h"
#import "CustomAnnotation.h"
#import "DetailRoomViewController.h"
@interface MapViewController ()<MKMapViewDelegate>
@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController
@synthesize mapView;

//http://maezono.info/2014/03/22/2289

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
    mapData = [NSMutableArray array];
    NSDictionary *data1 = [NSDictionary dictionaryWithObjectsAndKeys:@"渋谷カフェ",@"title",@"とても綺麗なカフェです",@"subtitle",[NSNumber numberWithFloat:35.72],@"lat",[NSNumber numberWithFloat:139.809471],@"lon", nil];
    [mapData addObject:data1];
    NSDictionary *data2 = [NSDictionary dictionaryWithObjectsAndKeys:@"新宿カフェ",@"title",@"広くて、ゆったりとした時間を過ごせます",@"subtitle",[NSNumber numberWithFloat:35.73],@"lat",[NSNumber numberWithFloat:139.80941],@"lon", nil];
    [mapData addObject:data2];
    NSDictionary *data3 = [NSDictionary dictionaryWithObjectsAndKeys:@"渋谷カフェ",@"title",@"とても綺麗なカフェです",@"subtitle",[NSNumber numberWithFloat:35.72],@"lat",[NSNumber numberWithFloat:139.9],@"lon", nil];
    [mapData addObject:data3];
    NSDictionary *data4 = [NSDictionary dictionaryWithObjectsAndKeys:@"新宿カフェ",@"title",@"広くて、ゆったりとした時間を過ごせます",@"subtitle",[NSNumber numberWithFloat:35.73],@"lat",[NSNumber numberWithFloat:139.7],@"lon", nil];
    [mapData addObject:data4];

    [self mapCreate];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mapCreate{
    float now_latitude = 35.7100721;
    float now_longitude = 139.809471;
    
    //NSString *title = @"タイトル";
    //NSString *subTitle = @"さぶたいとる";
    
    CLLocationCoordinate2D locationCoordinate = CLLocationCoordinate2DMake(now_latitude, now_longitude);
    //マップ生成
    //mapView = [[MKMapView alloc]init];
    //mapView.frame = CGRectMake(0, 0, 320, 480);
    mapView.delegate = self;
    mapView.showsUserLocation = YES;
    [mapView setCenterCoordinate:locationCoordinate animated:NO];
    // CustomAnnotationクラスの初期化
    //CustomAnnotation *customAnnotation = [[CustomAnnotation alloc] initWithCoordinates:locationCoordinate newTitle:title newSubTitle:subTitle];
    // annotationをマップに追加
    //[mapView addAnnotation:customAnnotation];
    
    for(NSDictionary *dict in mapData){
        [self addPin:dict];
    }
    //縮尺を設定
    MKCoordinateRegion cr = mapView.region;
    cr.center = locationCoordinate;
    cr.span.latitudeDelta = 0.5;
    cr.span.longitudeDelta = 0.5;
    [mapView setRegion:cr];
    // マップを表示
    //[self.view addSubview:mapView];
}

-(void)addPin:(NSDictionary *)dict{
    
    NSString *title = [dict objectForKey:@"title"];
    NSString *subTitle = [dict objectForKey:@"subtitle"];

    CLLocationCoordinate2D locationCoordinate = CLLocationCoordinate2DMake([[dict objectForKey:@"lat"] floatValue], [[dict objectForKey:@"lon"] floatValue]);

    CustomAnnotation *customAnnotation = [[CustomAnnotation alloc] initWithCoordinates:locationCoordinate newTitle:title newSubTitle:subTitle];
    // annotationをマップに追加
    [mapView addAnnotation:customAnnotation];

}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
	MKAnnotationView *annotationView;
    
    // 再利用可能なannotationがあるかどうかを判断するための識別子を定義
    NSString *identifier = @"Pin";
    
    // "Pin"という識別子のついたannotationを使いまわせるかチェック
    annotationView = (MKAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    // 使い回しができるannotationがない場合、annotationの初期化
    if(annotationView == nil) {
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
    }
    
    // 画像をannotationに設定設定
    annotationView.image = [UIImage imageNamed:@"oasisLogo6.png"];
    annotationView.frame = CGRectMake(0, 0, 50, 20);
    annotationView.canShowCallout = YES;  // この設定で吹き出しが出る
    annotationView.annotation = annotation;
    
    //ボタンの種類を指定（ここがないとタッチできない）
    UIButton *detailButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    annotationView.rightCalloutAccessoryView = detailButton;
    
    return annotationView;
}
//アノテーションビューが作られたときのデリゲート。addAnotationするときに呼ばれる
- (void)mapView:(MKMapView*)mapView didAddAnnotationViews:(NSArray*)views{
    // アノテーションビューを取得する
    for (MKAnnotationView* annotationView in views) {
        //UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(10, 10, 50, 30);
        [button setTitle:@"詳細" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(goToDetail:) forControlEvents:UIControlEventTouchUpInside];
        // コールアウトの左側のアクセサリビューにボタンを追加する
        annotationView.rightCalloutAccessoryView = button;
    }
}
-(void)goToDetail:(UIButton *)button{
    //DetailRoomViewController *vc = [[DetailRoomViewController alloc]init];
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailRoomViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    //[self performSegueWithIdentifier:@"goToDetail" sender:nil];

}
//詳細ボタンが押された時
-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    NSLog(@"title: %@", view.annotation.title);
    NSLog(@"subtitle: %@", view.annotation.subtitle);
    NSLog(@"coord: %f, %f", view.annotation.coordinate.latitude, view.annotation.coordinate.longitude);
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
