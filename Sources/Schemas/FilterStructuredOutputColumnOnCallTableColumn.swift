import Foundation

/// This is the column in the call table that will be filtered on.
/// Structured Output Type columns are only to filter on artifact.structuredOutputs[OutputID] column.
public enum FilterStructuredOutputColumnOnCallTableColumn: String, Codable, Hashable, CaseIterable, Sendable {
    case artifactStructuredOutputsOutputId = "artifact.structuredOutputs[OutputID]"
}