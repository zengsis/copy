//
//  ViewController.m
//  copy
//
//  Created by apple on 15/10/5.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *_button = [[UIButton alloc]init];
    _button.frame = CGRectMake(50, 20, 50, 30);
    _button.backgroundColor = [UIColor redColor];
    [_button addTarget:self action:@selector(didButton) forControlEvents:UIControlEventTouchUpInside];
    [_button setTitle:@"copy" forState:UIControlStateNormal];
    
    [self.view addSubview: _button];
    
    
    dispatch_queue_t queue =  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //2.添加任务到队列中，就可以执行任务 //异步函数：具备开启新线程的能力
    dispatch_async(queue, ^{
        NSLog(@"下载图片1----%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"下载图片2----%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"下载图片2----%@",[NSThread currentThread]);
              });
    dispatch_async(queue, ^{
        NSLog(@"下载图片2----%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"下载图片2----%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"下载图片2----%@",[NSThread currentThread]);
    });
        //打印主线程
        NSLog(@"主线程----%@",[NSThread mainThread]);    


    [self CGDTest];
 
}

- (void)didButton
{   //获取复制开始时间
    CFAbsoluteTime beginTime = CFAbsoluteTimeGetCurrent();
    //复制文件
    [[NSFileManager defaultManager]copyItemAtPath:@"Users/apple/Desktop/特种部队2复仇.rmvb" toPath:@"Users/apple/Desktop/复仇.rmvb" error:nil];
// 获取复制结束时间
CFAbsoluteTime endTime = CFAbsoluteTimeGetCurrent();
//打印复制消耗的时间
    NSLog(@"复制消耗时间:%.2f秒",endTime - beginTime);
}

- (void)CGDTest
{
   /* NSInteger idx;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_apply(5, queue, ^(size_t) {
        NSLog(@"index:%zu",idx);
    });
    NSLog(@"任务全部完成了");
    */
    
/*
    //创建一个队列，串行队列
    dispatch_queue_t serialQueue;
    serialQueue =
dispatch_queue_create("info.wuqiong.SerialQueue",DISPATCH_QUEUE_SERIAL);
    
    //同步提交一个任务到该串行队列
    dispatch_sync(serialQueue, ^{
        NSLog(@"这是第一个任务");

        if ([NSThread isMainThread]) {
             NSLog(@"这里是主队列1111");
           } else {
          NSLog(@"No No No!1111");
           }
        
    });
    NSLog(@"ddfgg");
    dispatch_async(serialQueue, ^{
        NSLog(@"这是第二个任务");
        
        if ([NSThread isMainThread]) {
            NSLog(@"这里是主队列2222");
        } else {
            NSLog(@"No No No!2222");
        }

    });*/
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end















