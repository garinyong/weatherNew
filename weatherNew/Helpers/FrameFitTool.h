//
//  FrameFitTool.h
//
//  Created by gaoyong on 14-9-25.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FrameFitTool : NSObject

#pragma mark -- 以原始的iphone 5(320*568)的尺寸为基准

#define ip5To6WScale 1.172
#define ip5To6HScale 1.174

#define ip5To6PlusWScale 1.294
#define ip5To6PlusHScale 1.296

#define convertFrameFromIp5(ip5frame) [FrameFitTool getFrameWithIp5Frame:ip5frame]
#define convertWidthFromIp5(ip5Width) [FrameFitTool getWidthValueFromIp5:ip5Width]
#define convertHeightFromIp5(ip5Height) [FrameFitTool getHeightValueFromIp5:ip5Height]

+(CGRect) getFrameWithIp5Frame:(CGRect)frame;

+(CGFloat) getWidthValueFromIp5:(CGFloat) _value;

+(CGFloat) getHeightValueFromIp5:(CGFloat) _value;


#pragma mark 以iphone6 plus(414*736)

#define ip6PlusTo6WScale 1/1.104
#define ip6PlusTo6HScale 1/1.103

#define ip6PlusTo5WScale 1/1.294
#define ip6PlusTo5HScale 1/1.296

#define ip6PlusTo4WScale 1/1.294
#define ip6PlusTo4HScale 1/1.533

#define convertFrameFromIp6Plus(ip6Plusframe) [FrameFitTool getFrameWithIp6PlusFrame:ip6Plusframe]
#define convertWidthFromIp6Plus(ip6PlusWidth) [FrameFitTool getWidthValueFromIp6Plus:ip6PlusWidth]
#define convertHeightFromIp6Plus(ip6PlusHeight) [FrameFitTool getHeightValueFromIp6Plus:ip6PlusHeight]

+(CGRect) getFrameWithIp6PlusFrame:(CGRect)frame;

+(CGFloat) getWidthValueFromIp6Plus:(CGFloat) _value;

+(CGFloat) getHeightValueFromIp6Plus:(CGFloat) _value;

@end
