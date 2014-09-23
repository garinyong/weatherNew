//
//  DetailViewController.h
//  HelloSunny
//
//  Created by gaoyong on 14-9-18.
//  Copyright (c) 2014年 garin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherDataEngine.h"
#import "WeatherInfoModel.h"

@interface DetailViewController : BaseViewController
{
    WeatherDataEngine *weatherDataEngine;
    UIView *myView;
    MKNetworkOperation *operation;
    
    WeatherInfoModel *model;
}
@end
