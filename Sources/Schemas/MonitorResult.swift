import Foundation

/// Result of evaluating an attached monitor's filter for a call.
public struct MonitorResult: Codable, Hashable, Sendable {
    /// Unique identifier of the monitor that produced this result.
    public let monitorId: String
    /// Whether the monitor's filter matched the call.
    public let filterPassed: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        monitorId: String,
        filterPassed: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.monitorId = monitorId
        self.filterPassed = filterPassed
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.monitorId = try container.decode(String.self, forKey: .monitorId)
        self.filterPassed = try container.decode(Bool.self, forKey: .filterPassed)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.monitorId, forKey: .monitorId)
        try container.encode(self.filterPassed, forKey: .filterPassed)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case monitorId
        case filterPassed
    }
}