import Foundation

/// Identifies an assistant that became active during a call.
public struct AssistantActivation: Codable, Hashable, Sendable {
    /// This is the version label (e.g. `v3`) of the assistant active when
    /// the activation row was recorded. `null` for inline assistants,
    /// orgs not on assistant versioning, and parent assistants that have
    /// not yet been published under it.
    public let assistantVersion: Nullable<String>?
    /// This is the name of the assistant that was active during the call.
    public let assistantName: String
    /// This is the ID of the assistant that was active during the call.
    public let assistantId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assistantVersion: Nullable<String>? = nil,
        assistantName: String,
        assistantId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assistantVersion = assistantVersion
        self.assistantName = assistantName
        self.assistantId = assistantId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assistantVersion = try container.decodeNullableIfPresent(String.self, forKey: .assistantVersion)
        self.assistantName = try container.decode(String.self, forKey: .assistantName)
        self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.assistantVersion, forKey: .assistantVersion)
        try container.encode(self.assistantName, forKey: .assistantName)
        try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assistantVersion
        case assistantName
        case assistantId
    }
}