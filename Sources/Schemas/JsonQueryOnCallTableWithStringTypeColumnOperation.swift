import Foundation

/// This is the aggregation operation to perform on the column.
/// When the column is a string type, the operation must be "count".
public enum JsonQueryOnCallTableWithStringTypeColumnOperation: String, Codable, Hashable, CaseIterable, Sendable {
    case count
}