//
//  YYmodelViewController.m
//  YYkit
//
//  Created by mac on 2018/4/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "YYmodelViewController.h"
#import <YYKit.h>
#import <NSAttributedString+YYText.h>
#import <UIImage+YYAdd.h>
@interface YYmodelViewController ()

@end

@implementation YYmodelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //3.图文混排模式
    
   
    
    
    NSMutableAttributedString *textImage = [NSMutableAttributedString new];
    
    UIFont *font= [UIFont systemFontOfSize:14.0f];
    
    int i = 2;
    
    switch(i) {
            
        case 0:
            
        {
            
            //    方式一
            
            NSString*title =@"2006年的诺贝尔文学奖颁给了土耳其作家奥尔罕．帕慕克。在很多人都很意外的时候，我心头却感到一阵开心，因为早在两年前，我就知道了这个作家";
            
            [textImage appendAttributedString:[[NSAttributedString alloc] initWithString:title attributes:nil]];
            
            UIImage *image = [UIImage imageNamed:@"babilogo"];
            
//            image = [UIImage imageWithCGImage:image.CGImage scale:orientation:UIImageOrientationUp];
           
            image = [UIImage imageWithCGImage:image.CGImage];
            
            
            NSMutableAttributedString*attachText= [NSMutableAttributedString attachmentStringWithContent:image contentMode:UIViewContentModeCenter attachmentSize:image.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
            
            [textImage appendAttributedString:attachText];
            
            [textImage appendAttributedString:[[NSAttributedString alloc] initWithString:@"凭借《我的名字叫红》获得了都柏林文学..."attributes:nil]];
            
            break;
            
        }
            
        case 1:
            
        {
            
            NSString *title=@"text 与 UIView混排：";
            
            [textImage appendAttributedString:[[NSAttributedString alloc] initWithString:title attributes:nil]];
            
            UISwitch *switcher = [UISwitch new];
            
            switcher.frame= CGRectMake(0,0,50,50);
            
            [switcher sizeToFit];
            
            NSMutableAttributedString*attachText = [NSMutableAttributedString  attachmentStringWithContent:switcher contentMode:UIViewContentModeCenter attachmentSize:switcher.frame.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
            
            [textImage appendAttributedString:attachText];
            
            [textImage appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"attributes:nil]];
            
            break;
            
        }
            
        case 2:
            
        {
            
            NSString*title =@"2006年的诺贝尔文学奖颁给了土耳其作家奥尔罕．帕慕克。在很多人都很意外的时候，我心头却感到一阵开心，因为早在两年前，我就知道了这个作家";
            
            [textImage appendAttributedString:[[NSAttributedString alloc] initWithString:title attributes:nil]];
            
            UIImageView *imageView = [UIImageView new];
            
            imageView.frame= CGRectMake(0,0,20,20);
            
            [imageView setImage:[UIImage imageNamed:@"babilogo"]];
            
            imageView.contentMode =UIViewContentModeScaleAspectFill;
            
            imageView.userInteractionEnabled=YES;
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer  alloc]initWithActionBlock:^(id _Nonnull sender) {
                
                NSLog(@"ImageAction");
                
            }];
            
            [imageView addGestureRecognizer:tap];
            
            NSMutableAttributedString*attachText = [NSMutableAttributedString attachmentStringWithContent:imageView contentMode:UIViewContentModeCenter attachmentSize:imageView.frame.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
            
            [textImage appendAttributedString:attachText];
            
            NSString*subTitle=@"凭借《我的名字叫红》获得了都柏林文学,2006年的诺贝尔文学奖颁给了土耳其作家奥尔罕．帕慕克。在很多人都很意外的时候，我心头却感到一阵开心，因为早在两年前，我就知道了这个作家";
            
            [textImage appendAttributedString:[[NSAttributedString alloc] initWithString:subTitle attributes:nil]];
            
            NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            
            [paragraphStyle setLineSpacing:16];//调整行间距
            
            [textImage addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [title length]+[subTitle length])];
            
            [textImage setTextHighlightRange:NSMakeRange(0,8)
             
                                       color:[UIColor orangeColor]
             
                             backgroundColor:[UIColor whiteColor]
             
                                   tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                                       
                                       NSLog(@"tap text range:...");
                                       
                                   }];
            
            break;
            
        }
            
        default:
            
            break;
            
    }
    
    textImage.font = font;
    
    YYLabel *textImageLabel = [YYLabel new];
    
    textImageLabel.userInteractionEnabled =YES;
    
    textImageLabel.numberOfLines =0;
    
    textImageLabel.frame = CGRectMake(0,0,375,400);
    
    textImageLabel.attributedText = textImage;
    
    [self.view addSubview:textImageLabel];

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
