///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBFILESSearchV2ContinueArg;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - API Object

///
/// The `SearchV2ContinueArg` struct.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBFILESSearchV2ContinueArg : NSObject <DBSerializable, NSCopying>

#pragma mark - Instance fields

/// The cursor returned by your last call to `search`. Used to fetch the next
/// page of results.
@property (nonatomic, readonly, copy) NSString *cursor;

#pragma mark - Constructors

///
/// Full constructor for the struct (exposes all instance variables).
///
/// @param cursor The cursor returned by your last call to `search`. Used to
/// fetch the next page of results.
///
/// @return An initialized instance.
///
- (instancetype)initWithCursor:(NSString *)cursor;

- (instancetype)init NS_UNAVAILABLE;

@end

#pragma mark - Serializer Object

///
/// The serialization class for the `SearchV2ContinueArg` struct.
///
@interface DBFILESSearchV2ContinueArgSerializer : NSObject

///
/// Serializes `DBFILESSearchV2ContinueArg` instances.
///
/// @param instance An instance of the `DBFILESSearchV2ContinueArg` API object.
///
/// @return A json-compatible dictionary representation of the
/// `DBFILESSearchV2ContinueArg` API object.
///
+ (nullable NSDictionary<NSString *, id> *)serialize:(DBFILESSearchV2ContinueArg *)instance;

///
/// Deserializes `DBFILESSearchV2ContinueArg` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBFILESSearchV2ContinueArg` API object.
///
/// @return An instantiation of the `DBFILESSearchV2ContinueArg` object.
///
+ (DBFILESSearchV2ContinueArg *)deserialize:(NSDictionary<NSString *, id> *)dict;

@end

NS_ASSUME_NONNULL_END