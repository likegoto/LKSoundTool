//
//  ViewController.m
//  LKSoundToolDemo
//
//  Created by 雷凯 on 16/3/7.
//  Copyright © 2016年 leifaxian. All rights reserved.
//

#import "ViewController.h"
#import "LKSoundTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [LKSoundTool playSoundWithFileName:@"win.aac"];
}

//点击屏幕切换音效
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    NSString *string = [NSString stringWithFormat:@"m_%02d.wav",arc4random_uniform(14)+3];
    
    [LKSoundTool playSoundWithFileName:string];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //销毁
        
        [LKSoundTool disposeSoundWithFileName:string];
    });
    
    
}

@end
