///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBTEAMSharingAllowlistRemoveResponse;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - API Object

///
/// The `SharingAllowlistRemoveResponse` struct.
///
/// This struct is empty. The comment here is intentionally emitted to avoid
/// indentation issues with Stone.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBTEAMSharingAllowlistRemoveResponse : NSObject <DBSerializable, NSCopying>

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
/// The serialization class for the `SharingAllowlistRemoveResponse` struct.
///
@interface DBTEAMSharingAllowlistRemoveResponseSerializer : NSObject

///
/// Serializes `DBTEAMSharingAllowlistRemoveResponse` instances.
///
/// @param instance An instance of the `DBTEAMSharingAllowlistRemoveResponse`
/// API object.
///
/// @return A json-compatible dictionary representation of the
/// `DBTEAMSharingAllowlistRemoveResponse` API object.
///
+ (nullable NSDictionary<NSString *, id> *)serialize:(DBTEAMSharingAllowlistRemoveResponse *)instance;

///
/// Deserializes `DBTEAMSharingAllowlistRemoveResponse` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBTEAMSharingAllowlistRemoveResponse` API object.
///
/// @return An instantiation of the `DBTEAMSharingAllowlistRemoveResponse`
/// object.
///
+ (DBTEAMSharingAllowlistRemoveResponse *)deserialize:(NSDictionary<NSString *, id> *)dict;

@end

NS_ASSUME_NONNULL_END
