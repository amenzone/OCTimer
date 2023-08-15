//
//  OCViewController.m
//  OCTimer
//
//  Created by AM on 08/15/2023.
//  Copyright (c) 2023 AM. All rights reserved.
//

#import "OCViewController.h"
#import "OCTimer.h"

@interface OCViewController ()
@property (copy, nonatomic) NSString *task;
//@property (copy, nonatomic) NSString *task2;
@end

@implementation OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 接口设计
    self.task = [OCTimer execTask:self
                         selector:@selector(doTask)
                            start:2.0
                         interval:1.0
                          repeats:YES
                            async:YES];
    // 接口设计2 repeats:NO 不需要调用cancelTask
    /*self.task2 = [OCTimer execTask:^{
        NSLog(@"执行任务 - %@", [NSThread currentThread]);
    } start:2.0 interval:1 repeats:NO async:NO];*/
}

- (void)doTask
{
    NSLog(@"DoTask - %@", [NSThread currentThread]);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [OCTimer cancelTask:self.task];
}


@end

