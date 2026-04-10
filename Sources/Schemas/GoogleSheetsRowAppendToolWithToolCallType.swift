import Foundation

/// The type of tool. "google.sheets.row.append" for Google Sheets Row Append tool.
public enum GoogleSheetsRowAppendToolWithToolCallType: String, Codable, Hashable, CaseIterable, Sendable {
    case googleSheetsRowAppend = "google.sheets.row.append"
}