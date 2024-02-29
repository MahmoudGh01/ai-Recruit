///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBTEAMDateRange;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - API Object

///
/// The `DateRange` struct.
///
/// Input arguments that can be provided for most reports.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBTEAMDateRange : NSObject <DBSerializable, NSCopying>

#pragma mark - Instance fields

/// Optional starting date (inclusive). If start_date is None or too long ago,
/// this field will  be set to 6 months ago.
@property (nonatomic, readonly, nullable) NSDate *startDate;

/// Optional ending date (exclusive).
@property (nonatomic, readonly, nullable) NSDate *endDate;

#pragma mark - Constructors

///
/// Full constructor for the struct (exposes all instance variables).
///
/// @param startDate Optional starting date (inclusive). If start_date is None
/// or too long ago, this field will  be set to 6 months ago.
/// @param endDate Optional ending date (exclusive).
///
/// @return An initialized instance.
///
- (instancetype)initWithStartDate:(nullable NSDate *)startDate endDate:(nullable NSDate *)endDate;

///
/// Convenience constructor (exposes only non-nullable instance variables with
/// no default value).
///
///
/// @return An initialized instance.
///
- (instancetype)initDefault;

- (instancetype)init NS_UNAVAILABLE;

@end

#pragma mark - Serializer Object

///
/// The serialization class for the `DateRange` struct.
///
@interface DBTEAMDateRangeSerializer : NSObject

///
/// Serializes `DBTEAMDateRange` instances.
///
/// @param instance An instance of the `DBTEAMDateRange` API object.
///
/// @return A json-compatible dictionary representation of the `DBTEAMDateRange`
/// API object.
///
+ (nullable NSDictionary<NSString *, id> *)serialize:(DBTEAMDateRange *)instance;

///
/// Deserializes `DBTEAMDateRange` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBTEAMDateRange` API object.
///
/// @return An instantiation of the `DBTEAMDateRange` object.
///
+ (DBTEAMDateRange *)deserialize:(NSDictionary<NSString *, id> *)dict;

@end

NS_ASSUME_NONNULL_END