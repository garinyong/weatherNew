//
//  DetailViewController.m
//  HelloSunny
//  详情页
//  Created by gaoyong on 14-9-18.
//  Copyright (c) 2014年 garin. All rights reserved.
//

#import "DetailViewController.h"
#import "UIImageView+WebCache.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

-(void) dealloc
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
}

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
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH ,200)];
    NSURL *imageUrl = [NSURL URLWithString:@"http://www.elongstatic.com/gp1/M00/B2/E8/o4YBAFJJcayAZSarAAGbnhgECnA138.jpg?v=20130930204324"];
    [imgView sd_setImageWithURL:imageUrl];
    
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.center = imgView.center;
    activityIndicator.hidesWhenStopped = YES;
    [activityIndicator startAnimating];
    [imgView addSubview:activityIndicator];
    
    
    __weak id weakActivityIndicator = activityIndicator;
    
    [imgView sd_setImageWithURL:[NSURL URLWithString:@"http://www.elongstatic.com/gp1/M00/B2/E8/o4YBAFJJcayAZSarAAGbnhgECnA138.jpg?v=20130930204324"] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [weakActivityIndicator removeFromSuperview];
    }];
    
    [self.view addSubview:imgView];
    
    UIView *curView = self.view;
    
    return;
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(30,360,120, 44);
    btn1.titleLabel.textAlignment = NSTextAlignmentLeft;
    btn1.layer.borderWidth = 0.5;
    btn1.layer.borderColor =[UIColor blueColor].CGColor;
    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [btn1 setTitle:@"get action" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(getClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    myView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 100)];
    myView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:myView];
    
    weatherDataEngine = [[WeatherDataEngine alloc] initWithHostName:@"www.weather.com.cn"];
    [weatherDataEngine useCache];
}

-(void) getClick
{
    [self testNet];
}

-(void) testNet
{

    if (operation) {
        [operation cancel];
    }
    
    operation = [weatherDataEngine getWeatherInfo:^(NSDictionary *dict)
     {
         NSLog(@"%@",model);
     } errorHandler:^(NSError *error) {
         NSLog(@"error~~~");
     }];
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
