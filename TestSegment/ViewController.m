//
//  ViewController.m
//  TestSegment
//
//  Created by 薛焱 on 16/1/6.
//  Copyright © 2016年 张子乾. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIView *lineView;
@property (weak, nonatomic) IBOutlet UIButton *firstButton;
@property (weak, nonatomic) IBOutlet UIButton *secondButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lineView = [[UIView alloc]init];
    [self.view addSubview:self.lineView];
    self.lineView.backgroundColor = [UIColor redColor];
    self.lineView.frame = CGRectMake(CGRectGetMinX(self.firstButton.frame), CGRectGetMaxY(self.firstButton.frame), CGRectGetWidth(self.firstButton.frame), 5);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
}
- (IBAction)firstButtonAction:(id)sender {
    
    [UIView animateWithDuration:0.5 animations:^{
        self.lineView.frame = CGRectMake(CGRectGetMinX(self.firstButton.frame), CGRectGetMaxY(self.firstButton.frame), CGRectGetWidth(self.firstButton.frame), 5);
        
       self.scrollView.contentOffset = CGPointMake(0, 0);
    }];
    
}
- (IBAction)secondButtonAction:(id)sender {

    
    [UIView animateWithDuration:0.5 animations:^{
        self.lineView.frame = CGRectMake(CGRectGetMinX(self.secondButton.frame), CGRectGetMaxY(self.secondButton.frame), CGRectGetWidth(self.secondButton.frame), 5);
        self.scrollView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width, 0);
    }];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.lineView.frame = CGRectMake(CGRectGetMinX(self.firstButton.frame) + scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width * (CGRectGetMinX(self.secondButton.frame) - CGRectGetMinX(self.firstButton.frame)), CGRectGetMaxY(self.firstButton.frame), CGRectGetWidth(self.firstButton.frame), 5);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
