//
//  MZHelpCenter.h
//  MZHelpCenterDemo
//
//  Created by 麦子 on 15/10/23.
//  Copyright (c) 2015年 麦子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MZHelpCenter : NSObject

/**
 *  获取某个字符串在控件上所占的宽度
 *
 *  @param text 字符串内容
 *  @param font 字体
 *
 *  @return 控件宽度
 */
+ (CGFloat)textWidthWithText:(NSString *)text font:(UIFont *)font;

/**
 *  获取某个字符串在控件所占的高度
 *
 *  @param text  字符串内容
 *  @param font  字体
 *  @param width 控件宽度
 *
 *  @return 控件高度
 */
+ (CGFloat)textHeightWithText:(NSString *)text font:(UIFont *)font width:(CGFloat)width;

/**
 *  通过一个未来的日期，返回一个剩余时间的字符串
 *
 *  @param timeString 日期字符串 例：@"2016年4月30日1时1分1秒1"
 *
 *  @param type 日期格式与timeString对应 例：@"yyyy年MM月dd日HH时mm分ss秒s"
 *
 *  @return 剩余时间
 */
+ (NSString *)currentTimeSinceToday:(NSString *)timeString type:(NSString *)type;

/**
 *  日期转时间戳
 *
 *  @param timeString 日期字符串 例：@"2016年4月30日1时1分1秒1"
 *
 *  @param type 日期格式与timeString对应 例：@"yyyy年MM月dd日HH时mm分ss秒s"
 *
 *  @return unix时间戳
 */
+ (NSString *)timeToUnixDate:(NSString *)timeString type:(NSString *)type;

/**
 *  Unix时间戳转具体日期
 *
 *  @param timeString Unix时间戳
 *
 *  @return 具体日期
 */
+ (NSString *)currentTimeSince1970:(NSString *)timeString;

/**
 *  返回朋友圈格式时间
 *
 *  @param timeString Unix时间戳
 *
 *  @return 微信朋友圈时间样式的字符串
 */
+ (NSString *)circleCreateTime:(NSString *)timeString;

/**
 *  返回今天的字符串
 *
 *  @param type 日期显示格式，如：@"yyyy年MM月dd日"
 *
 *  @return 今天的日期，如：@"2016年10月28日"
 */
+ (NSString *)currentDateWithType:(NSString *)type;

/**
 *  获取今天的时间戳
 *
 *  @return 今天的Unix时间戳（按秒计）
 */
+ (NSString *)currentTime;

/**
 *  处理ios上传图片到服务器中图片旋转的问题（上传处理完的图片）
 *
 *  @param image 需要转换的image
 *
 *  @return 转换完成的image
 */
+ (UIImage *)normalizedImage:(UIImage *)image;

/**
 *  正则表达式，判断手机号是否合法
 *
 *  @param mobile 手机号
 *
 *  @return YES/NO
 */
+ (BOOL)isLegalMobile:(NSString *)mobile;

/**
 *  调用系统的震动，需要真机
 */
+ (void)systemShake;

/**
 *  调用系统的声音
 *
 *  @param soundName 如：@"ReceivedMessage"
 *  @param soundType 如：@"caf"
 */
+ (void)createSystemSoundWithName:(NSString *)soundName soundType:(NSString *)soundType;

/**
 *  打印数据模型
 *
 *  @param dict 需要打印的字典
 */
+ (void)createModelWithDictionary:(NSDictionary *)dict;

@end
