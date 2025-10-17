import Foundation

/// This is the format of the string. To pass a regex, use the `pattern` property instead.
/// 
/// OpenAI documentation: https://platform.openai.com/docs/guides/structured-outputs?api-mode=chat&type-restrictions=string-restrictions
public enum JsonSchemaFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case dateTime = "date-time"
    case time
    case date
    case duration
    case email
    case hostname
    case ipv4
    case ipv6
    case uuid
}