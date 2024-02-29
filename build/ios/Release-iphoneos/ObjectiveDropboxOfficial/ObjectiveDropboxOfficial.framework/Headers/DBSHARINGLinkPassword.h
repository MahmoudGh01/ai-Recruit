///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBSHARINGLinkPassword;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - API Object

///
/// The `LinkPassword` union.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBSHARINGLinkPassword : NSObject <DBSerializable, NSCopying>

#pragma mark - Instance fields

/// The `DBSHARINGLinkPasswordTag` enum type represents the possible tag states
/// with which the `DBSHARINGLinkPassword` union can exist.
typedef NS_CLOSED_ENUM(NSInteger, DBSHARINGLinkPasswordTag){
    /// Remove the currently set password for the link.
    DBSHARINGLinkPasswordRemovePassword,

    /// Set a new password or change an existing password.
    DBSHARINGLinkPasswordSetPassword,

    /// (no description).
    DBSHARINGLinkPasswordOther,

};

/// Represents the union's current tag state.
@property (nonatomic, readonly) DBSHARINGLinkPasswordTag tag;

/// Set a new password or change an existing password. @note Ensure the
/// `isSetPassword` method returns true before accessing, otherwise a runtime
/// exception will be raised.
@property (nonatomic, readonly, copy) NSString *setPassword;

#pragma mark - Constructors

///
/// Initializes union class with tag state of "remove_password".
///
/// Description of the "remove_password" tag state: Remove the currently set
/// password for the link.
///
/// @return An initialized instance.
///
- (instancetype)initWithRemovePassword;

///
/// Initializes union class with tag state of "set_password".
///
/// Description of the "set_password" tag state: Set a new password or change an
/// existing password.
///
/// @param setPassword Set a new password or change an existing password.
///
/// @return An initialized instance.
///
- (instancetype)initWithSetPassword:(NSString *)setPassword;

///
/// Initializes union class with tag state of "other".
///
/// @return An initialized instance.
///
- (instancetype)initWithOther;

- (instancetype)init NS_UNAVAILABLE;

#pragma mark - Tag state methods

///
/// Retrieves whether the union's current tag state has value "remove_password".
///
/// @return Whether the union's current tag state has value "remove_password".
///
- (BOOL)isRemovePassword;

///
/// Retrieves whether the union's current tag state has value "set_password".
///
/// @note Call this method and ensure it returns true before accessing the
/// `setPassword` property, otherwise a runtime exception will be thrown.
///
/// @return Whether the union's current tag state has value "set_password".
///
- (BOOL)isSetPassword;

///
/// Retrieves whether the union's current tag state has value "other".
///
/// @return Whether the union's current tag state has value "other".
///
- (BOOL)isOther;

///
/// Retrieves string value of union's current tag state.
///
/// @return A human-readable string representing the union's current tag state.
///
- (NSString *)tagName;

@end

#pragma mark - Serializer Object

///
/// The serialization class for the `DBSHARINGLinkPassword` union.
///
@interface DBSHARINGLinkPasswordSerializer : NSObject

///
/// Serializes `DBSHARINGLinkPassword` instances.
///
/// @param instance An instance of the `DBSHARINGLinkPassword` API object.
///
/// @return A json-compatible dictionary representation of the
/// `DBSHARINGLinkPassword` API object.
///
+ (nullable NSDictionary<NSString *, id> *)serialize:(DBSHARINGLinkPassword *)instance;

///
/// Deserializes `DBSHARINGLinkPassword` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBSHARINGLinkPassword` API object.
///
/// @return An instantiation of the `DBSHARINGLinkPassword` object.
///
+ (DBSHARINGLinkPassword *)deserialize:(NSDictionary<NSString *, id> *)dict;

@end

NS_ASSUME_NONNULL_END