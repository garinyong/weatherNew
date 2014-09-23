//
//  WeatherDataEngine.m
//  HelloSunny
//
//  Created by garin on 14-4-30.
//  Copyright (c) 2014年 garin. All rights reserved.
//

#import "WeatherDataEngine.h"

@implementation WeatherDataEngine

-(void) dealloc
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
}

-(MKNetworkOperation *) getWeatherInfo:(CurResponseBlock) completionBlock
                          errorHandler:(MKNKErrorBlock) errorBlock
{
    MKNetworkOperation *op = [self operationWithPath:@"data/cityinfo/101010100.html" params:nil httpMethod:@"GET"];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation)
    {
        id result = [completedOperation responseJSON];
        
        DLog(@"%@", result);
        
        completionBlock(result);
        
    }
    errorHandler:^(MKNetworkOperation *completedOperation, NSError *error)
    {
        errorBlock(error);
    }];
    
    [self enqueueOperation:op];
    
    return op;
}

@end
