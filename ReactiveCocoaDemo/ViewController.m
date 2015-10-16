//
//  ViewController.m
//  ReactiveCocoaDemo
//
//  Created by zxl on 15/9/14.
//  Copyright (c) 2015年 ThinkMobile. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "UserModel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (strong, nonatomic) UserModel *userModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.userModel = [[UserModel alloc] init];
//    
//    //step1.从view改变model的值
//    RAC(self.userModel, userName) = self.nameTextField.rac_textSignal;
//    
//    //step2.监听model的变化改变view
//    @weakify(self)
//    [RACObserve(self.userModel, userName) subscribeNext:^(NSString *x) {
//        @strongify(self)
//        self.nameLabel.text = x;
//    }];
    
        RAC(self.nameLabel, text) = self.nameTextField.rac_textSignal;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
