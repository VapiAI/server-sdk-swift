import Foundation

/// This is the column that will be queried in the call table.
/// Structured Output Type columns are only to query on artifact.structuredOutputs[OutputID] column.
public enum JsonQueryOnCallTableWithStructuredOutputColumnColumn: String, Codable, Hashable, CaseIterable, Sendable {
    case artifactStructuredOutputsOutputId = "artifact.structuredOutputs[OutputID]"
}