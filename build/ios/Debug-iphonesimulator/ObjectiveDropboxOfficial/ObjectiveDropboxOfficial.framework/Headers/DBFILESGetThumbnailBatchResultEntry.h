///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBFILESGetThumbnailBatchResultData;
@class DBFILESGetThumbnailBatchResultEntry;
@class DBFILESThumbnailError;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - API Object

///
/// The `GetThumbnailBatchResultEntry` union.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBFILESGetThumbnailBatchResultEntry : NSObject <DBSerializable, NSCopying>

#pragma mark - Instance fields

/// The `DBFILESGetThumbnailBatchResultEntryTag` enum type represents the
/// possible tag states with which the `DBFILESGetThumbnailBatchResultEntry`
/// union can exist.
typedef NS_CLOSED_ENUM(NSInteger, DBFILESGetThumbnailBatchResultEntryTag){
    /// (no description).
    DBFILESGetThumbnailBatchResultEntrySuccess,

    /// The result for this file if it was an error.
    DBFILESGetThumbnailBatchResultEntryFailure,

    /// (no description).
    DBFILESGetThumbnailBatchResultEntryOther,

};

/// Represents the union's current tag state.
@property (nonatomic, readonly) DBFILESGetThumbnailBatchResultEntryTag tag;

/// (no description). @note Ensure the `isSuccess` method returns true before
/// accessing, otherwise a runtime exception will be raised.
@property (nonatomic, readonly) DBFILESGetThumbnailBatchResultData *success;

/// The result for this file if it was an error. @note Ensure the `isFailure`
/// method returns true before accessing, otherwise a runtime exception will be
/// raised.
@property (nonatomic, readonly) DBFILESThumbnailError *failure;

#pragma mark - Constructors

///
/// Initializes union class with tag state of "success".
///
/// @param success (no description).
///
/// @return An initialized instance.
///
- (instancetype)initWithSuccess:(DBFILESGetThumbnailBatchResultData *)success;

///
/// Initializes union class with tag state of "failure".
///
/// Description of the "failure" tag state: The result for this file if it was
/// an error.
///
/// @param failure The result for this file if it was an error.
///
/// @return An initialized instance.
///
- (instancetype)initWithFailure:(DBFILESThumbnailError *)failure;

///
/// Initializes union class with tag state of "other".
///
/// @return An initialized instance.
///
- (instancetype)initWithOther;

- (instancetype)init NS_UNAVAILABLE;

#pragma mark - Tag state methods

///
/// Retrieves whether the union's current tag state has value "success".
///
/// @note Call this method and ensure it returns true before accessing the
/// `success` property, otherwise a runtime exception will be thrown.
///
/// @return Whether the union's current tag state has value "success".
///
- (BOOL)isSuccess;

///
/// Retrieves whether the union's current tag state has value "failure".
///
/// @note Call this method and ensure it returns true before accessing the
/// `failure` property, otherwise a runtime exception will be thrown.
///
/// @return Whether the union's current tag state has value "failure".
///
- (BOOL)isFailure;

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
/// The serialization class for the `DBFILESGetThumbnailBatchResultEntry` union.
///
@interface DBFILESGetThumbnailBatchResultEntrySerializer : NSObject

///
/// Serializes `DBFILESGetThumbnailBatchResultEntry` instances.
///
/// @param instance An instance of the `DBFILESGetThumbnailBatchResultEntry` API
/// object.
///
/// @return A json-compatible dictionary representation of the
/// `DBFILESGetThumbnailBatchResultEntry` API object.
///
+ (nullable NSDictionary<NSString *, id> *)serialize:(DBFILESGetThumbnailBatchResultEntry *)instance;

///
/// Deserializes `DBFILESGetThumbnailBatchResultEntry` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBFILESGetThumbnailBatchResultEntry` API object.
///
/// @return An instantiation of the `DBFILESGetThumbnailBatchResultEntry`
/// object.
///
+ (DBFILESGetThumbnailBatchResultEntry *)deserialize:(NSDictionary<NSString *, id> *)dict;

@end

NS_ASSUME_NONNULL_END