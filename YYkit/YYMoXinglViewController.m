//
//  YYMoXinglViewController.m
//  YYkit
//
//  Created by mac on 2018/4/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "YYMoXinglViewController.h"
#import <YYKit.h>
#import <NSObject+YYModel.h>
#import <YYClassInfo.h>
#import "YYRepo.h"


@interface YYMoXinglViewController ()

@end

@implementation YYMoXinglViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSDictionary *dic = @{
                          @"rid": @(123456789),
                          @"name": @"YYKit",
                          @"createTime" : @"2011-06-09T06:24:26Z",
                          @"owner": @{
                                  @"uid" : @(989898),
                                  @"name" : @"mawenxing"
                                  }
                          };
    
    YYRepo *repo1 =  [YYRepo modelWithDictionary:dic];
    NSLog(@"Repo1: %@\nowner.name=%@", repo1.name,repo1.owner.name);
    NSString *str = [repo1 modelToJSONString];
    NSLog(@"%@", str);
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
