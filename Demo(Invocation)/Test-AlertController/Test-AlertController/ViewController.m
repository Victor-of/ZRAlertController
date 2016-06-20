//
//  ViewController.m
//  Test-AlertController
//
//  Created by Victor John on 6/20/16.
//  Copyright © 2016 XiaoRuiGeGe. All rights reserved.
//

#import "ViewController.h"
#import <ZRAlertController/ZRAlertController.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[ZRAlertController defaultAlert] alertShow:self title:@"" message:@"" okayButton:@""];
}

@end
