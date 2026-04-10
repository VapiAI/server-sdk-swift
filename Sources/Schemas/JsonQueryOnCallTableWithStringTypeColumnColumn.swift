import Foundation

/// This is the column that will be queried in the selected table.
/// Available columns depend on the selected table.
/// String Type columns are columns where the rows store String data
public enum JsonQueryOnCallTableWithStringTypeColumnColumn: String, Codable, Hashable, CaseIterable, Sendable {
    case id
    case artifactStructuredOutputsOutputId = "artifact.structuredOutputs[OutputID]"
}