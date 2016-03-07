//
//  LKSoundTool.h
//  音效
//
//  Created by 雷凯 on 16/3/6.
//  Copyright © 2016年 leifaxian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface LKSoundTool : NSObject
/// 播放音效
+(void)playSoundWithFileName:(NSString *)fileName;
/// 销毁音效
+(void)disposeSoundWithFileName:(NSString *)fileName;



@end
