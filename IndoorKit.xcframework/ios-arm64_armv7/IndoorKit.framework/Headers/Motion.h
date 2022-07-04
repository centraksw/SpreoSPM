//
//  Motion.h
//  IOSSpreoSDKDual
//
//  Created by Vladislav Pavlenko on 06.08.2020.
//  Copyright © 2020 Spreo LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>

@interface Motion: NSObject

@property (nonatomic, assign) double x;
@property (nonatomic, assign) double y;
@property (nonatomic, assign) double z;
@property (nonatomic, assign) NSTimeInterval timestamp;

- (instancetype)init:(double)x y:(double)y z:(double)z timestamp:(NSTimeInterval)timestamp;

- (CMAcceleration)convert;

@end
