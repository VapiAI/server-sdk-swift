import Foundation

/// This is the type of filter - currently only "oneOf" is supported
public enum CallHookFilterType: String, Codable, Hashable, CaseIterable, Sendable {
    case oneOf
}