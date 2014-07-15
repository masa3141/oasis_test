//
//  HistoryViewController.h
//  oasis_test
//
//  Created by mk on 2014/07/12.
//  Copyright (c) 2014年 mk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    IBOutlet UITableView *table;
    NSArray *hist;
    NSString *selectName;
}

@end
