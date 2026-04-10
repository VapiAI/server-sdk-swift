import Foundation

/// This is the aggregation operation to perform on the column.
/// When the column is a number type, the operation must be one of the following:
/// - average
/// - sum
/// - min
/// - max
public enum JsonQueryOnCallTableWithNumberTypeColumnOperation: String, Codable, Hashable, CaseIterable, Sendable {
    case average
    case sum
    case min
    case max
}