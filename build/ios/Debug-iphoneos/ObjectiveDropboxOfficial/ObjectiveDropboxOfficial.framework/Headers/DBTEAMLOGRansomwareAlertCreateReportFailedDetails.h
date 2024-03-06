///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBTEAMLOGRansomwareAlertCreateReportFailedDetails;
@class DBTEAMTeamReportFailureReason;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - API Object

///
/// The `RansomwareAlertCreateReportFailedDetails` struct.
///
/// Couldn't generate ransomware report.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBTEAMLOGRansomwareAlertCreateReportFailedDetails : NSObject <DBSerializable, NSCopying>

#pragma mark - Instance fields

/// Failure reason.
@property (nonatomic, readonly) DBTEAMTeamReportFailureReason *failureReason;

#pragma mark - Constructors

///
/// Full constructor for the struct (exposes all instance variables).
///
/// @param failureReason Failure reason.
///
/// @return An initialized instance.
///
- (instancetype)initWithFailureReason:(DBTEAMTeamReportFailureReason *)failureReason;

- (instancetype)init NS_UNAVAILABLE;

@end

#pragma mark - Serializer Object

///
/// The serialization class for the `RansomwareAlertCreateReportFailedDetails`
/// struct.
///
@interface DBTEAMLOGRansomwareAlertCreateReportFailedDetailsSerializer : NSObject

///
/// Serializes `DBTEAMLOGRansomwareAlertCreateReportFailedDetails` instances.
///
/// @param instance An instance of the
/// `DBTEAMLOGRansomwareAlertCreateReportFailedDetails` API object.
///
/// @return A json-compatible dictionary representation of the
/// `DBTEAMLOGRansomwareAlertCreateReportFailedDetails` API object.
///
+ (nullable NSDictionary<NSString *, id> *)serialize:(DBTEAMLOGRansomwareAlertCreateReportFailedDetails *)instance;

///
/// Deserializes `DBTEAMLOGRansomwareAlertCreateReportFailedDetails` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBTEAMLOGRansomwareAlertCreateReportFailedDetails` API object.
///
/// @return An instantiation of the
/// `DBTEAMLOGRansomwareAlertCreateReportFailedDetails` object.
///
+ (DBTEAMLOGRansomwareAlertCreateReportFailedDetails *)deserialize:(NSDictionary<NSString *, id> *)dict;

@end

NS_ASSUME_NONNULL_END