import Foundation

/// This is the column in the call table that will be filtered on.
/// Number Array Type columns are the same as Number Type columns, but provides the ability to filter on multiple values provided as an array.
/// Must be a valid column for the selected table.
public enum FilterNumberArrayTypeColumnOnCallTableColumn: String, Codable, Hashable, CaseIterable, Sendable {
    case duration
    case cost
    case averageModelLatency
    case averageVoiceLatency
    case averageTranscriberLatency
    case averageTurnLatency
    case averageEndpointingLatency
}