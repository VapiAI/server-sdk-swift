import Foundation

public struct CallHookCustomerSpeechInterrupted: Codable, Hashable, Sendable {
    /// This is the event that triggers this hook
    public let on: CustomerSpeechInterrupted
    /// This is the set of actions to perform when the hook triggers
    public let `do`: [CallHookCustomerSpeechInterruptedDoItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        on: CustomerSpeechInterrupted,
        do: [CallHookCustomerSpeechInterruptedDoItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.on = on
        self.do = `do`
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.on = try container.decode(CustomerSpeechInterrupted.self, forKey: .on)
        self.do = try container.decode([CallHookCustomerSpeechInterruptedDoItem].self, forKey: .do)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.on, forKey: .on)
        try container.encode(self.do, forKey: .do)
    }

    public enum CustomerSpeechInterrupted: String, Codable, Hashable, CaseIterable, Sendable {
        case customerSpeechInterrupted = "customer.speech.interrupted"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case on
        case `do`
    }
}