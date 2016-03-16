//
//  AppDelegate.m
//  01 task1
//
//  Created by wei.chen on 13-8-14.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

/*________________________________UILabel________________________________________*/

- (void)_initLabel {
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 100, 50)];
    textLabel.backgroundColor = [UIColor grayColor];
    textLabel.text = @"无限互联3G学院";
    //创建字体对象，systemFontOfSize：使用系统字体，大小：12
    UIFont *font = [UIFont systemFontOfSize:16];
    
//    UIFont *font = [UIFont fontWithName:@"Arial Hebrew" size:12];
    //[UIFont familyNames] 获取所有的字体名称
    NSLog(@"%@",[UIFont familyNames]);
    
    textLabel.font = font;
    
    //设置字体的颜色
    textLabel.textColor = [UIColor greenColor];
    
    //文本显示位置: 居左、居中、居右
    textLabel.textAlignment = NSTextAlignmentCenter;
    
    //如果是0，则自动折行
//    textLabel.numberOfLines = 0;
    
    //自动根据文本内容调整宽度与高度
    [textLabel sizeToFit];
    
    [self.window addSubview:textLabel];
    
    [textLabel release];
    
}

#pragma mark - UIButton
/*________________________________UIButton________________________________________*/

- (void)_initButton {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(10, 80, 100, 30);
    
    //设置一般状态显示的标题
    [button setTitle:@"保存" forState:UIControlStateNormal];
    //高亮状态显示的文本
    [button setTitle:@"正在点击.." forState:UIControlStateHighlighted];
    
    //注意：title标题需要和一个状态绑定
    //错误，没有为此标题设置状态，无法显示
//    button.titleLabel.text = @"保存";
    
    //设置标题颜色，不同的状态对应不同的颜色
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    //字体颜色也需要绑定状态，
//     button.titleLabel.textColor = [UIColor redColor];  //错误，没有绑定状态
    
    //设置标题文本的字体
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    
    //为按钮添加点击事件
    //UIControlEventTouchUpInside: 按下、松开点击，必须在按钮范围之内
    [button addTarget:self action:@selector(buttonAction:)
     forControlEvents:UIControlEventTouchUpInside];
   // [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpOutside];
    [self.window addSubview:button];
    
}

//定义图片按钮
- (void)_initCustomButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(200, 80, 90, 44);
    
    //设置一般状态显示的标题
    [button setTitle:@"保存" forState:UIControlStateNormal];
    //高亮状态显示的文本
    [button setTitle:@"正在点击.." forState:UIControlStateHighlighted];
    
    //UIImage 用于存储图片数据
//    UIImage *image1 = [UIImage imageNamed:@"back_on_black"]; //back_on_black.png  png可以省略
//    UIImage *image2 = [UIImage imageNamed:@"back_on.png"];
//    [button setImage:image1 forState:UIControlStateNormal];
//    [button setImage:image2 forState:UIControlStateHighlighted];
    //title与image 二者只能取一个
    
    UIImage *image1 = [UIImage imageNamed:@"back_on_black"]; //back_on_black.png  png可以省略
    UIImage *image2 = [UIImage imageNamed:@"back_on.png"];
    [button setBackgroundImage:image1 forState:UIControlStateNormal];
    [button setBackgroundImage:image2 forState:UIControlStateHighlighted];
    
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    
    
//    [button setTitle:@"选中了" forState:UIControlStateSelected];
//    //设置是否选中状态
//    button.selected = YES;
    
    //设置按钮是否为警用状态
//    button.enabled = NO;
    button.alpha = 0.5;
    
    //是否响应触摸事件
    button.userInteractionEnabled = NO;
    
    [self.window addSubview:button];
}

- (void)buttonAction:(UIButton *)button {
    NSLog(@"按钮被点击了");
}

#pragma mark - UITextField
/*________________________________UITextField________________________________________*/

