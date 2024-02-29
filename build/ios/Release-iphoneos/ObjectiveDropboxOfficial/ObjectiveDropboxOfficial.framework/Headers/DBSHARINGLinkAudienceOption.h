///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBSHARINGLinkAudience;
@class DBSHARINGLinkAudienceDisallowedReason;
@class DBSHARINGLinkAudienceOption;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - API Object

///
/// The `LinkAudienceOption` struct.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBSHARINGLinkAudienceOption : NSObject <DBSerializable, NSCopying>

#pragma mark - Instance fields

/// Specifies who can access the link.
@property (nonatomic, readonly) DBSHARINGLinkAudience *audience;

/// Whether the user calling this API can select this audience option.
@property (nonatomic, readonly) NSNumber *allowed;

/// If allowed is false, this will provide the reason that the user is not
/// permitted to set the visibility to this policy.
@property (nonatomic, readonly, nullable) DBSHARINGLinkAudienceDisallowedReason *disallowedReason;

#pragma mark - Constructors

///
/// Full constructor for the struct (exposes all instance variables).
///
/// @param audience Specifies who can access the link.
/// @param allowed Whether the user calling this API can select this audience
/// option.
/// @param disallowedReason If allowed is false, this will provide the reason
/// that the user is not permitted to set the visibility to this policy.
///
/// @return An initialized instance.
///
- (instancetype)initWithAudience:(DBSHARINGLinkAudience *)audience
                         allowed:(NSNumber *)allowed
                disallowedReason:(nullable DBSHARINGLinkAudienceDisallowedReason *)disallowedReason;

///
/// Convenience constructor (exposes only non-nullable instance variables with
/// no default value).
///
/// @param audience Specifies who can access the link.
/// @param allowed Whether the user calling this API can select this audience
/// option.
///
/// @return An initialized instance.
///
- (instancetype)initWithAudience:(DBSHARINGLinkAudience *)audience allowed:(NSNumber *)allowed;

- (instancetype)init NS_UNAVAILABLE;

@end

#pragma mark - Serializer Object

///
/// The serialization class for the `LinkAudienceOption` struct.
///
@interface DBSHARINGLinkAudienceOptionSerializer : NSObject

///
/// Serializes `DBSHARINGLinkAudienceOption` instances.
///
/// @param instance An instance of the `DBSHARINGLinkAudienceOption` API object.
///
/// @return A json-compatible dictionary representation of the
/// `DBSHARINGLinkAudienceOption` API object.
///
+ (nullable NSDictionary<NSString *, id> *)serialize:(DBSHARINGLinkAudienceOption *)instance;

///
/// Deserializes `DBSHARINGLinkAudienceOption` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBSHARINGLinkAudienceOption` API object.
///
/// @return An instantiation of the `DBSHARINGLinkAudienceOption` object.
///
+ (DBSHARINGLinkAudienceOption *)deserialize:(NSDictionary<NSString *, id> *)dict;

@end

NS_ASSUME_NONNULL_END