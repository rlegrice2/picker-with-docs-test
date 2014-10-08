//
//  ViewController.h
//  PickerWithDocumentsTest
//
//  Created by MacBook_RG on 9/14/14.
//  Copyright (c) 2014 Richard Grice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<AVAudioPlayerDelegate,UIPickerViewDataSource, UIPickerViewDelegate>
{
    UIPickerView *AudioPicker;
    NSArray *audioFiles;
    AVAudioPlayer *myPlayer;
    
    
}


@property (strong, nonatomic) IBOutlet UIPickerView *AudioPicker;
@property (strong,nonatomic) NSArray *audioFiles;
@property (strong, nonatomic) NSString *dirPath;
@property (strong, nonatomic) NSString *selectedSound;
@property (strong, nonatomic) NSArray *PathComponents;
@property (strong, nonatomic) NSString *docDir;
@property (strong, nonatomic) NSString *filePath;
@property (strong, nonatomic) NSString *fileName;
@property (strong, nonatomic) AVAudioPlayer *myPlayer;

-(void)playAudioFile:(NSString*)selectAudioFile;
@end
