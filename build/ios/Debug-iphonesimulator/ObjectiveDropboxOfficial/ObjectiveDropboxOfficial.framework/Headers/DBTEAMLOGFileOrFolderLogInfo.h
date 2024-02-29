///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBTEAMLOGFileOrFolderLogInfo;
@class DBTEAMLOGPathLogInfo;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - API Object

///
/// The `FileOrFolderLogInfo` struct.
///
/// Generic information relevant both for files and folders
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBTEAMLOGFileOrFolderLogInfo : NSObject <DBSerializable, NSCopying>

#pragma mark - Instance fields

/// Path relative to event context.
@property (nonatomic, readonly) DBTEAMLOGPathLogInfo *path;

/// Display name.
@property (nonatomic, readonly, copy, nullable) NSString *displayName;

/// Unique ID.
@property (nonatomic, readonly, copy, nullable) NSString *fileId;

/// File or folder size in bytes.
@property (nonatomic, readonly, nullable) NSNumber *fileSize;

#pragma mark - Constructors

///
/// Full constructor for the struct (exposes all instance variables).
///
/// @param path Path relative to event context.
/// @param displayName Display name.
/// @param fileId Unique ID.
/// @param fileSize File or folder size in bytes.
///
/// @return An initialized instance.
///
- (instancetype)initWithPath:(DBTEAMLOGPathLogInfo *)path
                 displayName:(nullable NSString *)displayName
                      fileId:(nullable NSString *)fileId
                    fileSize:(nullable NSNumber *)fileSize;

///
/// Convenience constructor (exposes only non-nullable instance variables with
/// no default value).
///
/// @param path Path relative to event context.
///
/// @return An initialized instance.
///
- (instancetype)initWithPath:(DBTEAMLOGPathLogInfo *)path;

- (instancetype)init NS_UNAVAILABLE;

@end

#pragma mark - Serializer Object

///
/// The serialization class for the `FileOrFolderLogInfo` struct.
///
@interface DBTEAMLOGFileOrFolderLogInfoSerializer : NSObject

///
/// Serializes `DBTEAMLOGFileOrFolderLogInfo` instances.
///
/// @param instance An instance of the `DBTEAMLOGFileOrFolderLogInfo` API
/// object.
///
/// @return A json-compatible dictionary representation of the
/// `DBTEAMLOGFileOrFolderLogInfo` API object.
///
+ (nullable NSDictionary<NSString *, id> *)serialize:(DBTEAMLOGFileOrFolderLogInfo *)instance;

///
/// Deserializes `DBTEAMLOGFileOrFolderLogInfo` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBTEAMLOGFileOrFolderLogInfo` API object.
///
/// @return An instantiation of the `DBTEAMLOGFileOrFolderLogInfo` object.
///
+ (DBTEAMLOGFileOrFolderLogInfo *)deserialize:(NSDictionary<NSString *, id> *)dict;

@end

NS_ASSUME_NONNULL_END
