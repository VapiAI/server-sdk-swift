import Foundation

public struct Template: Codable, Hashable, Sendable {
    public let details: TemplateDetails?
    public let providerDetails: TemplateProviderDetails?
    public let metadata: ToolTemplateMetadata?
    public let visibility: TemplateVisibility?
    public let type: Tool
    /// The name of the template. This is just for your own reference.
    public let name: String?
    public let provider: TemplateProvider?
    /// The unique identifier for the template.
    public let id: String
    /// The unique identifier for the organization that this template belongs to.
    public let orgId: String
    /// The ISO 8601 date-time string of when the template was created.
    public let createdAt: Date
    /// The ISO 8601 date-time string of when the template was last updated.
    public let updatedAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        details: TemplateDetails? = nil,
        providerDetails: TemplateProviderDetails? = nil,
        metadata: ToolTemplateMetadata? = nil,
        visibility: TemplateVisibility? = nil,
        type: Tool,
        name: String? = nil,
        provider: TemplateProvider? = nil,
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.details = details
        self.providerDetails = providerDetails
        self.metadata = metadata
        self.visibility = visibility
        self.type = type
        self.name = name
        self.provider = provider
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.details = try container.decodeIfPresent(TemplateDetails.self, forKey: .details)
        self.providerDetails = try container.decodeIfPresent(TemplateProviderDetails.self, forKey: .providerDetails)
        self.metadata = try container.decodeIfPresent(ToolTemplateMetadata.self, forKey: .metadata)
        self.visibility = try container.decodeIfPresent(TemplateVisibility.self, forKey: .visibility)
        self.type = try container.decode(Tool.self, forKey: .type)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.provider = try container.decodeIfPresent(TemplateProvider.self, forKey: .provider)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.details, forKey: .details)
        try container.encodeIfPresent(self.providerDetails, forKey: .providerDetails)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
        try container.encodeIfPresent(self.visibility, forKey: .visibility)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.provider, forKey: .provider)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    public enum Tool: String, Codable, Hashable, CaseIterable, Sendable {
        case tool
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case details
        case providerDetails
        case metadata
        case visibility
        case type
        case name
        case provider
        case id
        case orgId
        case createdAt
        case updatedAt
    }
}