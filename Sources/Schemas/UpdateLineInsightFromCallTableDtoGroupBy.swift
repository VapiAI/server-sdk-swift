import Foundation

/// This is the group by column for the insight when table is `call`.
/// These are the columns to group the results by.
/// All results are grouped by the time range step by default.
public enum UpdateLineInsightFromCallTableDtoGroupBy: String, Codable, Hashable, CaseIterable, Sendable {
    case assistantId
    case workflowId
    case squadId
    case phoneNumberId
    case type
    case endedReason
    case customerNumber
    case campaignId
    case artifactStructuredOutputsOutputId = "artifact.structuredOutputs[OutputID]"
}