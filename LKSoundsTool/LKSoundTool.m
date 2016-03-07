//
//  LKSoundsTool.m
//  音效（封装版）
//
//  Created by 雷凯 on 16/3/6.
//  Copyright © 2016年 leifaxian. All rights reserved.
//



#import "LKSoundTool.h"

@implementation LKSoundTool


// 保存fileName  保存soundID
// 字典: key:fileName  value:soundID
static NSMutableDictionary *_dict;


/// 导入头文件时调用
+(void)load {
    
}
/// 类第一次使用时调用
+(void)initialize {
    
    _dict = [NSMutableDictionary dictionary];
}


+(void)playSoundWithFileName:(NSString *)fileName {
    
    if (fileName.length == 0) {
        return;
    }
    
    
    //1.从字典取出soundID
    SystemSoundID soundID = [_dict[fileName ]unsignedIntValue];
    
    if (!soundID) {
        
        NSURL *url = [[NSBundle mainBundle]URLForResource:fileName withExtension:nil];
        
        if (url == nil) {
            
            return;
        }
        
        // 创建soundID
        AudioServicesCreateSystemSoundID(CFBridgingRetain(url), &soundID);
        
        _dict[fileName] = @(soundID);
    }
    
    NSLog(@"%d",soundID);
    
    //2.通过soundID去播放音效
    AudioServicesPlaySystemSound(soundID);
    
    
}

+(void)disposeSoundWithFileName:(NSString *)fileName {
    
    if (fileName.length == 0) {
        return;
    }
    
    SystemSoundID soundID = [_dict[fileName]unsignedIntValue];
    
    if (soundID) {
        
        //销毁音效文件
        AudioServicesDisposeSystemSoundID(soundID);
        
        [_dict removeObjectForKey:fileName];
    }
    
    
}

@end
