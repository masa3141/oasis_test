//
//  HistoryViewController.m
//  oasis_test
//
//  Created by mk on 2014/07/12.
//  Copyright (c) 2014年 mk. All rights reserved.
//

#import "HistoryViewController.h"
#import "HistoryDetailViewController.h"
@interface HistoryViewController ()

@end

@implementation HistoryViewController

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
    table.delegate = self;
    table.dataSource = self;
    hist = [NSArray arrayWithObjects:@"新宿オフィス",@"渋谷カフェ", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [hist count];

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    // 再利用できるセルがあれば再利用する
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        // 再利用できない場合は新規で作成
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    

    cell.textLabel.text = [hist objectAtIndex:indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selectName = [hist objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"historyDetail" sender:nil];
}
//tableViewの使い方
//http://akira-watson.com/iphone/tableview_3.html

//http://kesin.hatenablog.com/entry/20120908/1347079921
//segue繊維
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //Segueの特定
    if ( [[segue identifier] isEqualToString:@"next"] ) {
        //ここで遷移先ビューのクラスの変数receiveStringに値を渡している
        HistoryDetailViewController *nextViewController = [segue destinationViewController];
        nextViewController.nameString = selectName;
    }
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
