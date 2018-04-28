//
//  YYKeyboardViewController.m
//  YYkit
//
//  Created by mac on 2018/4/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "YYKeyboardViewController.h"
#import <YYKit.h>

@interface YYKeyboardViewController ()<YYTextKeyboardObserver,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *keyboardTextfield;
@end

@implementation YYKeyboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.keyboardTextfield.frame = CGRectMake(0, 630, 375, 30);
    self.keyboardTextfield.delegate = self;
    YYTextKeyboardManager *manager = [YYTextKeyboardManager defaultManager];
    // 获取键盘的 view 和 window
    UIView *view = manager.keyboardView;
    UIWindow *window = manager.keyboardWindow;
    
    // 获取键盘当前状态
    BOOL visible = manager.keyboardVisible;
    CGRect frame = manager.keyboardFrame;
    frame = [manager convertRect:frame toView:self.view];
    
    // 监听键盘动画
    [manager addObserver:self];

}
- (void)dealloc{
    NSLog(@"Class:%@ -- dealloc",NSStringFromClass(self.class));
    [[YYTextKeyboardManager defaultManager]removeObserver:self];
}

- (void)keyboardChangedWithTransition:(YYTextKeyboardTransition)transition {
    NSTimeInterval animationDuration = transition.animationDuration;
    [UIView animateWithDuration:animationDuration animations:^{
        CGRect fromFrame = [[YYTextKeyboardManager defaultManager] convertRect:transition.fromFrame toView:self.view];
        CGRect toFrame =  [[YYTextKeyboardManager defaultManager] convertRect:transition.toFrame toView:self.view];
        BOOL fromVisible = transition.fromVisible;
        BOOL toVisible = transition.toVisible;
        
        UIViewAnimationCurve curve = transition.animationCurve;
        if (toFrame.origin.y < self.keyboardTextfield.frame.origin.y) {
            
            self.keyboardTextfield.frame = CGRectMake(0, toFrame.origin.y  -self.keyboardTextfield.frame.size.height, 375, 30);
        }
    } completion:^(BOOL finished) {
        
    }];
   
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self.keyboardTextfield resignFirstResponder];
    return  YES;
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
