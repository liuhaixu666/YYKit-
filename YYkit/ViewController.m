//
//  ViewController.m
//  YYkit
//
//  Created by mac on 2018/4/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import "YYModelTableViewCell.h"
#import <YYKit.h>
#import <UIView+YYAdd.h>
@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _array = @[@"yyLable YYKit第三方框架确实很牛，YYLabel在富文本显示和操作方面相当强大，尤其是其异步渲染，让界面要多流畅有多流畅，这里我们介绍下简单的使用",@"yyModel YYKit第三方框架确实很牛，YYLabel在富文本显示和操作方面相当强大，尤其是其异步渲染，让界面要多流畅有多流畅，这里我们介绍下简单的使用",@"yyImageview YYKit第三方框架确实很牛，YYLabel在富文本显示和操作方面相当强大，尤其是其异步渲染，让界面要多流畅有多流畅，这里我们介绍下简单的使用",@"YYText YYKit第三方框架确实很牛，YYLabel在富文本显示和操作方面相当强大，尤其是其异步渲染，让界面要多流畅有多流畅，这里我们介绍下简单的使用",@" YYKeyboard YYKit第三方框架确实很牛，YYLabel在富文本显示和操作方面相当强大，尤其是其异步渲染，让界面要多流畅有多流畅，这里我们介绍下简单的使用"].mutableCopy;
//    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"11"];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    YYModelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"11" forIndexPath:indexPath];
//    NSString *title = @"不得不说 YYKit第三方框架确实很牛，YYLabel在富文本显示和操作方面相当强大，尤其是其异步渲染，让界面要多流畅有多流畅，这里我们介绍下简单的使用";
    NSString *title = _array[indexPath.row];
    
    cell.yyLableV.displaysAsynchronously = YES;
    cell.yyLableV.numberOfLines = 0;
    YYTextContainer *titlecontarer = [YYTextContainer new];
    titlecontarer.size = CGSizeMake(300,CGFLOAT_MAX);
    
    NSMutableAttributedString *titleAttr = [self getAttr:title];
    YYTextLayout *titleLayout = [YYTextLayout layoutWithContainer:titlecontarer text:titleAttr];
    [titleAttr setTextHighlightRange:NSMakeRange(0,4)
     
                         color:[UIColor orangeColor]
     
               backgroundColor:[UIColor whiteColor]
     
                     tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                         
                         NSLog(@"tap text range:...");
                         
                     }];
    
   
    CGFloat titleLabelHeight = titleLayout.textBoundingSize.height;
    cell.yyLableV.frame = CGRectMake(50,50,300,titleLabelHeight);
    cell.yyLableV.attributedText = titleAttr;
    cell.yyLableV.userInteractionEnabled=YES;
    return cell;
    
    
}
- (NSMutableAttributedString*)getAttr:(NSString*)attributedString {
    NSMutableAttributedString * resultAttr = [[NSMutableAttributedString alloc] initWithString:attributedString];

    //对齐方式 这里是 两边对齐
    resultAttr.alignment = NSTextAlignmentJustified;
    //设置行间距
    resultAttr.lineSpacing = 5;
    //设置字体大小
    resultAttr.font = [UIFont systemFontOfSize:12];
    //可以设置某段字体的大小
    //[resultAttr yy_setFont:[UIFont boldSystemFontOfSize:CONTENT_FONT_SIZE] range:NSMakeRange(0, 3)];
    //设置字间距
    //resultAttr.yy_kern = [NSNumber numberWithFloat:1.0];
    return resultAttr;
    
}

#pragma mark - UITableViewDelegate
// 组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
// 行高row_height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
// 头高header_height
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
// 尾高footer_height
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
// 头部view
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}
// 尾部view
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
// 点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        
        [self performSegueWithIdentifier:@"YYmodelViewController" sender:nil];
    }else if (indexPath.row == 1) {
      
        [self performSegueWithIdentifier:@"YYMoXinglViewController" sender:nil];
    }else if (indexPath.row == 2){
        
        [self performSegueWithIdentifier:@"YYImageViewViewController" sender:nil];
    }else if (indexPath.row == 3){
        
        
        [self performSegueWithIdentifier:@"YYTextiewController" sender:nil];
    }else if (indexPath.row == 4){
        
        [self performSegueWithIdentifier:@"YYKeyboardViewController" sender:nil];
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
