//
//  IndexedTableView.m
//  Garden
//
//  Created by tramp on 2020/7/8.
//  Copyright © 2020 tramp. All rights reserved.
//

#import "IndexedTableView.h"
#import "IndexedViewPool.h"

@interface IndexedTableView ()

@property(nonatomic, strong) IndexedViewPool * pool;

@end

@implementation IndexedTableView

/// reloadData
- (void)reloadData {
    [self.pool reset];
    [super reloadData];
}

/// IndexedViewPool
- (IndexedViewPool *)pool {
    if (_pool == nil ) {
        _pool = [[IndexedViewPool alloc] init];
    }
    return _pool;
}

@end
