//
//  ViewController.m
//  ding
//
//  Created by Joseph Bell on 1/19/14.
//  Copyright (c) 2014 iAchieved.it LLC.
//
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

// Comment this line out to do a test run with an incorrect implementation
// that causes the AVAudioPlayer to be lost to ARC
#define CORRECT_IMPLEMENTATION

@interface ViewController () <AVAudioPlayerDelegate>

#ifdef CORRECT_IMPLEMENTATION
  @property (nonatomic, strong) AVAudioPlayer* player;
#endif

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playSound:(id)sender {
  
  NSLog(@"playSound");
  
  NSString* path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"ding.caf"];
  NSError* error;
  
#ifdef CORRECT_IMPLEMENTATION
  self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:&error];
  self.player.delegate = self;
  [self.player play];
#else
  AVAudioPlayer* player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:&error];
  [player play];
#endif
  
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
  if (flag) {
    NSLog(@"audioPlayerDidFinishPlaying successfully");
  }
}

@end
