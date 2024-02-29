///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBTEAMGroupFullInfo;
@class DBTEAMGroupsGetInfoItem;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - API Object

///
/// The `GroupsGetInfoItem` union.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBTEAMGroupsGetInfoItem : NSObject <DBSerializable, NSCopying>

#pragma mark - Instance fields

/// The `DBTEAMGroupsGetInfoItemTag` enum type represents the possible tag
/// states with which the `DBTEAMGroupsGetInfoItem` union can exist.
typedef NS_CLOSED_ENUM(NSInteger, DBTEAMGroupsGetInfoItemTag){
    /// An ID that was provided as a parameter to `groupsGetInfo`, and did not
    /// match a corresponding group. The ID can be a group ID, or an external
    /// ID, depending on how the method was called.
    DBTEAMGroupsGetInfoItemIdNotFound,

    /// Info about a group.
    DBTEAMGroupsGetInfoItemGroupInfo,

};

/// Represents the union's current tag state.
@property (nonatomic, readonly) DBTEAMGroupsGetInfoItemTag tag;

/// An ID that was provided as a parameter to `groupsGetInfo`, and did not match
/// a corresponding group. The ID can be a group ID, or an external ID,
/// depending on how the method was called. @note Ensure the `isIdNotFound`
/// method returns true before accessing, otherwise a runtime exception will be
/// raised.
@property (nonatomic, readonly, copy) NSString *idNotFound;

/// Info about a group. @note Ensure the `isGroupInfo` method returns true
/// before accessing, otherwise a runtime exception will be raised.
@property (nonatomic, readonly) DBTEAMGroupFullInfo *groupInfo;

#pragma mark - Constructors

///
/// Initializes union class with tag state of "id_not_found".
///
/// Description of the "id_not_found" tag state: An ID that was provided as a
/// parameter to `groupsGetInfo`, and did not match a corresponding group. The
/// ID can be a group ID, or an external ID, depending on how the method was
/// called.
///
/// @param idNotFound An ID that was provided as a parameter to `groupsGetInfo`,
/// and did not match a corresponding group. The ID can be a group ID, or an
/// external ID, depending on how the method was called.
///
/// @return An initialized instance.
///
- (instancetype)initWithIdNotFound:(NSString *)idNotFound;

///
/// Initializes union class with tag state of "group_info".
///
/// Description of the "group_info" tag state: Info about a group.
///
/// @param groupInfo Info about a group.
///
/// @return An initialized instance.
///
- (instancetype)initWithGroupInfo:(DBTEAMGroupFullInfo *)groupInfo;

- (instancetype)init NS_UNAVAILABLE;

#pragma mark - Tag state methods

///
/// Retrieves whether the union's current tag state has value "id_not_found".
///
/// @note Call this method and ensure it returns true before accessing the
/// `idNotFound` property, otherwise a runtime exception will be thrown.
///
/// @return Whether the union's current tag state has value "id_not_found".
///
- (BOOL)isIdNotFound;

///
/// Retrieves whether the union's current tag state has value "group_info".
///
/// @note Call this method and ensure it returns true before accessing the
/// `groupInfo` property, otherwise a runtime exception will be thrown.
///
/// @return Whether the union's current tag state has value "group_info".
///
- (BOOL)isGroupInfo;

///
/// Retrieves string value of union's current tag state.
///
/// @return A human-readable string representing the union's current tag state.
///
- (NSString *)tagName;

@end

#pragma mark - Serializer Object

///
/// The serialization class for the `DBTEAMGroupsGetInfoItem` union.
///
@interface DBTEAMGroupsGetInfoItemSerializer : NSObject

///
/// Serializes `DBTEAMGroupsGetInfoItem` instances.
///
/// @param instance An instance of the `DBTEAMGroupsGetInfoItem` API object.
///
/// @return A json-compatible dictionary representation of the
/// `DBTEAMGroupsGetInfoItem` API object.
///
+ (nullable NSDictionary<NSString *, id> *)serialize:(DBTEAMGroupsGetInfoItem *)instance;

///
/// Deserializes `DBTEAMGroupsGetInfoItem` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBTEAMGroupsGetInfoItem` API object.
///
/// @return An instantiation of the `DBTEAMGroupsGetInfoItem` object.
///
+ (DBTEAMGroupsGetInfoItem *)deserialize:(NSDictionary<NSString *, id> *)dict;

@end

NS_ASSUME_NONNULL_END
