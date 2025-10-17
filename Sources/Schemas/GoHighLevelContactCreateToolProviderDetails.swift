import Foundation

public struct GoHighLevelContactCreateToolProviderDetails: Codable, Hashable, Sendable {
    /// This is the Template URL or the Snapshot URL corresponding to the Template.
    public let templateUrl: String?
    public let setupInstructions: [ToolTemplateSetup]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        templateUrl: String? = nil,
        setupInstructions: [ToolTemplateSetup]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.templateUrl = templateUrl
        self.setupInstructions = setupInstructions
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.templateUrl = try container.decodeIfPresent(String.self, forKey: .templateUrl)
        self.setupInstructions = try container.decodeIfPresent([ToolTemplateSetup].self, forKey: .setupInstructions)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.templateUrl, forKey: .templateUrl)
        try container.encodeIfPresent(self.setupInstructions, forKey: .setupInstructions)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case templateUrl
        case setupInstructions
    }
}