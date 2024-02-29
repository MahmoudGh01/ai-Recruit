///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBPAPERDocSubscriptionLevel;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - API Object

///
/// The `DocSubscriptionLevel` union.
///
/// The subscription level of a Paper doc.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBPAPERDocSubscriptionLevel : NSObject <DBSerializable, NSCopying>

#pragma mark - Instance fields

/// The `DBPAPERDocSubscriptionLevelTag` enum type represents the possible tag
/// states with which the `DBPAPERDocSubscriptionLevel` union can exist.
typedef NS_CLOSED_ENUM(NSInteger, DBPAPERDocSubscriptionLevelTag){
    /// No change email messages unless you're the creator.
    DBPAPERDocSubscriptionLevelDefault_,

    /// Ignored: Not shown in pad lists or activity and no email message is
    /// sent.
    DBPAPERDocSubscriptionLevelIgnore,

    /// Subscribed: Shown in pad lists and activity and change email messages
    /// are sent.
    DBPAPERDocSubscriptionLevelEvery,

    /// Unsubscribed: Shown in pad lists, but not in activity and no change
    /// email messages are sent.
    DBPAPERDocSubscriptionLevelNoEmail,

};

/// Represents the union's current tag state.
@property (nonatomic, readonly) DBPAPERDocSubscriptionLevelTag tag;

#pragma mark - Constructors

///
/// Initializes union class with tag state of "default".
///
/// Description of the "default" tag state: No change email messages unless
/// you're the creator.
///
/// @return An initialized instance.
///
- (instancetype)initWithDefault_;

///
/// Initializes union class with tag state of "ignore".
///
/// Description of the "ignore" tag state: Ignored: Not shown in pad lists or
/// activity and no email message is sent.
///
/// @return An initialized instance.
///
- (instancetype)initWithIgnore;

///
/// Initializes union class with tag state of "every".
///
/// Description of the "every" tag state: Subscribed: Shown in pad lists and
/// activity and change email messages are sent.
///
/// @return An initialized instance.
///
- (instancetype)initWithEvery;

///
/// Initializes union class with tag state of "no_email".
///
/// Description of the "no_email" tag state: Unsubscribed: Shown in pad lists,
/// but not in activity and no change email messages are sent.
///
/// @return An initialized instance.
///
- (instancetype)initWithNoEmail;

- (instancetype)init NS_UNAVAILABLE;

#pragma mark - Tag state methods

///
/// Retrieves whether the union's current tag state has value "default".
///
/// @return Whether the union's current tag state has value "default".
///
- (BOOL)isDefault_;

///
/// Retrieves whether the union's current tag state has value "ignore".
///
/// @return Whether the union's current tag state has value "ignore".
///
- (BOOL)isIgnore;

///
/// Retrieves whether the union's current tag state has value "every".
///
/// @return Whether the union's current tag state has value "every".
///
- (BOOL)isEvery;

///
/// Retrieves whether the union's current tag state has value "no_email".
///
/// @return Whether the union's current tag state has value "no_email".
///
- (BOOL)isNoEmail;

///
/// Retrieves string value of union's current tag state.
///
/// @return A human-readable string representing the union's current tag state.
///
- (NSString *)tagName;

@end

#pragma mark - Serializer Object

///
/// The serialization class for the `DBPAPERDocSubscriptionLevel` union.
///
@interface DBPAPERDocSubscriptionLevelSerializer : NSObject

///
/// Serializes `DBPAPERDocSubscriptionLevel` instances.
///
/// @param instance An instance of the `DBPAPERDocSubscriptionLevel` API object.
///
/// @return A json-compatible dictionary representation of the
/// `DBPAPERDocSubscriptionLevel` API object.
///
+ (nullable NSDictionary<NSString *, id> *)serialize:(DBPAPERDocSubscriptionLevel *)instance;

///
/// Deserializes `DBPAPERDocSubscriptionLevel` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBPAPERDocSubscriptionLevel` API object.
///
/// @return An instantiation of the `DBPAPERDocSubscriptionLevel` object.
///
+ (DBPAPERDocSubscriptionLevel *)deserialize:(NSDictionary<NSString *, id> *)dict;

@end

NS_ASSUME_NONNULL_END