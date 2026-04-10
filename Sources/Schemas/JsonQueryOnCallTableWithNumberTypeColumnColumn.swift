import Foundation

/// This is the column that will be queried in the selected table.
/// Available columns depend on the selected table.
/// Number Type columns are columns where the rows store Number data
public enum JsonQueryOnCallTableWithNumberTypeColumnColumn: String, Codable, Hashable, CaseIterable, Sendable {
    case cost
    case duration
    case averageModelLatency
    case averageVoiceLatency
    case averageTranscriberLatency
    case averageTurnLatency
    case averageEndpointingLatency
    case artifactStructuredOutputsOutputId = "artifact.structuredOutputs[OutputID]"
}