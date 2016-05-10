//
//  TTButtonLineView.m
//  JinCheng
//
//  Created by TT_code on 16/4/20.
//  Copyright © 2016年 TT_code. All rights reserved.
//


/**
 *    设备宽度和高度
 *
 */
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenCenter CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)


//--------------获取控件的fram属性--------------------------
/**
 *  获取控件的fram属性
 *
 *  @param obj 试图
 *
 */
#define W(obj)   (!obj?0:(obj).frame.size.width)
#define H(obj)   (!obj?0:(obj).frame.size.height)
#define X(obj)   (!obj?0:(obj).frame.origin.x)
#define Y(obj)   (!obj?0:(obj).frame.origin.y)
#define XW(obj) (X(obj))+(W(obj))
#define YH(obj) (Y(obj))+(H(obj))




#import "TTButtonLineView.h"
@interface TTButtonLineView()<UIScrollViewDelegate>
@property(nonatomic,strong)UIButton* selectedbtn;//当前按钮
@property(nonatomic,strong)UIColor* linecolor;


@property(nonatomic,strong)UIScrollView* scrollview;
@end

@implementation TTButtonLineView



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
+(TTButtonLineView*)CreateButtonLineWithFram:(CGRect)fram  dataarray:(NSArray*)dataarray linecolor:(UIColor*)linecolor  showview:(UIView*)showview  ButtonClickBlock:(void (^)(NSInteger tag))block
{
    TTButtonLineView* view=[[TTButtonLineView alloc]initWithFrame:fram];
    view.linecolor=linecolor;
    [showview addSubview:view];
    view.tag=200;
    view.backgroundColor=[UIColor whiteColor];
    NSArray* array=dataarray;
    CGFloat width=W(view)/array.count;
    CGFloat height=H(view);
    
    for (int i=0; i<array.count; i++) {
        UIButton* button=[[UIButton alloc]initWithFrame:CGRectMake(width*i, 0, width, height)];
         button.titleLabel.font=[UIFont systemFontOfSize:15];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button addTarget:view action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
        button.tag=i;
        if(i==0){
            [view Click:button];
        }
        [view addSubview:button];
    }
    UILabel* line=[[UILabel alloc]initWithFrame:CGRectMake(0, H(view)-1.5, width, 1)];
    line.backgroundColor=linecolor;
    line.tag=1000;
    [view addSubview:line];
    view.block=^(NSInteger tag){
        block(tag);
    };
    
    
//    UILabel* newline=[[UILabel alloc]initWithFrame:CGRectMake(0, fram.size.height-0.5, fram.size.width, 0.5)];
//    newline.backgroundColor=[UIColor grayColor];
//    [view addSubview:newline];
    
    return view;
}


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
+(TTButtonLineView*)CreateButtonWidthEquelLineWidthWithFram:(CGRect)fram  dataarray:(NSArray*)dataarray linecolor:(UIColor*)linecolor  showview:(UIView*)showview   ButtonClickBlock:(void (^)(NSInteger tag))block
{
    TTButtonLineView* view=[[TTButtonLineView alloc]initWithFrame:fram];
    [showview addSubview:view];
    view.linecolor=linecolor;
    view.tag=200;
    view.backgroundColor=[UIColor whiteColor];
    NSArray* array=dataarray;
    CGFloat width=W(view)/array.count;
    CGFloat height=H(view);
    
    
    //增加线
    UILabel* line=[[UILabel alloc]initWithFrame:CGRectMake(0, H(view)-1, width, 1)];
    line.backgroundColor=linecolor;
    line.tag=1000;
    [view addSubview:line];
    
    
    for (int i=0; i<array.count; i++) {
        UIButton* button=[[UIButton alloc]initWithFrame:CGRectMake(width*i, 0, width, height)];
        button.titleLabel.font=[UIFont systemFontOfSize:15];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button addTarget:view action:@selector(OnClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag=i;
        [view addSubview:button];
        if(i==0){
            [view OnClick:button];
        }
    }
    
    view.block=^(NSInteger tag){
        block(tag);
    };
    return view;
}




+(TTButtonLineView*)CreateButtonCenterLineWidthWithFram:(CGRect)fram  dataarray:(NSArray*)dataarray linecolor:(UIColor*)linecolor  showview:(UIView*)showview   ButtonClickBlock:(void (^)(NSInteger tag))block
{
    TTButtonLineView* view=[[TTButtonLineView alloc]initWithFrame:fram];
    //scrollview 设置
    view.scrollview=[[UIScrollView alloc]initWithFrame:view.bounds];//加入scrollview
    view.scrollview.delegate=view;
    view.scrollview.showsHorizontalScrollIndicator=NO;
    view.scrollview.showsVerticalScrollIndicator=NO;
    [view addSubview:view.scrollview];
    [showview addSubview:view];
    
    //基础设置
    view.linecolor=linecolor;
    view.tag=200;
    view.backgroundColor=[UIColor whiteColor];
    CGFloat height=H(view);

    
    //增加线
    UILabel* line=[[UILabel alloc]initWithFrame:CGRectMake(0, H(view)-1, 100, 1)];
    line.backgroundColor=linecolor;
    line.tag=1000;
    [view.scrollview addSubview:line];
    
    
    //增加buttoon
    CGFloat angle=20;//间隔
    CGFloat X=angle;
    for (int i=0; i< dataarray.count; i++) {
        CGRect fram=[view laysetWordsize:CGSizeMake(1000000, height) font:[UIFont systemFontOfSize:15] text: dataarray[i]];
        
        UIButton* button=[[UIButton alloc]initWithFrame:CGRectMake(X, 0, fram.size.width, height)];
        [button setTitle: dataarray[i] forState:UIControlStateNormal];
        button.tag=i;
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont systemFontOfSize:15];
        [button addTarget:view action:@selector(ScrollClick:) forControlEvents:UIControlEventTouchUpInside];
        X+=angle+fram.size.width;
        [view.scrollview addSubview:button];
        //默认第一个选中
        if(i==0){
            [view ScrollClick:button];
        }
    }
    
    
    
    [view.scrollview setContentSize:CGSizeMake(X,view.scrollview.bounds.size.height)];
    
    view.block=^(NSInteger tag){
        block(tag);
    };
    return view;
}


