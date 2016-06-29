//
//  MZHelpCenter.m
//  MZHelpCenterDemo
//
//  Created by 麦子 on 15/10/23.
//  Copyright (c) 2015年 麦子. All rights reserved.
//

#import "MZHelpCenter.h"
#import <AVFoundation/AVFoundation.h>

@implementation MZHelpCenter

#pragma mark -- 返回字符串宽度
+ (CGFloat)textWidthWithText:(NSString *)text font:(UIFont *)font {
    CGSize size = [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 25) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size;
    return size.width;
}

#pragma mark -- 返回字符串高度
+ (CGFloat)textHeightWithText:(NSString *)text font:(UIFont *)font width:(CGFloat)width{
    if (text==nil || text.length<=0) {
        return 0;
    } else {
        CGSize size = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size;
        return size.height;
    }
}

#pragma mark -- 返回距今的日期
+ (NSString *)currentTimeSinceToday:(NSString *)timeString type:(NSString *)type{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = type;
    NSDate *date = [formatter dateFromString:timeString];
    NSInteger interval = [date timeIntervalSinceNow];
    NSInteger hour = interval/3600;
    interval %= 3600;
    NSInteger min = interval/60;
    interval %= 60;
    return [NSString stringWithFormat:@"剩余:%02ld时%02ld分%02ld秒",hour, min, interval];
}

#pragma mark -- Unix时间戳转具体日期
+ (NSString *)currentTimeSince1970:(NSString *)timeString {
    NSTimeInterval interval;
    if (timeString.length > 10) {
        interval = [timeString integerValue]/1000.0;
    } else {
        interval = [timeString integerValue];
    }
    NSDate  *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yy-MM-dd HH:mm";
    return [formatter stringFromDate:date];
}

#pragma mark -- 返回朋友圈时间显示
+ (NSString *)circleCreateTime:(NSString *)timeString {
    NSTimeInterval interval;
    if (timeString.length > 10) {
        interval = [timeString integerValue]/1000.0;
    } else {
        interval = [timeString integerValue];
    }
    NSDate *dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval now = [dat timeIntervalSince1970];
    NSTimeInterval time = now - interval;
    if (time <= 60*60) {
        return [NSString stringWithFormat:@"%.lf 分钟前", time/60];
    } else if (time <= 24*60*60) {
        return [NSString stringWithFormat:@"%.lf 小时前", time/3600];
    } else if (time <= 2*24*60*60) {
        NSDate  *date = [NSDate dateWithTimeIntervalSince1970:interval];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"HH:mm";
        return [@"昨天" stringByAppendingString:[formatter stringFromDate:date]];
    } else {
        NSDate *nowDate = [NSDate dateWithTimeIntervalSince1970:now];
        NSDate  *date = [NSDate dateWithTimeIntervalSince1970:interval];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yy";
        if ([[formatter stringFromDate:date] isEqualToString:[formatter stringFromDate:nowDate]]) {
            formatter.dateFormat = @"MM-dd HH:mm";
        } else {
            formatter.dateFormat = @"yy-MM-dd HH:mm";
        }
        return [formatter stringFromDate:date];
    }
}


#pragma mark -- 处理ios图片旋转问题
+ (UIImage *)normalizedImage:(UIImage *)image {
    if (image.imageOrientation == UIImageOrientationUp) return image;
    UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
    [image drawInRect:(CGRect){0, 0, image.size}];
    UIImage *normalizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return normalizedImage;
}

#pragma mark -- 返回今天的日期
+ (NSString *)currentDateWithType:(NSString *)type {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = type;
    return [formatter stringFromDate:[NSDate date]];
}

#pragma mark -- 返回今天的Unix时间戳
+ (NSString *)currentTime {
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%0.f", a];
    return timeString;
}

#pragma mark -- 返回字典模型
+ (void)createModelWithDictionary:(NSDictionary *)dict {
    for (NSString *key in dict) {
        printf("@property (nonatomic, copy) NSString *%s;\n",[key UTF8String]);
    }
}

#pragma mark -- 判断手机是否合法
+ (BOOL)isLegalMobile:(NSString *)mobile
{
    //手机号以13，15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^[1][3578][0-9]{9}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

#pragma mark -- 调用系统震动
+ (void)systemShake
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

#pragma mark -- 调用系统铃声
+ (void)createSystemSoundWithName:(NSString *)soundName soundType:(NSString *)soundType
{
    SystemSoundID soundID;
    NSString *path = [NSString stringWithFormat:@"/System/Library/Audio/UISounds/%@.%@",soundName,soundType];
    if (path) {
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path], &soundID);
        AudioServicesPlaySystemSound(soundID);
        
    }
}

@end