- (void)_initTextField {
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 130, 200, 30)];
    //设置输入框的边框显示样式
    textField.borderStyle = UITextBorderStyleLine;
    [self.window addSubview:textField];
    
    //设置输入框中文字的字体
    textField.font = [UIFont systemFontOfSize:20];
    //设置文字的颜色
    textField.textColor = [UIColor redColor];
    
    //设置输入框中的文本
//    textField.text = @"test";
    
    //设置首字母是否自动大写
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    //输入框为空时，显示的提示文字
    textField.placeholder = @"请输入邮箱地址";
    
    //清除按钮模式
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    //设置文本的显示位置：居中、居左、居右
    textField.textAlignment = NSTextAlignmentCenter;
    
    //设置键盘上return键的显示样式
    textField.returnKeyType = UIReturnKeySearch;
    
    //是否安全输入
    textField.secureTextEntry = YES;
    
    //设置键盘类型,UIKeyboardTypeNumberPad 数字键盘
//    textField.keyboardType = UIKeyboardTypePhonePad;
    
    [textField release];
    
    
    textField.delegate = self;
    
    //弹出键盘
   [textField becomeFirstResponder];
    
}

#pragma mark - UITextField delegate
//将要编辑：键盘弹出之前调用的
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    NSLog(@"将要开始编辑");
    
    return YES;
    
}

//已经开始编辑,键盘弹出之后调用
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"已经开始编辑");
}

//return按钮被点击时调用
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"textFieldShouldReturn");
    
    //收起键盘
    [textField resignFirstResponder];
    
    return YES;
}

//将要结束编辑, 收起键盘时调用
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    NSLog(@"textFieldShouldEndEditing 结束编辑");
    return YES;
}

#pragma mark - UIImageView
/*________________________________UIImageView________________________________________*/

- (void)_initImageView {
    
    UIImage *image = [UIImage imageNamed:@"scene1.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    //设置高亮状态显示的图片
    imageView.highlightedImage = [UIImage imageNamed:@"scene2.jpg"];
    
    imageView.frame = CGRectMake(10, 200, 100, 100);
    
//    imageView.highlighted = YES;
    
    //设置内容模式，可以防止图片比例被拉伸
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    UIImage *image1 = [UIImage imageNamed:@"scene1.jpg"];
    UIImage *image2 = [UIImage imageNamed:@"scene2.jpg"];
    UIImage *image3 = [UIImage imageNamed:@"scene3.jpg"];
    UIImage *image4 = [UIImage imageNamed:@"scene4.jpg"];
    UIImage *image5 = [UIImage imageNamed:@"scene5.jpg"];
    NSArray *images = [NSArray arrayWithObjects:image1,image2,image3,image4,image5, nil];
    
    //动画播放图片的集合
    imageView.animationImages = images;
    //动画持续时间
    imageView.animationDuration = 1;
    
    //开始播放动画
    [imageView startAnimating];
    
    //停止动画
    [imageView stopAnimating];
    
    
    //图片视图的userInteractionEnabled 触摸事件默认是关闭的
    //imageView.userInteractionEnabled = NO;
    
    
    [self.window addSubview:imageView];
}

#pragma mark - UISlider
/*____________________________UISlider____________________________________*/
- (void)_initSlider {
    
    //UISlider 的高度是固定的
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(10, 320, 200, 50)];
    //添加滑动的事件,UIControlEventValueChanged:值被修改的事件
    [slider addTarget:self action:@selector(sliderAction:)
     forControlEvents:UIControlEventValueChanged];
    
    //设置滑动最大数值
    slider.maximumValue = 100;
    //设置滑动最小数值
    slider.minimumValue = 50;
    
    UIImage *image = [UIImage imageNamed:@"com_slider_min_l-Decoded.png"];
    
    //设置图片拉伸点的位置
    UIImage *image2 = [image stretchableImageWithLeftCapWidth:3 topCapHeight:0];
    
    //设置滑动条左边的颜色
    //[slider setMinimumTrackImage:image2 forState:UIControlStateNormal];
    //设置滑动条左边的颜色
    [slider setMinimumTrackTintColor:[UIColor redColor]];
    [slider setMaximumTrackTintColor:[UIColor blueColor]];
    
    //修改滑动按钮图片
    [slider setThumbImage:[UIImage imageNamed:@"com_thumb_max_n-Decoded.png"]
                 forState:UIControlStateNormal];
    [slider setThumbImage:[UIImage imageNamed:@"com_thumb_max_h-Decoded.png"]
                 forState:UIControlStateHighlighted];
    
    [self.window addSubview:slider];
    
    [slider release];
    
}

