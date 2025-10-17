import Foundation

public struct CallHookCustomerSpeechTimeout: Codable, Hashable, Sendable {
    /// Must be either "customer.speech.timeout" or match the pattern "customer.speech.timeout[property=value]"
    public let on: String
    /// This is the set of actions to perform when the hook triggers
    public let `do`: [CallHookCustomerSpeechTimeoutDoItem]
    /// This is the set of filters that must match for the hook to trigger
    public let options: CustomerSpeechTimeoutOptions?
    /// This is the name of the hook, it can be set by the user to identify the hook.
    /// If no name is provided, the hook will be auto generated as UUID.
    /// 
    /// @default UUID
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        on: String,
        do: [CallHookCustomerSpeechTimeoutDoItem],
        options: CustomerSpeechTimeoutOptions? = nil,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.on = on
        self.do = `do`
        self.options = options
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.on = try container.decode(String.self, forKey: .on)
        self.do = try container.decode([CallHookCustomerSpeechTimeoutDoItem].self, forKey: .do)
        self.options = try container.decodeIfPresent(CustomerSpeechTimeoutOptions.self, forKey: .options)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.on, forKey: .on)
        try container.encode(self.do, forKey: .do)
        try container.encodeIfPresent(self.options, forKey: .options)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case on
        case `do`
        case options
        case name
    }
}