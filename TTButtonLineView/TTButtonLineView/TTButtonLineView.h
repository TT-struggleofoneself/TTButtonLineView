//
//  TTButtonLineView.h
//  JinCheng
//
//  Created by TT_code on 16/4/20.
//  Copyright © 2016年 TT_code. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTButtonLineView : UIView
typedef void (^CollecButtonClickBlock) (NSInteger tag);



@property(nonatomic,strong)CollecButtonClickBlock block;


/**
 *  创建视图---平分类型line  充满button
 *
 *  @param fram      fram
 *  @param dataarray 按钮title  数组
 *  @param linecolor 线  颜色
 *  @param block
 *
 *  @return
 */
+(TTButtonLineView*)CreateButtonLineWithFram:(CGRect)fram  dataarray:(NSArray*)dataarray linecolor:(UIColor*)linecolor  showview:(UIView*)showview  ButtonClickBlock:(void (^)(NSInteger tag))block;


/**
 *  创建视图---平分类型linewidth=button的文字宽度
 *
 *  @param fram      fram
 *  @param dataarray 按钮title  数组
 *  @param linecolor 线  颜色
 *  @param block
 *
 *  @return
 */
+(TTButtonLineView*)CreateButtonWidthEquelLineWidthWithFram:(CGRect)fram  dataarray:(NSArray*)dataarray linecolor:(UIColor*)linecolor  showview:(UIView*)showview   ButtonClickBlock:(void (^)(NSInteger tag))block;





+(TTButtonLineView*)CreateButtonCenterLineWidthWithFram:(CGRect)fram  dataarray:(NSArray*)dataarray linecolor:(UIColor*)linecolor  showview:(UIView*)showview   ButtonClickBlock:(void (^)(NSInteger tag))block;

@end
