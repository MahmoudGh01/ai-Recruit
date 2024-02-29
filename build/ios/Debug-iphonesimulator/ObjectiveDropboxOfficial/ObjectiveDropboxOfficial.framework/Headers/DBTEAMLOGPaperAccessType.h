///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBTEAMLOGPaperAccessType;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - API Object

///
/// The `PaperAccessType` union.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBTEAMLOGPaperAccessType : NSObject <DBSerializable, NSCopying>

#pragma mark - Instance fields

/// The `DBTEAMLOGPaperAccessTypeTag` enum type represents the possible tag
/// states with which the `DBTEAMLOGPaperAccessType` union can exist.
typedef NS_CLOSED_ENUM(NSInteger, DBTEAMLOGPaperAccessTypeTag){
    /// (no description).
    DBTEAMLOGPaperAccessTypeCommenter,

    /// (no description).
    DBTEAMLOGPaperAccessTypeEditor,

    /// (no description).
    DBTEAMLOGPaperAccessTypeViewer,

    /// (no description).
    DBTEAMLOGPaperAccessTypeOther,

};

/// Represents the union's current tag state.
@property (nonatomic, readonly) DBTEAMLOGPaperAccessTypeTag tag;

#pragma mark - Constructors

///
/// Initializes union class with tag state of "commenter".
///
/// @return An initialized instance.
///
- (instancetype)initWithCommenter;

///
/// Initializes union class with tag state of "editor".
///
/// @return An initialized instance.
///
- (instancetype)initWithEditor;

///
/// Initializes union class with tag state of "viewer".
///
/// @return An initialized instance.
///
- (instancetype)initWithViewer;

///
/// Initializes union class with tag state of "other".
///
/// @return An initialized instance.
///
- (instancetype)initWithOther;

- (instancetype)init NS_UNAVAILABLE;

#pragma mark - Tag state methods

///
/// Retrieves whether the union's current tag state has value "commenter".
///
/// @return Whether the union's current tag state has value "commenter".
///
- (BOOL)isCommenter;

///
/// Retrieves whether the union's current tag state has value "editor".
///
/// @return Whether the union's current tag state has value "editor".
///
- (BOOL)isEditor;

///
/// Retrieves whether the union's current tag state has value "viewer".
///
/// @return Whether the union's current tag state has value "viewer".
///
- (BOOL)isViewer;

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
/// The serialization class for the `DBTEAMLOGPaperAccessType` union.
///
@interface DBTEAMLOGPaperAccessTypeSerializer : NSObject

///
/// Serializes `DBTEAMLOGPaperAccessType` instances.
///
/// @param instance An instance of the `DBTEAMLOGPaperAccessType` API object.
///
/// @return A json-compatible dictionary representation of the
/// `DBTEAMLOGPaperAccessType` API object.
///
+ (nullable NSDictionary<NSString *, id> *)serialize:(DBTEAMLOGPaperAccessType *)instance;

///
/// Deserializes `DBTEAMLOGPaperAccessType` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBTEAMLOGPaperAccessType` API object.
///
/// @return An instantiation of the `DBTEAMLOGPaperAccessType` object.
///
+ (DBTEAMLOGPaperAccessType *)deserialize:(NSDictionary<NSString *, id> *)dict;

@end

NS_ASSUME_NONNULL_END
