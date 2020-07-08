//
//  IndexedViewPool.h
//  Garden
//
//  Created by tramp on 2020/7/8.
//  Copyright © 2020 tramp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class UIButton;
typedef UIButton IndexedView;

@interface IndexedViewPool : NSObject

/// 取出视图
-(IndexedView *)dequeueReusableIndexedView;

/// 重制
-(void)reset;

@end

NS_ASSUME_NONNULL_END
