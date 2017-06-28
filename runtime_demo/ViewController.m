//
//  ViewController.m
//  runtime_demo
//
//  Created by IntelcentMac on 17/6/26.
//  Copyright © 2017年 wh_shine. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 调用一个没有声明，也可能没有实现的方法
    Person *per = [[Person alloc] init];
        //method 1
//    [per performSelector:@selector(varietyNameOfSEL) withObject:nil];
    
        /** 
         *method 2
         *Xcode5开始，不建议使用 obj_msgSend() 消息机制
         */
//    objc_msgSend(per,@selector(varietyNameOfSEL));
    
    SEL sel = sel_getUid("varietyNameOfSEL1");
    BOOL haveSel = class_respondsToSelector(self, sel);
    objc_msgSend(per, sel);
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
