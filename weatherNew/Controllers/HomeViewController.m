//
//  HomeViewController.m
//  HelloSunny
//
//  Created by garin on 14-4-16.
//  Copyright (c) 2014年 garin. All rights reserved.
//

#import "HomeViewController.h"
#import "WeatherInfoModel.h"
#import "WeatherTableViewCell.h"
#import "DetailViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

-(void) dealloc
{
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden= NO;
    
//    contentView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 20) style:UITableViewStylePlain];
    
    contentView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, MAINCONTENTHEIGHT) style:UITableViewStylePlain];
    
    contentView.delegate = self;
    contentView.dataSource = self;
    contentView.backgroundColor=[UIColor greenColor];
    contentView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:contentView];
}

-(void) testNet
{
    weatherDataEngine = [[WeatherDataEngine alloc] initWithHostName:@"www.weather.com.cn"];
    [weatherDataEngine useCache];
    [weatherDataEngine getWeatherInfo:^(NSDictionary *dict)
     {
         WeatherInfoModel *model = [[WeatherInfoModel alloc] initModel:[dict safeObjectForKey:@"weatherinfo"]];
         
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

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0)
    {
        return 10;
    }
    
    return 0;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *showInfoCellIdentifier = @"weatherTableViewCell";
    WeatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:showInfoCellIdentifier];
    if (!cell)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"WeatherTableViewCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor redColor];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *dvc = [DetailViewController new];
    [self.navigationController pushViewController:dvc animated:YES];
}


@end
