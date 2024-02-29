///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBTEAMLOGRansomwareAlertCreateReportDetails;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - API Object

///
/// The `RansomwareAlertCreateReportDetails` struct.
///
/// Created ransomware report.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBTEAMLOGRansomwareAlertCreateReportDetails : NSObject <DBSerializable, NSCopying>

#pragma mark - Instance fields

#pragma mark - Constructors

///
/// Full constructor for the struct (exposes all instance variables).
///
/// @return An initialized instance.
///
- (instancetype)initDefault;

- (instancetype)init NS_UNAVAILABLE;

@end

#pragma mark - Serializer Object

///
/// The serialization class for the `RansomwareAlertCreateReportDetails` struct.
///
@interface DBTEAMLOGRansomwareAlertCreateReportDetailsSerializer : NSObject

///
/// Serializes `DBTEAMLOGRansomwareAlertCreateReportDetails` instances.
///
/// @param instance An instance of the
/// `DBTEAMLOGRansomwareAlertCreateReportDetails` API object.
///
/// @return A json-compatible dictionary representation of the
/// `DBTEAMLOGRansomwareAlertCreateReportDetails` API object.
///
+ (nullable NSDictionary<NSString *, id> *)serialize:(DBTEAMLOGRansomwareAlertCreateReportDetails *)instance;

///
/// Deserializes `DBTEAMLOGRansomwareAlertCreateReportDetails` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBTEAMLOGRansomwareAlertCreateReportDetails` API object.
///
/// @return An instantiation of the
/// `DBTEAMLOGRansomwareAlertCreateReportDetails` object.
///
+ (DBTEAMLOGRansomwareAlertCreateReportDetails *)deserialize:(NSDictionary<NSString *, id> *)dict;

@end

NS_ASSUME_NONNULL_END
