//
//  ViewController.m
//  scrollText
//
//  Created by Semen Matsepura on 02.01.16.
//  Copyright © 2016 Semen Matsepura. All rights reserved.
//

#import "ViewController.h"
NSTimer *scrollingTimer;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *mopassanTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setup];
}

- (void)setup {

    NSLog(@"%f %f",self.mopassanTextView.contentSize.width , self.mopassanTextView.contentSize.height);
    
    if (scrollingTimer == nil) {
        // speed of scrolling
        scrollingTimer = [NSTimer scheduledTimerWithTimeInterval:(0.03)
                                                          target:self selector:@selector(autoscrollTimerFired) userInfo:nil repeats:YES];
    }
}

- (void) autoscrollTimerFired {
    CGPoint scrollPoint = self.mopassanTextView.contentOffset;
    NSLog(@"%.2f %.2f",scrollPoint.x,scrollPoint.y);
    if (scrollPoint.y == self.mopassanTextView.contentSize.height - self.mopassanTextView.bounds.size.height) // position to stop scrolling
    {
        [scrollingTimer invalidate];
        scrollingTimer = nil;
    }
    scrollPoint = CGPointMake(scrollPoint.x, scrollPoint.y + 1); // makes scroll
    [self.mopassanTextView setContentOffset:scrollPoint animated:NO];
    NSLog(@"%f %f",self.mopassanTextView.contentSize.width , self.mopassanTextView.contentSize.height);
}

@end
