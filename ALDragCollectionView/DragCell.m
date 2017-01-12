//
//  DragCell.m
//  ALDragCollectionView
//
//  Created by 李丽 on 16/8/29.
//  Copyright © 2016年 LiLi. All rights reserved.
//

#import "DragCell.h"

@implementation DragCell

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.showImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.showImageView.backgroundColor = [UIColor redColor];
        self.showImageView.layer.masksToBounds = YES;
        self.showImageView.layer.cornerRadius = 5;
        [self addSubview:self.showImageView];
    }
    return self;
}

@end
