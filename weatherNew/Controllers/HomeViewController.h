//
//  HomeViewController.h
//  HelloSunny
//
//  Created by garin on 14-4-16.
//  Copyright (c) 2014年 garin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherDataEngine.h"

@interface HomeViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    WeatherDataEngine *weatherDataEngine;
    UITableView *contentView;
}

@end
