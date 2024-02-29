///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBACCOUNTPhotoSourceArg;
@class DBTEAMMembersSetProfilePhotoArg;
@class DBTEAMUserSelectorArg;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - API Object

///
/// The `MembersSetProfilePhotoArg` struct.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBTEAMMembersSetProfilePhotoArg : NSObject <DBSerializable, NSCopying>

#pragma mark - Instance fields

/// Identity of the user whose profile photo will be set.
@property (nonatomic, readonly) DBTEAMUserSelectorArg *user;

/// Image to set as the member's new profile photo.
@property (nonatomic, readonly) DBACCOUNTPhotoSourceArg *photo;

#pragma mark - Constructors

///
/// Full constructor for the struct (exposes all instance variables).
///
/// @param user Identity of the user whose profile photo will be set.
/// @param photo Image to set as the member's new profile photo.
///
/// @return An initialized instance.
///
- (instancetype)initWithUser:(DBTEAMUserSelectorArg *)user photo:(DBACCOUNTPhotoSourceArg *)photo;

- (instancetype)init NS_UNAVAILABLE;

@end

#pragma mark - Serializer Object

///
/// The serialization class for the `MembersSetProfilePhotoArg` struct.
///
@interface DBTEAMMembersSetProfilePhotoArgSerializer : NSObject

///
/// Serializes `DBTEAMMembersSetProfilePhotoArg` instances.
///
/// @param instance An instance of the `DBTEAMMembersSetProfilePhotoArg` API
/// object.
///
/// @return A json-compatible dictionary representation of the
/// `DBTEAMMembersSetProfilePhotoArg` API object.
///
+ (nullable NSDictionary<NSString *, id> *)serialize:(DBTEAMMembersSetProfilePhotoArg *)instance;

///
/// Deserializes `DBTEAMMembersSetProfilePhotoArg` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBTEAMMembersSetProfilePhotoArg` API object.
///
/// @return An instantiation of the `DBTEAMMembersSetProfilePhotoArg` object.
///
+ (DBTEAMMembersSetProfilePhotoArg *)deserialize:(NSDictionary<NSString *, id> *)dict;

@end

NS_ASSUME_NONNULL_END