-(void)ScrollClick:(UIButton*)sender
{
    //变颜色
    [self.selectedbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.selectedbtn=sender;
    [self.selectedbtn setTitleColor:self.linecolor forState:UIControlStateNormal];
    
    
    //设置滚动
    UIButton* currenbutton=sender;
    CGFloat  offsetx=currenbutton.center.x-self.scrollview.bounds.size.width/2;
    
    //设置滚动
    if(offsetx<0) offsetx = 0;
    if(self.scrollview.contentSize.width-currenbutton.center.x<=self.scrollview.bounds.size.width/2)
        offsetx=self.scrollview.contentSize.width-self.scrollview.bounds.size.width;
    [self.scrollview setContentOffset:CGPointMake(offsetx, 0) animated:YES];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.block(sender.tag);
    });
    
    UIView* view=sender.superview;
    UILabel* line=[view viewWithTag:1000];
    CGRect fram=[self laysetWordsize:CGSizeMake(10000, H(sender)) font:[UIFont systemFontOfSize:15] text:sender.titleLabel.text];
    [UIView animateWithDuration:0.6 delay:0.1 usingSpringWithDamping:0.65 initialSpringVelocity:2 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        [self laysetWidth:line andwidth:fram.size.width];
        [self laysetcenterX:line andcenterx:sender.center.x];
    } completion:^(BOOL finished) {
    }];
    
}



/**
 *  监听点击
 *
 *  @param sender
 */
-(void)OnClick:(UIButton*)sender
{
    
    
    [self.selectedbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.selectedbtn=sender;
    [self.selectedbtn setTitleColor:self.linecolor forState:UIControlStateNormal];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.block(sender.tag);
    });
    
    
    UIView* view=sender.superview;
    UILabel* line=[view viewWithTag:1000];
    CGRect fram=[self laysetWordsize:CGSizeMake(10000, H(sender)) font:[UIFont systemFontOfSize:15] text:sender.titleLabel.text];
    [UIView animateWithDuration:0.6 delay:0.1 usingSpringWithDamping:0.65 initialSpringVelocity:2 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        [self laysetWidth:line andwidth:fram.size.width];
        [self laysetcenterX:line andcenterx:sender.center.x];
    } completion:^(BOOL finished) {
    }];
    
}




/**
 *  监听点击。
 *
 *  @param sender
 */
-(void)Click:(UIButton*)sender
{
    
    UIView* view=sender.superview;
    UILabel* line=[view viewWithTag:1000];
    [self.selectedbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.selectedbtn=sender;
    [self.selectedbtn setTitleColor:self.linecolor forState:UIControlStateNormal];
    
    [UIView animateWithDuration:0.3 animations:^{
        [self laysetX:line andx:sender.tag*sender.bounds.size.width];
    }completion:^(BOOL finished) {
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.block(sender.tag);
    });
    
}

-(void)laysetX:(UIView*)sender andx:(CGFloat)x
{
    CGRect fram=sender.frame;
    fram.origin.x=x;
    sender.frame=fram;
    
}





#pragma mark-计算文字大小
-(CGRect)laysetWordsize:(CGSize)size font:(UIFont*)font text:(NSString*)text
{
    return [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin  attributes:@{NSFontAttributeName : font} context:nil];
}

#pragma mark- 设置Width的宽度
-(void)laysetWidth:(UIView*)sender andwidth:(CGFloat)width
{
    
    CGRect fram=sender.frame;
    fram.size.width=width;
    sender.frame=fram;
    
}

#pragma mark- 设置center的值
-(void)laysetcenterX:(UIView*)sender andcenterx:(CGFloat)x
{
    CGPoint center=sender.center;
    center.x=x;
    sender.center=center;
    
}
@end
