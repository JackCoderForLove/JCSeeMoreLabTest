//
//  ViewController.m
//  JCSeeMoreLabTest
//
//  Created by xingjian on 2017/9/7.
//  Copyright © 2017年 xingjian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.jcLab];
    [self addSeeMoreButton];

    NSMutableAttributedString *jcAttStr = [[NSMutableAttributedString alloc]initWithString:@"啥的连接生犯贱发送到离开即使对方了分手的距离就苏打绿可减肥副书记劳动节饭开始劳动节发生了的开房记录是点击分手的距离就发送的了发送的逻辑非等上了辅导教师快捷方式来的减肥的就是费劲老实的啥的连接生犯贱发送到离开即使对方了分手的距离就苏打绿可减肥副书记劳动节饭开始劳动节发生了的开房记录是点击分手的距离就发送的了发送的逻辑非等上了辅导教师快捷方式来的减肥的就是费劲老实的"];
    [jcAttStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, jcAttStr.length)];
   
    CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 30, 60);
    self.jcLab.attributedText = jcAttStr;
    //计算文本尺寸
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:maxSize text:jcAttStr];
 
    [self.jcLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kScreenWidth-30);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.view.mas_top).offset(30);
        make.height.mas_equalTo(layout.textBoundingSize.height);
    }];
    self.jcLab.backgroundColor = [UIColor redColor];
    
    //根据numberOfLines来切换是否显示更多查看全文
   // self.jcLab.numberOfLines = 2;
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)addSeeMoreButton {
    __weak typeof(self) _self = self;
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"... 查看全文"];
    
    YYTextHighlight *hi = [YYTextHighlight new];
    [hi setColor:[UIColor colorWithRed:0.578 green:0.790 blue:1.000 alpha:1.000]];
    hi.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
//        YYLabel *label = _self.jcLab;
//        [label sizeToFit];
        NSLog(@"点击了高亮文字");
    };
    
    [text yy_setColor:[UIColor colorWithRed:0.000 green:0.449 blue:1.000 alpha:1.000] range:[text.string rangeOfString:@"查看全文"]];
    [text yy_setTextHighlight:hi range:[text.string rangeOfString:@"查看全文"]];
    text.yy_font = self.jcLab.font;
    
    YYLabel *seeMore = [YYLabel new];
    seeMore.attributedText = text;
    [seeMore sizeToFit];
    
    NSAttributedString *truncationToken = [NSAttributedString yy_attachmentStringWithContent:seeMore contentMode:UIViewContentModeCenter attachmentSize:seeMore.size alignToFont:text.yy_font alignment:YYTextVerticalAlignmentCenter];
    self.jcLab.truncationToken = truncationToken;
}

- (YYLabel *)jcLab
{
    if (!_jcLab) {
        
        _jcLab = [[YYLabel alloc]init];
        _jcLab.numberOfLines = 3;
        _jcLab.lineBreakMode = NSLineBreakByTruncatingTail;
        _jcLab.font = [UIFont systemFontOfSize:15];
        _jcLab.textColor = [UIColor blackColor];
        //_jcLab.textVerticalAlignment = YYTextVerticalAlignmentTop;

    }
    return _jcLab;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
