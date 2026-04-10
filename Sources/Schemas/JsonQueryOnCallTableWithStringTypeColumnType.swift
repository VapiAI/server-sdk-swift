import Foundation

/// This is the type of query. Only allowed type is "vapiql-json".
public enum JsonQueryOnCallTableWithStringTypeColumnType: String, Codable, Hashable, CaseIterable, Sendable {
    case vapiqlJson = "vapiql-json"
}