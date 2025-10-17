import Foundation

public struct GhlToolProviderDetails: Codable, Hashable, Sendable {
    /// This is the Template URL or the Snapshot URL corresponding to the Template.
    public let templateUrl: String?
    public let setupInstructions: [ToolTemplateSetup]?
    public let workflowId: String?
    public let workflowName: String?
    public let webhookHookId: String?
    public let webhookHookName: String?
    public let locationId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        templateUrl: String? = nil,
        setupInstructions: [ToolTemplateSetup]? = nil,
        workflowId: String? = nil,
        workflowName: String? = nil,
        webhookHookId: String? = nil,
        webhookHookName: String? = nil,
        locationId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.templateUrl = templateUrl
        self.setupInstructions = setupInstructions
        self.workflowId = workflowId
        self.workflowName = workflowName
        self.webhookHookId = webhookHookId
        self.webhookHookName = webhookHookName
        self.locationId = locationId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.templateUrl = try container.decodeIfPresent(String.self, forKey: .templateUrl)
        self.setupInstructions = try container.decodeIfPresent([ToolTemplateSetup].self, forKey: .setupInstructions)
        self.workflowId = try container.decodeIfPresent(String.self, forKey: .workflowId)
        self.workflowName = try container.decodeIfPresent(String.self, forKey: .workflowName)
        self.webhookHookId = try container.decodeIfPresent(String.self, forKey: .webhookHookId)
        self.webhookHookName = try container.decodeIfPresent(String.self, forKey: .webhookHookName)
        self.locationId = try container.decodeIfPresent(String.self, forKey: .locationId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.templateUrl, forKey: .templateUrl)
        try container.encodeIfPresent(self.setupInstructions, forKey: .setupInstructions)
        try container.encodeIfPresent(self.workflowId, forKey: .workflowId)
        try container.encodeIfPresent(self.workflowName, forKey: .workflowName)
        try container.encodeIfPresent(self.webhookHookId, forKey: .webhookHookId)
        try container.encodeIfPresent(self.webhookHookName, forKey: .webhookHookName)
        try container.encodeIfPresent(self.locationId, forKey: .locationId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case templateUrl
        case setupInstructions
        case workflowId
        case workflowName
        case webhookHookId
        case webhookHookName
        case locationId
    }
}