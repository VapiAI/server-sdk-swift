import Foundation

public struct Mono: Codable, Hashable, Sendable {
    /// This is the combined recording url for the call. To enable, set `assistant.artifactPlan.recordingEnabled`.
    public let combinedUrl: String?
    /// This is the mono recording url for the assistant. To enable, set `assistant.artifactPlan.recordingEnabled`.
    public let assistantUrl: String?
    /// This is the mono recording url for the customer. To enable, set `assistant.artifactPlan.recordingEnabled`.
    public let customerUrl: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        combinedUrl: String? = nil,
        assistantUrl: String? = nil,
        customerUrl: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.combinedUrl = combinedUrl
        self.assistantUrl = assistantUrl
        self.customerUrl = customerUrl
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.combinedUrl = try container.decodeIfPresent(String.self, forKey: .combinedUrl)
        self.assistantUrl = try container.decodeIfPresent(String.self, forKey: .assistantUrl)
        self.customerUrl = try container.decodeIfPresent(String.self, forKey: .customerUrl)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.combinedUrl, forKey: .combinedUrl)
        try container.encodeIfPresent(self.assistantUrl, forKey: .assistantUrl)
        try container.encodeIfPresent(self.customerUrl, forKey: .customerUrl)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case combinedUrl
        case assistantUrl
        case customerUrl
    }
}