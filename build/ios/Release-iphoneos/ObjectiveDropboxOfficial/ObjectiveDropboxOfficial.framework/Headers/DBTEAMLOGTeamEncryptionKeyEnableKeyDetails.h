///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBTEAMLOGTeamEncryptionKeyEnableKeyDetails;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - API Object

///
/// The `TeamEncryptionKeyEnableKeyDetails` struct.
///
/// Enabled team encryption key.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBTEAMLOGTeamEncryptionKeyEnableKeyDetails : NSObject <DBSerializable, NSCopying>

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
/// The serialization class for the `TeamEncryptionKeyEnableKeyDetails` struct.
///
@interface DBTEAMLOGTeamEncryptionKeyEnableKeyDetailsSerializer : NSObject

///
/// Serializes `DBTEAMLOGTeamEncryptionKeyEnableKeyDetails` instances.
///
/// @param instance An instance of the
/// `DBTEAMLOGTeamEncryptionKeyEnableKeyDetails` API object.
///
/// @return A json-compatible dictionary representation of the
/// `DBTEAMLOGTeamEncryptionKeyEnableKeyDetails` API object.
///
+ (nullable NSDictionary<NSString *, id> *)serialize:(DBTEAMLOGTeamEncryptionKeyEnableKeyDetails *)instance;

///
/// Deserializes `DBTEAMLOGTeamEncryptionKeyEnableKeyDetails` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBTEAMLOGTeamEncryptionKeyEnableKeyDetails` API object.
///
/// @return An instantiation of the `DBTEAMLOGTeamEncryptionKeyEnableKeyDetails`
/// object.
///
+ (DBTEAMLOGTeamEncryptionKeyEnableKeyDetails *)deserialize:(NSDictionary<NSString *, id> *)dict;

@end

NS_ASSUME_NONNULL_END