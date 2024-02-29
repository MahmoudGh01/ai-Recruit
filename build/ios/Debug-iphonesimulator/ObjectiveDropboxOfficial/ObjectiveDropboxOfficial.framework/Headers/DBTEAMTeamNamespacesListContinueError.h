///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBTEAMTeamNamespacesListContinueError;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - API Object

///
/// The `TeamNamespacesListContinueError` union.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBTEAMTeamNamespacesListContinueError : NSObject <DBSerializable, NSCopying>

#pragma mark - Instance fields

/// The `DBTEAMTeamNamespacesListContinueErrorTag` enum type represents the
/// possible tag states with which the `DBTEAMTeamNamespacesListContinueError`
/// union can exist.
typedef NS_CLOSED_ENUM(NSInteger, DBTEAMTeamNamespacesListContinueErrorTag){
    /// Argument passed in is invalid.
    DBTEAMTeamNamespacesListContinueErrorInvalidArg,

    /// (no description).
    DBTEAMTeamNamespacesListContinueErrorOther,

    /// The cursor is invalid.
    DBTEAMTeamNamespacesListContinueErrorInvalidCursor,

};

/// Represents the union's current tag state.
@property (nonatomic, readonly) DBTEAMTeamNamespacesListContinueErrorTag tag;

#pragma mark - Constructors

///
/// Initializes union class with tag state of "invalid_arg".
///
/// Description of the "invalid_arg" tag state: Argument passed in is invalid.
///
/// @return An initialized instance.
///
- (instancetype)initWithInvalidArg;

///
/// Initializes union class with tag state of "other".
///
/// @return An initialized instance.
///
- (instancetype)initWithOther;

///
/// Initializes union class with tag state of "invalid_cursor".
///
/// Description of the "invalid_cursor" tag state: The cursor is invalid.
///
/// @return An initialized instance.
///
- (instancetype)initWithInvalidCursor;

- (instancetype)init NS_UNAVAILABLE;

#pragma mark - Tag state methods

///
/// Retrieves whether the union's current tag state has value "invalid_arg".
///
/// @return Whether the union's current tag state has value "invalid_arg".
///
- (BOOL)isInvalidArg;

///
/// Retrieves whether the union's current tag state has value "other".
///
/// @return Whether the union's current tag state has value "other".
///
- (BOOL)isOther;

///
/// Retrieves whether the union's current tag state has value "invalid_cursor".
///
/// @return Whether the union's current tag state has value "invalid_cursor".
///
- (BOOL)isInvalidCursor;

///
/// Retrieves string value of union's current tag state.
///
/// @return A human-readable string representing the union's current tag state.
///
- (NSString *)tagName;

@end

#pragma mark - Serializer Object

///
/// The serialization class for the `DBTEAMTeamNamespacesListContinueError`
/// union.
///
@interface DBTEAMTeamNamespacesListContinueErrorSerializer : NSObject

///
/// Serializes `DBTEAMTeamNamespacesListContinueError` instances.
///
/// @param instance An instance of the `DBTEAMTeamNamespacesListContinueError`
/// API object.
///
/// @return A json-compatible dictionary representation of the
/// `DBTEAMTeamNamespacesListContinueError` API object.
///
+ (nullable NSDictionary<NSString *, id> *)serialize:(DBTEAMTeamNamespacesListContinueError *)instance;

///
/// Deserializes `DBTEAMTeamNamespacesListContinueError` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBTEAMTeamNamespacesListContinueError` API object.
///
/// @return An instantiation of the `DBTEAMTeamNamespacesListContinueError`
/// object.
///
+ (DBTEAMTeamNamespacesListContinueError *)deserialize:(NSDictionary<NSString *, id> *)dict;

@end

NS_ASSUME_NONNULL_END
