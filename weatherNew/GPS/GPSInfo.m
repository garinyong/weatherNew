//
//  GPSInfo.m
//  QuickHotel
//
//  Created by garin on 14-5-11.
//  Copyright (c) 2014年 garin. All rights reserved.
//

#import "GPSInfo.h"

@implementation GPSInfo
@synthesize cityName,areaName;
@synthesize coordinate;
@synthesize isCompleteGPS;

- (void)dealloc
{
    [cityName release];
    [areaName release];
    [super dealloc];
}


@end
