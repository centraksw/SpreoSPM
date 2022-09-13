//
//  BeaconSimulator.h
//  IOSSpreoSDKDual
//
//  Created by Vladislav Pavlenko on 06.08.2020.
//  Copyright © 2020 Spreo LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IndoorNavigationAtoms.h"

@protocol BeaconSimulatorDelegate <NSObject>

- (void)detectedBeacon:(BlipRF *)beacon;

@end



@interface BeaconSimulator : NSObject

@property (nonatomic, weak)id<BeaconSimulatorDelegate> delegate;

@property (nonatomic, strong) NSString *filePath;
@property (nonatomic, strong) NSURL *importFilePathURL;

@property (nonatomic, assign) BOOL isLogging;
@property (nonatomic, assign) BOOL isSimulating;

+ (instancetype)shared;

- (void)startLogging;
- (void)stopLogging;

- (void)didDetectBeacon:(BlipRF *)beacon;

- (void)printLogFileContent;
- (void)clearLogFile;

- (void)startSimulation;
- (void)stopSimulation;

@end
