# ZRAlertController
A delightful alert view framework that being compatible with iOS 7.0 and later.

How to install and get Started with CocoaPods
-----------------------------------

`platform :ios, '7.0' <br/>
pod 'ZRAlertController', '~> 1.0'`


## Usage of first style

`[[ZRAlertController defaultAlert] alertShow:self title:@"Note" message:@"This is an empty message!" okayButton:@"Ok"];`

### Effect Photo
![ZRAlertController Effect Photo 1](https://github.com/VictorZhang2014/ZRAlertController/blob/master/one.png "ZRAlertController")

## Usage of second style

`[[ZRAlertController defaultAlert] alertShow:self title:@"Note" message:@"This is an empty message!" cancelButton:@"Cancel" okayButton:@"Ok" okayHandler:^{
NSLog(@"You clicked the okay button.");
} cancelHandler:^{
NSLog(@"You clicked the cancel button.");
}];`

### Effect Photo
![ZRAlertController Effect Photo 2](https://github.com/VictorZhang2014/ZRAlertController/blob/master/two.png "ZRAlertController")

## Usage of third style

`[[ZRAlertController defaultAlert] alertShow:self title:@"Note" message:@"This is an explanation message!" cancelButton:@"Cancel" okayButton:@"Okay" alertStyle:ZRAlertStyleSecureTextInput placeHolder:@"Type any character" okayHandler:^(UITextField *textFiled) {
NSLog(@"Your input of textFiled is %@.", textFiled.text);
} cancelHandler:^(UITextField *textFiled) {
NSLog(@"Your input of textFiled is %@.", textFiled.text);
}];`

### Effect Photo
![ZRAlertController Effect Photo 3](https://github.com/VictorZhang2014/ZRAlertController/blob/master/three.png "ZRAlertController")

## Usage of fourth style

`[[ZRAlertController defaultAlert] alertShow:self title:@"Note" message:@"This is an explanation message!" cancelButton:@"Cancel" okayButton:@"Ok" alertStyle:ZRAlertStyleLoginAndPasswordInput placeHolder1:@"Type an account" placeHolder2:@"Type a passcode" sureHandler:^(UITextField *textFiled1, UITextField *textFiled2) {
NSLog(@"Your input of Sure textFiled1.text = %@, textFiled2.text = %@. ", textFiled1.text, textFiled2.text);
} abolishHandler:^(UITextField *textFiled1, UITextField *textFiled2) {
NSLog(@"Your input of Abolish textFiled1.text = %@, textFiled2.text = %@. ", textFiled1.text, textFiled2.text);
}];`

### Effect Photo
![ZRAlertController Effect Photo 4](https://github.com/VictorZhang2014/ZRAlertController/blob/master/four.png "ZRAlertController")