import Foundation

/// This is the column in the call table that will be filtered on.
/// String Array Type columns are the same as String Type columns, but provides the ability to filter on multiple values provided as an array.
/// Must be a valid column for the selected table.
public enum FilterStringArrayTypeColumnOnCallTableColumn: String, Codable, Hashable, CaseIterable, Sendable {
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