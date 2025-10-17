import Foundation

public struct CreateToolTemplateDto: Codable, Hashable, Sendable {
    public let details: CreateToolTemplateDtoDetails?
    public let providerDetails: CreateToolTemplateDtoProviderDetails?
    public let metadata: ToolTemplateMetadata?
    public let visibility: CreateToolTemplateDtoVisibility?
    public let type: Tool
    /// The name of the template. This is just for your own reference.
    public let name: String?
    public let provider: CreateToolTemplateDtoProvider?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        details: CreateToolTemplateDtoDetails? = nil,
        providerDetails: CreateToolTemplateDtoProviderDetails? = nil,
        metadata: ToolTemplateMetadata? = nil,
        visibility: CreateToolTemplateDtoVisibility? = nil,
        type: Tool,
        name: String? = nil,
        provider: CreateToolTemplateDtoProvider? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.details = details
        self.providerDetails = providerDetails
        self.metadata = metadata
        self.visibility = visibility
        self.type = type
        self.name = name
        self.provider = provider
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.details = try container.decodeIfPresent(CreateToolTemplateDtoDetails.self, forKey: .details)
        self.providerDetails = try container.decodeIfPresent(CreateToolTemplateDtoProviderDetails.self, forKey: .providerDetails)
        self.metadata = try container.decodeIfPresent(ToolTemplateMetadata.self, forKey: .metadata)
        self.visibility = try container.decodeIfPresent(CreateToolTemplateDtoVisibility.self, forKey: .visibility)
        self.type = try container.decode(Tool.self, forKey: .type)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.provider = try container.decodeIfPresent(CreateToolTemplateDtoProvider.self, forKey: .provider)
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
    }
}