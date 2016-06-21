//
//  ViewController.m
//  ZRAlertController
//
//  Created by Victor John on 4/28/16.
//  Copyright © 2016 com.xiaoruigege. All rights reserved.
//
//  https://github.com/VictorZhang2014/ZRAlertController
//  An open source library for iOS in Objective-C that is being compatible with iOS 7.0 and later.
//  Its main function that wrapped UIAlertView and UIAlertController that are easier to call.
//

#import "ViewController.h"
#import "ZRAlertController.h"

@interface ViewController ()
- (IBAction)firstButton:(id)sender;
- (IBAction)SecondButton:(id)sender;
- (IBAction)ThirdButton:(id)sender;
- (IBAction)fourthButton:(id)sender;
- (IBAction)firstActionSheet:(id)sender;
 
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)firstButton:(id)sender
{
    [[ZRAlertController defaultAlert] alertShow:self title:@"Note" message:@"This is an empty message!" okayButton:@"Ok" completion:^{
        NSLog(@"There is a callback.");
    }];
}

- (IBAction)SecondButton:(id)sender
{
    [[ZRAlertController defaultAlert] alertShow:self title:@"Note" message:@"This is an empty message!" cancelButton:@"Cancel" okayButton:@"Ok" okayHandler:^{
        NSLog(@"You clicked the okay button.");
    } cancelHandler:^{
        NSLog(@"You clicked the cancel button.");
    }];
}

- (IBAction)ThirdButton:(id)sender
{
    [[ZRAlertController defaultAlert] alertShow:self title:@"Note" message:@"This is an explanation message!" cancelButton:@"Cancel" okayButton:@"Okay" alertStyle:ZRAlertStyleSecureTextInput placeHolder:@"Type any character" okayHandler:^(UITextField *textFiled) {
        NSLog(@"Your input of textFiled is %@.", textFiled.text);
    } cancelHandler:^(UITextField *textFiled) {
        NSLog(@"Your input of textFiled is %@.", textFiled.text);
    }];
}

- (IBAction)fourthButton:(id)sender {
    [[ZRAlertController defaultAlert] alertShow:self title:@"Note" message:@"This is an explanation message!" cancelButton:@"Cancel" okayButton:@"Ok" alertStyle:ZRAlertStyleLoginAndPasswordInput placeHolder1:@"Type an account" placeHolder2:@"Type a passcode" sureHandler:^(UITextField *textFiled1, UITextField *textFiled2) {
        NSLog(@"Your input of Sure textFiled1.text = %@, textFiled2.text = %@. ", textFiled1.text, textFiled2.text);
    } abolishHandler:^(UITextField *textFiled1, UITextField *textFiled2) {
         NSLog(@"Your input of Abolish textFiled1.text = %@, textFiled2.text = %@. ", textFiled1.text, textFiled2.text);
    }];
}

- (IBAction)firstActionSheet:(id)sender {
    
    [[ZRAlertController defaultAlert] actionView:self title:nil cancel:@"cancel" others:@[@"aaa",@"bbb",@"ccc"] handler:^(int index, NSString * _Nonnull item) {
        NSLog(@"index = %d, item = %@. ", index, item);
    }];
}
@end
