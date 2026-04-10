import Foundation

/// This is the column in the call table that will be filtered on.
/// Number Type columns are columns where the rows store data as a number.
/// Must be a valid column for the selected table.
public enum FilterNumberTypeColumnOnCallTableColumn: String, Codable, Hashable, CaseIterable, Sendable {
    case duration
    case cost
    case averageModelLatency
    case averageVoiceLatency
    case averageTranscriberLatency
    case averageTurnLatency
    case averageEndpointingLatency
}