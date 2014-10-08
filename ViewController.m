//
//  ViewController.m
//  PickerWithDocumentsTest
//
//  Created by MacBook_RG on 9/14/14.
//  Copyright (c) 2014 Richard Grice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
   
}

@end

@implementation ViewController

@synthesize AudioPicker;
@synthesize myPlayer;
@synthesize audioFiles;
@synthesize selectedSound;
@synthesize PathComponents;
@synthesize docDir;
@synthesize filePath;
@synthesize fileName;


- (void)viewDidLoad
{
    
    AudioPicker.delegate = self;
    AudioPicker.dataSource = self;
    [self.AudioPicker reloadAllComponents];
    [super viewDidLoad];
   // Testing with literal array list <---
    //audio = [[NSArray alloc] initWithObjects:@"audio1.caf",@"audio1.caf", nil];
 /*
    audio = [[NSMutableArray alloc] init];
    NSString *dirPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"Sounds"];
    NSError *error;
    NSArray *audio =  [[NSFileManager defaultManager]
                         contentsOfDirectoryAtPath:dirPath error:&error];
    NSLog(@"aray log %@", audio);
    NSLog(@"path log %@", dirPath);
  */
    
    NSFileManager *filemanager = [NSFileManager defaultManager];
    audioFiles = [[NSMutableArray alloc] init];
    
    NSArray *pathComponents = NSSearchPathForDirectoriesInDomains(
                                                                  NSDocumentDirectory,           NSUserDomainMask, YES);
    
    if([pathComponents count] > 0) {
        NSString *docDir = [pathComponents objectAtIndex:0];
        
        NSError *error = nil;
        audioFiles = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:docDir error:&error];
        if(error){
            NSLog(@"Failed getting files with error: %@",[error description]);
        }
        NSLog(@"Files are in fact being created...");
        
        
        
        
        
        NSInteger count = [audioFiles count];
        
        NSString *filename = [NSString stringWithFormat:@"%@.caf",[NSNumber numberWithFloat:count]];
        NSLog(@"------> CCCCCCCCCCCounting here , %d",[pathComponents count]);
        
        NSString *filePath = [docDir stringByAppendingPathComponent:filename];
        
        if ([filemanager fileExistsAtPath:docDir isDirectory:nil])
            NSLog(@"File does exist<--!!, %@", filename);
        else
            NSLog(@"File not found");
            NSLog(@"----> recorderFileName: %@",filename);
            NSLog(@"----> recorderFilePath <------: %@",filePath);
    
//    NSString *filePath = [docDir stringByAppendingPathComponent:filename];
//    
//    if ([filemanager fileExistsAtPath:docDir isDirectory:nil])
//        NSLog(@"File does exist<--!!, %@", filename);
//    else
//        NSLog(@"File not found");
//    
//    NSLog(@"----> recorderFileName: %@",filename);
//    NSLog(@"----> recorderFilePath <------: %@",filePath);
        [myPlayer prepareToPlay];
        
    }
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma pickerview
// sets up the pickerView with number of components to display
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}


// sets up the number of rows for the pickerView
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:           (NSInteger)component {
    return [self.audioFiles count];
}

// sets up the pickerView with titles from Parse
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row    forComponent:(NSInteger)component {
    
    return [self.audioFiles objectAtIndex:row];
    NSLog(@"audio row %@", [self.audioFiles objectAtIndex:row]);
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    selectedSound = [self.audioFiles objectAtIndex:row];
    NSLog(@"selected sound %@",selectedSound);
    
    NSLog(@"testing player %@",[self.audioFiles objectAtIndex:row]);
    [self playAudioFile:selectedSound];

    
}

-(void)playAudioFile:(NSString*)selectAudioFile{
    NSLog(@"playAudioFile ##**>>>>>");
    
    
//    NSRange range = [selectedSound rangeOfString:@"."];
//    NSString *filename = [selectedSound substringToIndex:NSMaxRange(range)-1];
//    NSString *fileExtension = [selectedSound substringFromIndex:NSMaxRange(range)];
//    
//    
//    //NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
//                                         //pathForResource:filename
//                                         //ofType:fileExtension]];
//    
//    NSURL *url = [[NSURL alloc] initFileURLWithPath: filePath];
//    NSLog(@"URL is here <---- %@", url);
//    NSError *error;
//    
//    myPlayer = [[AVAudioPlayer alloc]
//                initWithContentsOfURL:url
//                error:&error];
//    //myPlayer =  [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:_filePath] error:&error];
//    if (error)
//    {
//        NSLog(@"Error in audioPlayer: %@",
//              [error localizedDescription]);
//    } else {
//        
//        myPlayer.delegate = self;
//        [myPlayer prepareToPlay];
//        [myPlayer play];
//    }
}
@end
