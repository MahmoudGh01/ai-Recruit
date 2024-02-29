///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBTEAMLOGExternalDriveBackupEligibilityStatus;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - API Object

///
/// The `ExternalDriveBackupEligibilityStatus` union.
///
/// External Drive Backup eligibility status
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBTEAMLOGExternalDriveBackupEligibilityStatus : NSObject <DBSerializable, NSCopying>

#pragma mark - Instance fields

/// The `DBTEAMLOGExternalDriveBackupEligibilityStatusTag` enum type represents
/// the possible tag states with which the
/// `DBTEAMLOGExternalDriveBackupEligibilityStatus` union can exist.
typedef NS_CLOSED_ENUM(NSInteger, DBTEAMLOGExternalDriveBackupEligibilityStatusTag){
    /// (no description).
    DBTEAMLOGExternalDriveBackupEligibilityStatusExceedLicenseCap,

    /// (no description).
    DBTEAMLOGExternalDriveBackupEligibilityStatusSuccess,

    /// (no description).
    DBTEAMLOGExternalDriveBackupEligibilityStatusOther,

};

/// Represents the union's current tag state.
@property (nonatomic, readonly) DBTEAMLOGExternalDriveBackupEligibilityStatusTag tag;

#pragma mark - Constructors

///
/// Initializes union class with tag state of "exceed_license_cap".
///
/// @return An initialized instance.
///
- (instancetype)initWithExceedLicenseCap;

///
/// Initializes union class with tag state of "success".
///
/// @return An initialized instance.
///
- (instancetype)initWithSuccess;

///
/// Initializes union class with tag state of "other".
///
/// @return An initialized instance.
///
- (instancetype)initWithOther;

- (instancetype)init NS_UNAVAILABLE;

#pragma mark - Tag state methods

///
/// Retrieves whether the union's current tag state has value
/// "exceed_license_cap".
///
/// @return Whether the union's current tag state has value
/// "exceed_license_cap".
///
- (BOOL)isExceedLicenseCap;

///
/// Retrieves whether the union's current tag state has value "success".
///
/// @return Whether the union's current tag state has value "success".
///
- (BOOL)isSuccess;

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
/// The serialization class for the
/// `DBTEAMLOGExternalDriveBackupEligibilityStatus` union.
///
@interface DBTEAMLOGExternalDriveBackupEligibilityStatusSerializer : NSObject

///
/// Serializes `DBTEAMLOGExternalDriveBackupEligibilityStatus` instances.
///
/// @param instance An instance of the
/// `DBTEAMLOGExternalDriveBackupEligibilityStatus` API object.
///
/// @return A json-compatible dictionary representation of the
/// `DBTEAMLOGExternalDriveBackupEligibilityStatus` API object.
///
+ (nullable NSDictionary<NSString *, id> *)serialize:(DBTEAMLOGExternalDriveBackupEligibilityStatus *)instance;

///
/// Deserializes `DBTEAMLOGExternalDriveBackupEligibilityStatus` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBTEAMLOGExternalDriveBackupEligibilityStatus` API object.
///
/// @return An instantiation of the
/// `DBTEAMLOGExternalDriveBackupEligibilityStatus` object.
///
+ (DBTEAMLOGExternalDriveBackupEligibilityStatus *)deserialize:(NSDictionary<NSString *, id> *)dict;

@end

NS_ASSUME_NONNULL_END
