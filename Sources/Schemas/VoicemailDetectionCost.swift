import Foundation

public struct VoicemailDetectionCost: Codable, Hashable, Sendable {
    /// This is the model that was used to perform the analysis.
    public let model: [String: JSONValue]
    /// This is the provider that was used to detect the voicemail.
    public let provider: VoicemailDetectionCostProvider
    /// This is the number of prompt text tokens used in the voicemail detection.
    public let promptTextTokens: Double
    /// This is the number of prompt audio tokens used in the voicemail detection.
    public let promptAudioTokens: Double
    /// This is the number of completion text tokens used in the voicemail detection.
    public let completionTextTokens: Double
    /// This is the number of completion audio tokens used in the voicemail detection.
    public let completionAudioTokens: Double
    /// This is the cost of the component in USD.
    public let cost: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        model: [String: JSONValue],
        provider: VoicemailDetectionCostProvider,
        promptTextTokens: Double,
        promptAudioTokens: Double,
        completionTextTokens: Double,
        completionAudioTokens: Double,
        cost: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.model = model
        self.provider = provider
        self.promptTextTokens = promptTextTokens
        self.promptAudioTokens = promptAudioTokens
        self.completionTextTokens = completionTextTokens
        self.completionAudioTokens = completionAudioTokens
        self.cost = cost
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.model = try container.decode([String: JSONValue].self, forKey: .model)
        self.provider = try container.decode(VoicemailDetectionCostProvider.self, forKey: .provider)
        self.promptTextTokens = try container.decode(Double.self, forKey: .promptTextTokens)
        self.promptAudioTokens = try container.decode(Double.self, forKey: .promptAudioTokens)
        self.completionTextTokens = try container.decode(Double.self, forKey: .completionTextTokens)
        self.completionAudioTokens = try container.decode(Double.self, forKey: .completionAudioTokens)
        self.cost = try container.decode(Double.self, forKey: .cost)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.model, forKey: .model)
        try container.encode(self.provider, forKey: .provider)
        try container.encode(self.promptTextTokens, forKey: .promptTextTokens)
        try container.encode(self.promptAudioTokens, forKey: .promptAudioTokens)
        try container.encode(self.completionTextTokens, forKey: .completionTextTokens)
        try container.encode(self.completionAudioTokens, forKey: .completionAudioTokens)
        try container.encode(self.cost, forKey: .cost)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case model
        case provider
        case promptTextTokens
        case promptAudioTokens
        case completionTextTokens
        case completionAudioTokens
        case cost
    }
}