//
//  MotionSimulator.h
//  IOSSpreoSDKDual
//
//  Created by Vladislav Pavlenko on 06.08.2020.
//  Copyright © 2020 Spreo LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>
#import "Motion.h"

@protocol MotionSimulatorDelegate <NSObject>

- (void)updateMotion:(CMAcceleration)acceleration;

@end



@interface MotionSimulator : NSObject

@property (nonatomic, weak)id<MotionSimulatorDelegate> delegate;

@property (nonatomic, strong) NSString *filePath;
@property (nonatomic, strong) NSURL *importFilePathURL;

@property (nonatomic, assign) BOOL isLogging;
@property (nonatomic, assign) BOOL isSimulating;

+ (instancetype)shared;

- (void)startLogging;
- (void)stopLogging;
- (void)updateMotionWithAcceleration:(CMAcceleration)acceleration;

- (void)printLogFileContent;
- (void)clearLogFile;

- (void)startSimulation;
- (void)stopSimulation;

@end
