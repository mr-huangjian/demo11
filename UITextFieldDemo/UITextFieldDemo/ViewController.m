//
//  ViewController.m
//  UITextFieldDemo
//
//  Created by 黄健 on 2017/3/19.
//  Copyright © 2017年 黄健. All rights reserved.
//

#import "ViewController.h"
#import "GFTextField.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    GFTextFieldView * handler = [[GFTextFieldView alloc] init];
    handler.frame = CGRectMake(20, 20, 200, 40);
    handler.backgroundColor = [UIColor blueColor];
    
    [handler handleTextFieldStatusBlock:^(GFTextField *textField, GFTextFieldStatusType textFieldStatusType) {
        NSLog(@"type: %lu, text: %@", (unsigned long)textFieldStatusType, textField.text);
    } shouldChangeBlock:^BOOL(GFTextField *textField, NSRange range, NSString *string) {
        NSInteger length = textField.text.length - range.length + string.length;
        return length <= 5;
    }];
    
    [self.view addSubview:handler];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
