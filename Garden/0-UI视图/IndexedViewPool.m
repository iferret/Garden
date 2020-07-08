//
//  IndexedViewPool.m
//  Garden
//
//  Created by tramp on 2020/7/8.
//  Copyright © 2020 tramp. All rights reserved.
//

#import "IndexedViewPool.h"
#import <UIKit/UIKit.h>

@interface IndexedViewPool ()

/// 等待队列
@property(nonatomic, strong) NSMutableSet<IndexedView *> * wattings;
/// 使用队列
@property(nonatomic, strong) NSMutableSet<IndexedView *> *usings;

@end

@implementation IndexedViewPool

/// dequeueReusableIndexedView
- (IndexedView *)dequeueReusableIndexedView {
    if (self.wattings.count > 0) {
        IndexedView * value = [self.wattings anyObject];
        [self.wattings removeObject: value];
        [self.usings addObject: value];
        NSLog(@"复用了");
        return value;
    } else {
        IndexedView * value = [IndexedView buttonWithType: UIButtonTypeCustom];
        [self.usings addObject: value];
        NSLog(@"创建了");
        return value;
    }
    
}

/// 重置
-(void)reset {
    [self.usings enumerateObjectsUsingBlock:^(IndexedView * _Nonnull obj, BOOL * _Nonnull stop) {
        [self.wattings addObject: obj];
    }];
    [self.usings removeAllObjects];
}

// MARK: - 懒加载

/// 等待队列
- (NSMutableSet<IndexedView *> *)wattings {
    if (_wattings == nil) {
        _wattings = [[NSMutableSet<IndexedView *> alloc] init];
    }
    return  _wattings;
}

/// 使用队列
-(NSMutableSet<IndexedView *> *)usings {
    if (_usings == nil) {
        _usings = [[NSMutableSet<IndexedView *> alloc] init];
    }
    return _usings;
}

@end
