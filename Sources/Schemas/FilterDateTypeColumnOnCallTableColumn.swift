import Foundation

/// This is the column in the call table that will be filtered on.
/// Date Type columns are columns where the rows store data as a date.
/// Must be a valid column for the selected table.
public enum FilterDateTypeColumnOnCallTableColumn: String, Codable, Hashable, CaseIterable, Sendable {
    case startedAt
    case endedAt
}