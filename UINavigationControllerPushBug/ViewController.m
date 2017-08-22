//
//  ViewController.m
//  UINavigationControllerPushBug
//
//  Created by suxinde on 2017/8/22.
//  Copyright © 2017年 com.su. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)click:(id)sender {
    [self.navigationController pushViewController:[ViewController2 new] animated:YES];
    [self.navigationController pushViewController:[ViewController2 new] animated:YES];
    [self.navigationController pushViewController:[ViewController2 new] animated:YES];
    [self.navigationController pushViewController:[ViewController2 new] animated:YES];
}

@end
