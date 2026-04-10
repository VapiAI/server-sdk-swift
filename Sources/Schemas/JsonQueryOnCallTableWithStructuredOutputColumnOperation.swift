import Foundation

/// This is the aggregation operation to perform on the column.
/// When the column is a structured output type, the operation depends on the value of the structured output.
/// If the structured output is a string or boolean, the operation must be "count".
/// If the structured output is a number, the operation can be "average", "sum", "min", or "max".
public enum JsonQueryOnCallTableWithStructuredOutputColumnOperation: String, Codable, Hashable, CaseIterable, Sendable {
    case average
    case count
    case sum
    case min
    case max
}