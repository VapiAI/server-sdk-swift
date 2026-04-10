import Foundation

public struct CallHookTranscriberEndpointedSpeechLowConfidence: Codable, Hashable, Sendable {
    /// This is the set of actions to perform when the hook triggers
    public let `do`: [CallHookTranscriberEndpointedSpeechLowConfidenceDoItem]
    /// This is the event that triggers this hook
    public let on: String
    /// This is the options for the hook including confidence thresholds
    public let options: EndpointedSpeechLowConfidenceOptions?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        do: [CallHookTranscriberEndpointedSpeechLowConfidenceDoItem],
        on: String,
        options: EndpointedSpeechLowConfidenceOptions? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.do = `do`
        self.on = on
        self.options = options
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.do = try container.decode([CallHookTranscriberEndpointedSpeechLowConfidenceDoItem].self, forKey: .do)
        self.on = try container.decode(String.self, forKey: .on)
        self.options = try container.decodeIfPresent(EndpointedSpeechLowConfidenceOptions.self, forKey: .options)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.do, forKey: .do)
        try container.encode(self.on, forKey: .on)
        try container.encodeIfPresent(self.options, forKey: .options)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case `do`
        case on
        case options
    }
}