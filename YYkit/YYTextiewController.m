//
//  YYTextiewController.m
//  YYkit
//
//  Created by mac on 2018/4/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "YYTextiewController.h"
#import <YYKit.h>

#import <NSAttributedString+YYText.h>
@interface YYTextiewController ()
@property (weak, nonatomic) IBOutlet YYLabel *textLable;

@end

@implementation YYTextiewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatTextView];

}
- (void)creatTextView{
   // 1
    NSMutableAttributedString * text = [[NSMutableAttributedString alloc] initWithString:@"当灰烬查封了凝霜的屋檐，当车菊草化作深秋的露水，我用固执的枯藤做成行囊，走向了那布满荆棘的他乡，当大地铺满了悲泣的落叶，当杜鹃花化作远空的雾霭，祝福我吧我最思念的亲人"];
    [text setFont:[UIFont systemFontOfSize:20] range:text.rangeOfAll];
    text.lineSpacing = 15; // 行间距
    NSRange range = [[text string] rangeOfString:@"当灰烬查封了凝霜的屋檐" options:NSCaseInsensitiveSearch];
    [text setFont:[UIFont systemFontOfSize:25] range:range];
    [text setColor:[UIColor purpleColor] range:range];
    [text setKern:@(2) range:range];  // 字间距
   // 2 文字空心
    NSRange range1 = [[text string] rangeOfString:@"当车菊草化作深秋的露水" options:1];
    [text setStrokeColor:[UIColor orangeColor]range:range1];
    [text setStrokeWidth:@(2)range:range1];
    // 3删除样式
    NSRange range2 = [[text string] rangeOfString:@"我用固执的枯藤做成行囊" options:1];
    YYTextDecoration *decoration = [YYTextDecoration decorationWithStyle:YYTextLineStyleSingle width:@(1) color:[UIColor blueColor]];
    [text setTextStrikethrough:decoration range:range2];
    [text setTextUnderline:decoration range:range2];
    // 边框
    YYTextBorder *board = [YYTextBorder new];
    board.strokeColor = [UIColor redColor];
    board.strokeWidth = 3;
    board.lineStyle = YYTextLineStylePatternCircleDot;
    board.insets = UIEdgeInsetsMake(0, -2, 0, -2);
    [text setTextBorder:board range:range2];
    // 阴影
    NSRange range3 = [[text string] rangeOfString:@"走向了那布满荆棘的他乡" options:NSCaseInsensitiveSearch];
    NSShadow *shadow = [[NSShadow alloc] init];
    [shadow setShadowColor:[UIColor greenColor]];
    [shadow setShadowOffset:CGSizeMake(4, 4)];
    [shadow setShadowBlurRadius:1.0];
    [text setShadow:shadow range:range3];
    // 文本内多重阴影
    
    NSRange range4 = [[text string] rangeOfString:@"当大地铺满了悲泣的落叶" options:1];
    YYTextShadow *shadow1 = [YYTextShadow new];
    shadow1.color = [UIColor purpleColor];
    shadow1.offset = CGSizeMake(0, -2);
    shadow1.radius = 1;
    [text setTextShadow:shadow1 range:range4];
    YYTextShadow *shadow2 = [YYTextShadow new];
    shadow2.color = [UIColor purpleColor];
    shadow2.offset = CGSizeMake(0, 2);
    shadow2.radius = 1;
    [text setTextShadow:shadow2 range:range4];
    // 文本高亮
    NSRange range5 = [[text string] rangeOfString:@"当杜鹃花化作远空的雾霭" options:1];
    [text setTextHighlightRange:range5 color:[UIColor blueColor] backgroundColor:[UIColor colorWithWhite:0 alpha:0.22] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
       
        NSLog(@"%@",text.string);
        
    }];
    
    //文本高亮pro
    UIColor *colorNormal = [UIColor colorWithRed:0.093 green:0.492 blue:1.000 alpha:1.000];
    UIColor *colorHighlight = [UIColor purpleColor];
    
    NSRange range9 = [[text string] rangeOfString:@"祝福我吧我最思念的亲人" options:NSCaseInsensitiveSearch];
    
    
    YYTextDecoration *decorationNomal = [YYTextDecoration decorationWithStyle:YYTextLineStyleSingle
                                                                        width:@(1)
                                                                        color:colorNormal];
    YYTextDecoration *decorationHighlight = [YYTextDecoration decorationWithStyle:YYTextLineStyleSingle
                                                                            width:@(1)
                                                                            color:colorHighlight];
    //未点击时颜色
    [text setColor:colorNormal range:range9];
    //未点击时下划线
    [text setTextUnderline:decorationNomal range:range9];
    
    //点击后的状态
    YYTextHighlight *highlight = [YYTextHighlight new];
    [highlight setColor:colorHighlight];
    [highlight setUnderline:decorationHighlight];
    highlight.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
       
    };
    [text setTextHighlight:highlight range:range9];
    
   
    
    // 高亮状态的背景
    YYTextBorder *highlightBorder = [YYTextBorder new];
    highlightBorder.insets = UIEdgeInsetsMake(-2, 0, -2, 0);
    highlightBorder.cornerRadius = 3;
    highlightBorder.fillColor = [UIColor greenColor];
    
    
    self.textLable.attributedText = text;
    self.textLable.numberOfLines = 0;
    self.textLable.textAlignment = NSTextAlignmentCenter;
    
    
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
