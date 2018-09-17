//
//  MainVc.m
//  CityToCity
//
//  Created by Fsy on 2018/9/17.
//  Copyright © 2018年 Fsy. All rights reserved.
//

#import "MainVc.h"
#import "SVProgressHUD.h"
#import "Masonry.h"
#import "MBProgressHUD.h"

@interface MainVc () <UIWebViewDelegate>
@property (nonatomic, strong) UIImageView *backImv;
@property (nonatomic, strong) UIWebView *wbV;
@end

@implementation MainVc

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI {
    
//    self.view.backgroundColor = [UIColor redColor];
    MBProgressHUD *mb = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    mb.mode = MBProgressHUDModeAnnularDeterminate;
    mb.label.text = @"Loading";
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.wbV];
    [self.wbV loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://h5.yx8.cn/game/chengshilianjie2/"]]];
    
    self.backImv = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.backImv];
    [self.backImv setImage:[UIImage imageNamed:@"640-1136"]];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    return YES;
}


- (void)webViewDidStartLoad:(UIWebView *)webView {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.backImv removeFromSuperview];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
    [SVProgressHUD showErrorWithStatus:@"Network not connected"];
}


- (UIWebView *)wbV {
    
    if (_wbV == nil) {
        _wbV = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        
        _wbV.delegate = self;
        _wbV.scrollView.scrollEnabled = NO;
        _wbV.backgroundColor = [UIColor blackColor];
    }
    
    return _wbV;
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