- (void)sliderAction:(UISlider *)slider {
    
    NSLog(@"%f",slider.value);
    
}

#pragma mark - UISwitch
/*____________________________UISlider____________________________________*/

- (void)_initSwitch {
    //UISwitch的宽、高是固定的
    UISwitch *switchUI = [[UISwitch alloc] initWithFrame:CGRectMake(10, 360, 0, 0)];
    
    switchUI.on = YES;
    
    [switchUI addTarget:self action:@selector(switchAction:)
       forControlEvents:UIControlEventValueChanged];
 
    //设置开、关，并且添加动画效果
    [switchUI setOn:NO animated:YES];
    
    [self.window addSubview:switchUI];
    [switchUI release];
    
}

- (void)switchAction:(UISwitch *)switchUI {
    
    if (switchUI.on) {
        NSLog(@"开");
    } else {
        NSLog(@"关");    
    }
    
}

#pragma mark - UISegmentedControl
/*____________________________UISegmentedControl____________________________________*/
- (void)_initSegmented {
    
    NSArray *titles = @[@"电影",@"电视剧",@"综艺"];
    UISegmentedControl *sc = [[UISegmentedControl alloc] initWithItems:titles];
    
    sc.segmentedControlStyle = UISegmentedControlStyleBar;
    
    sc.frame = CGRectMake(10, 400, 200, 30);
    
    //不能这样修改选项按钮的背景颜色
//    sc.backgroundColor = [UIColor redColor];
    //设置选项按钮的颜色
    sc.tintColor = [UIColor redColor];
    
    //设置选择项的索引
    sc.selectedSegmentIndex = 2;
    
    //添加事件
    [sc addTarget:self action:@selector(segmentAction:)
        forControlEvents:UIControlEventValueChanged];
    
    
    [self.window addSubview:sc];
}

- (void)segmentAction:(UISegmentedControl *)segment {
    if (segment.selectedSegmentIndex == 0) {
        NSLog(@"切换电影");
    } else if(segment.selectedSegmentIndex == 1) {
        NSLog(@"切换电视剧");
    } else if(segment.selectedSegmentIndex == 2) {
        NSLog(@"切换综艺");
    }
}


#pragma mark - UIActivityIndicatorView
/*_____________________________UIActivityIndicatorView_____________________________*/
- (void)_initActivityIndicator {
    //风火轮圆半径是固定的
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activity.backgroundColor = [UIColor blueColor];
    activity.frame = CGRectMake(150, 330, 0, 0);
    
    //开始转动
    [activity startAnimating];
    
    //停止转动，并且隐藏
//    [activity stopAnimating];
    
    [self.window addSubview:activity];
}

#pragma mark - UIPageControl
/*_____________________________UIPageControl_____________________________*/
- (void)_initPageControll {
    UIPageControl *pageCtrl = [[UIPageControl alloc] initWithFrame:CGRectMake(10, 440, 100, 20)];
    pageCtrl.backgroundColor = [UIColor grayColor];
    
    //总页数
    pageCtrl.numberOfPages = 3;
    
    //当前选中的页数
    pageCtrl.currentPage = 0;
    
    [self.window addSubview:pageCtrl];
    [pageCtrl addTarget:self action:@selector(pageAction:) forControlEvents:UIControlEventValueChanged ];
    
    [pageCtrl release];
    
}


- (void)pageAction:( UIPageControl *)pageCtrl {

   
         NSLog(@"string");
    
    
}



#pragma mark - UIAlertView
/*_____________________________UIAlertView_____________________________*/

