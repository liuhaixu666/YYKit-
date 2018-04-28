//
//  YYImageViewViewController.m
//  YYkit
//
//  Created by mac on 2018/4/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "YYImageViewViewController.h"
#import <YYKit.h>
#import <UIImage+YYAdd.h>
@interface YYImageViewViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UIImageView *locationImageView;
@property (weak, nonatomic) IBOutlet UIImageView *gitImageview;

@end

@implementation YYImageViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YYImageCache *cache = [YYWebImageManager sharedManager].cache;
    // 获取缓存大小
    //    cache.memoryCache.totalCost;
    //    cache.memoryCache.totalCount;
    //    cache.diskCache.totalCost;
    //    cache.diskCache.totalCount;
    
   //  清空缓存
        [cache.memoryCache removeAllObjects];
        [cache.diskCache removeAllObjects];
        // 清空磁盘缓存，带进度回调
        [cache.diskCache removeAllObjectsWithProgressBlock:^(int removedCount, int totalCount) {
            // progress
        } endBlock:^(BOOL error) {
            // end
        }];

    // Do any additional setup after loading the view.
   // 加载图片 网络
//    self.imageview.imageURL = [NSURL URLWithString:@"https://www.baidu.com/img/bd_logo1.png?qua=high"];
//    [self.imageview setImageWithURL:[NSURL URLWithString:@"http://github.com/logo.png"] options:YYWebImageOptionProgressive];
//   [self.imageview setImageWithURL:[NSURL URLWithString:@"http://github.com/logo.png"] options:YYWebImageOptionProgressiveBlur | YYWebImageOptionSetImageWithFadeAnimation];

    // 加载本地
    self.locationImageView.imageURL = [NSURL fileURLWithPath:@"/Users/mac/Desktop/YYkit/babilogo.png"];
    
   // 加载动态
    self.gitImageview.imageURL = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1524835816683&di=59789432f1ae2bcb6a7f3d569a0d5a49&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201602%2F22%2F20160222215324_Stiyv.gif"];
    
    
    // 1. 下载图片
    // 2. 获得图片下载进度
    // 3. 调整图片大小、加圆角
    // 4. 显示图片时增加一个淡入动画，以获得更好的用户体验
//    https://www.baidu.com/img/bd_logo1.png?qua=high

    [self.imageview setImageWithURL:[NSURL URLWithString:@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2822440115,1426369121&fm=27&gp=0.jpg"]
                      placeholder:nil
                          options:YYWebImageOptionSetImageWithFadeAnimation
                         progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                             CGFloat progress = (float)receivedSize / expectedSize;
                             NSLog(@"%f",progress);
                         }
                        transform:^UIImage *(UIImage *image, NSURL *url) {
                            image = [image imageByResizeToSize:CGSizeMake(100, 100) contentMode:UIViewContentModeCenter];
                            return [image imageByRoundCornerRadius:30];
                        }
                       completion:^(UIImage *image, NSURL *url, YYWebImageFromType from, YYWebImageStage stage, NSError *error) {
                           if (from == YYWebImageFromDiskCache) {
                               NSLog(@"load from disk cache");
                           }
                       }];

    
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
