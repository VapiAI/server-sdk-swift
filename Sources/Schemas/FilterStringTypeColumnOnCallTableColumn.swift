import Foundation

/// This is the column in the call table that will be filtered on.
/// String Type columns are columns where the rows store data as a string.
/// Must be a valid column for the selected table.
public enum FilterStringTypeColumnOnCallTableColumn: String, Codable, Hashable, CaseIterable, Sendable {
    case assistantId
    case workflowId
    case squadId
    case phoneNumberId
    case type
    case customerNumber
    case status
    case endedReason
    case forwardedPhoneNumber
    case campaignId
}