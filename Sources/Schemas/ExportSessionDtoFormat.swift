import Foundation

/// This is the format of the export.
/// 
/// @default csv
public enum ExportSessionDtoFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case csv
    case json
}