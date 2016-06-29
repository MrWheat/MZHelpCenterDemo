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
}

- (void)initViewController {
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)testMethod {
    NSLog(@"%@", [MZHelpCenter currentTime]);
    NSLog(@"%@", [MZHelpCenter currentDateWithType:@"yyyy年MM月dd日"]);
    NSLog(@"%@", [MZHelpCenter currentTimeSinceToday:@"2016年4月30日1时1分1秒1" type:@"yyyy年MM月dd日HH时mm分ss秒s"]);
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