- (void)_initAerltView {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"弹出Alert" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(showAlert) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(100, 430, 100, 30);
    [self.window addSubview:button];
    
//    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [button1 setTitle:@"弹出Alert" forState:UIControlStateNormal];
//    [button1 addTarget:self action:@selector(showAlert) forControlEvents:UIControlEventTouchUpInside];
//    button1.frame = CGRectMake(100, 330, 100, 30);
//    [self.window addSubview:button1];
}

- (void)showAlert {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"警告"
                                                        message:@"密码输入错误"
                                                       delegate:self
                                              cancelButtonTitle:@"取消"
                                              otherButtonTitles:@"确定",@"按钮1",@"按钮2", nil];
    [alertView show];
    [alertView release];
   
}

#pragma mark - UIAlertView delegate
//-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        NSLog(@"取消");
    } else if(buttonIndex == 2) {
        NSLog(@"确定");
    }
}



#pragma mark - UIActionSheet
/*_____________________________UIActionSheet_____________________________*/

- (void)_initActionSheet {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"弹出Sheet" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(showSheet) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(200, 430, 100, 30);
    [self.window addSubview:button];
}

- (void)showSheet {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"提示"
                                                             delegate:self cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:@"确定"
                                                    otherButtonTitles:@"按钮1",@"按钮2", nil];
    [actionSheet showInView:self.window];
    [actionSheet release];
}

#pragma mark UIActionSheet delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"%d",buttonIndex);
}

#pragma mark - UIProgressView
/*_____________________________UIProgressView_____________________________*/
- (void)_initProgress {
    UIProgressView *progress = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    progress.frame = CGRectMake(10, 460, 200, 0);
    //进度值,范围(0~1)
    progress.progress = 0.5;
    progress.tag = 201;
    
    //设置已加载的进度条颜色，左边的进度条
    [progress setProgressTintColor:[UIColor redColor]];
    //设置未加载的进度条颜色，右边的进度条
    progress.trackTintColor = [UIColor greenColor];
    
    [self.window addSubview:progress];
    
    [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(progressAction:) userInfo:nil repeats:YES];
}

- (void)progressAction:(NSTimer *)timer {
    UIProgressView *progress = (UIProgressView *)[self.window viewWithTag:201];
    progress.progress+=0.01;
    
    if (progress.progress == 1) {
        [timer invalidate];
    }
}



#pragma mark - UIToolbar
/*_____________________________UIToolbar_____________________________*/
- (void)_initToolbar {
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(100, 200, 200, 49)];
    toolbar.barStyle = UIBarStyleDefault;
    toolbar.tintColor = [UIColor redColor];
    [self.window addSubview:toolbar];
    [toolbar release];
    
    //创建工具栏上的按钮
    /*
     UIBarButtonItem 的x\y坐标UIToolbar自动会调整，不用设定  
     */
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(itemAction)];
    
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"学院" style:UIBarButtonItemStyleBordered target:self action:@selector(itemAction)];
//    [[UIBarButtonItem alloc] initWithImage:<#(UIImage *)#> style:<#(UIBarButtonItemStyle)#> target:<#(id)#> action:<#(SEL)#>];
    
    
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    item3.width = 20;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    button.frame = CGRectMake(0, 0, 20, 20);
    [button addTarget:self action:@selector(itemAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item4 = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    NSArray *items = [NSArray arrayWithObjects:item1,item2,item3,item4, nil];
//    [toolbar setItems:items];
    toolbar.items = items;
}

- (void)itemAction {
    NSLog(@"item");
}


#pragma mark - Launching
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.backgroundColor = [UIColor orangeColor];
    [self.window makeKeyAndVisible];
    
    [self _initLabel];
    
    [self _initButton];
    
    [self _initCustomButton];
    
    [self _initTextField];
    
    [self _initImageView];
    
    [self _initSlider];
    
    [self _initSwitch];
    
    [self _initSegmented];
    
    [self _initActivityIndicator];
    
    [self _initPageControll];
    
    [self _initAerltView];
    
    [self _initActionSheet];
    
    [self _initProgress];
    
    [self _initToolbar];
    
    return YES;
}

@end
