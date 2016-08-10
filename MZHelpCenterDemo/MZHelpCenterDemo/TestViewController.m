//
//  RootViewController.m
//  MZHelpCenterDemo
//
//  Created by 麦子 on 16/4/28.
//  Copyright © 2016年 麦子. All rights reserved.
//

#import "TestViewController.h"
#import "MZHelpCenter.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViewController];
    [self testMethod];
    [self createUI];
}

- (void)createUI {
    UILabel *todayUnix = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 30)];
    todayUnix.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:todayUnix];
    
    UILabel *todayDate = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 30)];
    todayDate.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:todayDate];
    
    UILabel *dateSinceToday = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 30)];
    dateSinceToday.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:dateSinceToday];
    
    todayUnix.text = [MZHelpCenter currentTime];
    todayDate.text = [MZHelpCenter currentDateWithType:@"yyyy年MM月dd日"];
    dateSinceToday.text = [MZHelpCenter circleCreateTime:@"1470797345"];
}

- (void)initViewController {
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)testMethod {
    // 需要真机环境
    [MZHelpCenter systemShake];
    [MZHelpCenter createSystemSoundWithName:@"ReceivedMessage" soundType:@"caf"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
