import Foundation

public struct MakeToolProviderDetails: Codable, Hashable, Sendable {
    /// This is the Template URL or the Snapshot URL corresponding to the Template.
    public let templateUrl: String?
    public let setupInstructions: [ToolTemplateSetup]?
    public let scenarioId: Double?
    public let scenarioName: String?
    public let triggerHookId: Double?
    public let triggerHookName: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        templateUrl: String? = nil,
        setupInstructions: [ToolTemplateSetup]? = nil,
        scenarioId: Double? = nil,
        scenarioName: String? = nil,
        triggerHookId: Double? = nil,
        triggerHookName: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.templateUrl = templateUrl
        self.setupInstructions = setupInstructions
        self.scenarioId = scenarioId
        self.scenarioName = scenarioName
        self.triggerHookId = triggerHookId
        self.triggerHookName = triggerHookName
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.templateUrl = try container.decodeIfPresent(String.self, forKey: .templateUrl)
        self.setupInstructions = try container.decodeIfPresent([ToolTemplateSetup].self, forKey: .setupInstructions)
        self.scenarioId = try container.decodeIfPresent(Double.self, forKey: .scenarioId)
        self.scenarioName = try container.decodeIfPresent(String.self, forKey: .scenarioName)
        self.triggerHookId = try container.decodeIfPresent(Double.self, forKey: .triggerHookId)
        self.triggerHookName = try container.decodeIfPresent(String.self, forKey: .triggerHookName)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.templateUrl, forKey: .templateUrl)
        try container.encodeIfPresent(self.setupInstructions, forKey: .setupInstructions)
        try container.encodeIfPresent(self.scenarioId, forKey: .scenarioId)
        try container.encodeIfPresent(self.scenarioName, forKey: .scenarioName)
        try container.encodeIfPresent(self.triggerHookId, forKey: .triggerHookId)
        try container.encodeIfPresent(self.triggerHookName, forKey: .triggerHookName)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case templateUrl
        case setupInstructions
        case scenarioId
        case scenarioName
        case triggerHookId
        case triggerHookName
    }
}