import Foundation

/// This is the container format of the call.
/// 
/// @default 'raw'
public enum AudioFormatContainer: String, Codable, Hashable, CaseIterable, Sendable {
    case raw
}