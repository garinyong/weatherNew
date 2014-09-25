//
//  Utility.m
//
//  Created by gaoyong on 14-9-25.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "FrameFitTool.h"

@implementation FrameFitTool

#pragma mark -- 以原始的iphone 5(320*568)的尺寸为基准

//变换宽度
+(CGFloat) getWidthValueFromIp5:(CGFloat) _value
{
    if (SCREEN_HEIGHT == 667)
    {
        return _value * ip5To6WScale;
    }
    else if (SCREEN_HEIGHT == 736)
    {
        return _value * ip5To6PlusWScale;
    }
    
    return _value;
}

//变换高度
+(CGFloat) getHeightValueFromIp5:(CGFloat) _value
{
    if (SCREEN_HEIGHT == 667)
    {
        return _value * ip5To6HScale;
    }
    else if (SCREEN_HEIGHT == 736)
    {
        return _value * ip5To6PlusHScale;
    }
    
    return _value;
}

//变换frame
+(CGRect) getFrameWithIp5Frame:(CGRect)frame
{
    NSLog(@"from:%f-%f-%f-%f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height);
    
    if (SCREEN_HEIGHT == 667)
    {
        frame = CGRectMake(frame.origin.x * ip5To6WScale, frame.origin.y * ip5To6HScale, frame.size.width * ip5To6WScale, frame.size.height * ip5To6HScale);
    }
    else if (SCREEN_HEIGHT == 736)
    {
        frame = CGRectMake(frame.origin.x * ip5To6PlusWScale, frame.origin.y * ip5To6PlusHScale, frame.size.width * ip5To6PlusWScale, frame.size.height * ip5To6PlusHScale);
    }
    
    NSLog(@"to:%f-%f-%f-%f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height);
    
    return frame;
}


#pragma mark 以iphone6 plus(414*736)

//变换宽度
+(CGFloat) getWidthValueFromIp6Plus:(CGFloat) _value
{
    if (SCREEN_HEIGHT == 480)
    {
        return _value * ip6PlusTo4WScale;
    }
    else if (SCREEN_HEIGHT == 568)
    {
        return _value * ip6PlusTo5WScale;
    }
    else if (SCREEN_HEIGHT == 667)
    {
        return _value * ip6PlusTo6WScale;
    }
    
    return _value;
}

//变换高度
+(CGFloat) getHeightValueFromIp6Plus:(CGFloat) _value
{
    if (SCREEN_HEIGHT == 480)
    {
        return _value * ip6PlusTo4HScale;
    }
    else if (SCREEN_HEIGHT == 568)
    {
        return _value * ip6PlusTo5HScale;
    }
    else if (SCREEN_HEIGHT == 667)
    {
        return _value * ip6PlusTo6HScale;
    }
    
    return _value;
}


//变换frame
+(CGRect) getFrameWithIp6PlusFrame:(CGRect)frame
{
    NSLog(@"from:%f-%f-%f-%f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height);
    
    if (SCREEN_HEIGHT == 480)
    {
        frame = CGRectMake(frame.origin.x * ip6PlusTo4WScale, frame.origin.y * ip6PlusTo4HScale, frame.size.width * ip6PlusTo4WScale, frame.size.height * ip6PlusTo4HScale);
    }
    else if (SCREEN_HEIGHT == 568)
    {
        frame = CGRectMake(frame.origin.x * ip6PlusTo5WScale, frame.origin.y * ip6PlusTo5HScale, frame.size.width * ip6PlusTo5WScale, frame.size.height * ip6PlusTo5HScale);
    }
    else if (SCREEN_HEIGHT == 667)
    {
        frame = CGRectMake(frame.origin.x * ip6PlusTo6WScale, frame.origin.y * ip6PlusTo6HScale, frame.size.width * ip6PlusTo6WScale, frame.size.height * ip6PlusTo6HScale);
    }
    
    NSLog(@"to:%f-%f-%f-%f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height);
    
    return frame;
}


@end