// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: UserAuthorization.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
private struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

public struct UserAuthorizationProto {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var userID: String {
    get { _userID ?? String() }
    set { _userID = newValue }
  }
  /// Returns true if `userID` has been explicitly set.
  public var hasUserID: Bool { self._userID != nil }
  /// Clears the value of `userID`. Subsequent reads from it will return its default value.
  public mutating func clearUserID() { self._userID = nil }

  public var accessToken: String {
    get { _accessToken ?? String() }
    set { _accessToken = newValue }
  }
  /// Returns true if `accessToken` has been explicitly set.
  public var hasAccessToken: Bool { self._accessToken != nil }
  /// Clears the value of `accessToken`. Subsequent reads from it will return its default value.
  public mutating func clearAccessToken() { self._accessToken = nil }

  public var role: UserRole {
    get { _role ?? .user }
    set { _role = newValue }
  }
  /// Returns true if `role` has been explicitly set.
  public var hasRole: Bool { self._role != nil }
  /// Clears the value of `role`. Subsequent reads from it will return its default value.
  public mutating func clearRole() { self._role = nil }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _userID: String?
  fileprivate var _accessToken: String?
  fileprivate var _role: UserRole?
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension UserAuthorizationProto: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = "UserAuthorizationProto"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "userID"),
    2: .same(proto: "accessToken"),
    4: .same(proto: "role"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self._userID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self._accessToken) }()
      case 4: try { try decoder.decodeSingularEnumField(value: &self._role) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._userID {
      try visitor.visitSingularStringField(value: v, fieldNumber: 1)
    }
    if let v = self._accessToken {
      try visitor.visitSingularStringField(value: v, fieldNumber: 2)
    }
    if let v = self._role {
      try visitor.visitSingularEnumField(value: v, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: UserAuthorizationProto, rhs: UserAuthorizationProto) -> Bool {
    if lhs._userID != rhs._userID { return false }
    if lhs._accessToken != rhs._accessToken { return false }
    if lhs._role != rhs._role { return false }
    if lhs.unknownFields != rhs.unknownFields { return false }
    return true
  }
}
