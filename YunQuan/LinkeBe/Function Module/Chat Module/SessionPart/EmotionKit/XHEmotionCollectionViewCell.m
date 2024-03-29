//
//  XHEmotionCollectionViewCell.m
//  MessageDisplayExample
//
//  Created by qtone-1 on 14-5-3.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "XHEmotionCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@interface XHEmotionCollectionViewCell ()

/**
 *  显示表情封面的控件
 */
@property (nonatomic, weak) UIImageView *emotionImageView;

@property (nonatomic, weak) UILabel * titleLabel;

/**
 *  配置默认控件和参数
 */
- (void)setup;
@end

@implementation XHEmotionCollectionViewCell

#pragma setter method

- (void)setEmotion:(XHEmotion *)emotion {
    _emotion = emotion;
    
    // TODO:
    self.emotionImageView.image = emotion.emotionConverPhoto;
}

- (void)setEmoticonItem:(EmoticonItemData *)emoticonItem
{
    _emoticonItem = emoticonItem;
    [self.emotionImageView setImageWithURL:[NSURL URLWithString:emoticonItem.previewIcon] placeholderImage:nil];
    self.titleLabel.text = emoticonItem.title;
}

#pragma mark - Life cycle

- (void)setup {
    if (!_emotionImageView) {
        UIImageView *emotionImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kXHEmotionImageViewSize, kXHEmotionImageViewSize)];
        emotionImageView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:emotionImageView];
        self.emotionImageView = emotionImageView;
        
        self.backgroundColor = [UIColor clearColor];
        
        UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.bounds)- 20, CGRectGetMaxX(self.bounds), 20)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = KQLSystemFont(14);
        titleLabel.textColor = [UIColor colorWithWhite:0.4 alpha:1.0f];
        titleLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:titleLabel];
        
        self.titleLabel = titleLabel;
    }
}

- (void)awakeFromNib {
    [self setup];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

- (void)dealloc {
    self.emotion = nil;
}

@end
