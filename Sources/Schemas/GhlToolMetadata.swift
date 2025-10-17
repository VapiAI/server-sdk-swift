import Foundation

public struct GhlToolMetadata: Codable, Hashable, Sendable {
    public let workflowId: String?
    public let locationId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        workflowId: String? = nil,
        locationId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.workflowId = workflowId
        self.locationId = locationId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.workflowId = try container.decodeIfPresent(String.self, forKey: .workflowId)
        self.locationId = try container.decodeIfPresent(String.self, forKey: .locationId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.workflowId, forKey: .workflowId)
        try container.encodeIfPresent(self.locationId, forKey: .locationId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case workflowId
        case locationId
    }
}