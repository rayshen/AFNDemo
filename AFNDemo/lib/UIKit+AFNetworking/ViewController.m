//
//  ViewController.m
//  AFNetworkingDemo
//
//  Created by shen on 15/5/25.
//  Copyright (c) 2015年 shen. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@property NSMutableArray *dataArray;
@property NSString *personname;

@property id dldata;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //功能已经被我注释掉
    [self setimage];
    //[self jasontest];
    //[self uploadimg];
    [self uploadmutableimg];
}

//根据url加载图片
-(void)setimage{
    NSString *url = @"http://d.hiphotos.baidu.com/image/pic/item/37d3d539b6003af341ae37ca362ac65c1038b600.jpg";
    NSURL *newurl=[NSURL URLWithString:url];
    [self.imageview setImageWithURL:newurl];
}


//jason解析,根据上传id从数据库取出用户信息
-(void)jasontest{
    //访问的URL
    NSString *url = @"http://localhost:8888/chepaishibie/selectuser.php";
    //需要传进去的参数
    NSDictionary *parameter = @{@"Driverid": @"10000"};
    //GET或者POST请求
    [[ShenAFN sharedInstance] JSONDataWithUrl:url parameter:parameter success:^(id jsondata) {
        //返回的字符,并输出
        NSLog(@"success:\n%@", jsondata);
        //如果是其他字符，可以用以下语句解析返回的语句
        //NSString *result = [[NSString alloc] initWithData:jsondata encoding:NSUTF8StringEncoding];
        //如果是json格式，可以通过这种方式获取变量
        id info1=jsondata[@"info1"];
        _personname=info1[@"personname"];
    } fail:^{
        NSLog(@"请求失败");
    }];
}

//单图片上传
-(void)uploadimg{
    NSString *url = @"http://localhost:8888/chepaishibie/uploadimage.php";
    UIImage *image=[UIImage imageNamed:@"swift"];
    [[ShenAFN sharedInstance] uploadimgWithurl:url image:image fileName:@"myswift.png" success:^(id jsondata) {
        NSString *result = [[NSString alloc] initWithData:jsondata encoding:NSUTF8StringEncoding];
        NSLog(@"%@", result);
    } fail:^{
        NSLog(@"请求失败");
    }];
}

//多图片上传
-(void)uploadmutableimg{
    NSString *url = @"http://localhost:8888/chepaishibie/uploadimage.php";
    UIImage *image1=[UIImage imageNamed:@"0"];
    UIImage *image2=[UIImage imageNamed:@"1"];
    NSMutableArray *imgarray=[[NSMutableArray alloc]init];
    [imgarray addObject:image1];
    [imgarray addObject:image2];
    
    [[ShenAFN sharedInstance] uploadMutableimgWithurl:url imagearray:imgarray success:^(id jsondata) {
        NSString *result = [[NSString alloc] initWithData:jsondata encoding:NSUTF8StringEncoding];
        NSLog(@"%@", result);
    } fail:^{
        NSLog(@"请求失败");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
