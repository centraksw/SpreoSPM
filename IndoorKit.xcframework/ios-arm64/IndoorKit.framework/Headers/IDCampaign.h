//
//  IDCampaign.h
//  IndoorKit
//
//  Created by Alexander Lozovoy on 07.12.2022.
//  Copyright © 2022 Spreo LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IDCampaignsResponse;
@class IDCampaign;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface IDCampaignsResponse : NSObject
@property (nonatomic, copy) NSArray<IDCampaign *> *campaigns;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface IDCampaign : NSObject
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, copy)   NSString *text;
@property (nonatomic, copy)   NSString *actionURL;
@property (nonatomic, copy)   NSString *action;
@property (nonatomic, copy)   NSArray<NSString *> *triggersList;
@property (nonatomic, copy)   NSString *lastUpdated;
@property (nonatomic, copy)   NSString *cid;
@property (nonatomic, copy)   NSString *fid;
-(IDRegionEventType)regionEventType;
@end

NS_ASSUME_NONNULL_END
