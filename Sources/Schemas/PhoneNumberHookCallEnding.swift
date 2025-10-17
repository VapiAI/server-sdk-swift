import Foundation

public struct PhoneNumberHookCallEnding: Codable, Hashable, Sendable {
    /// Optional filters to decide when to trigger - restricted to assistant-request related ended reasons
    public let filters: [PhoneNumberCallEndingHookFilter]?
    /// This is the action to perform when the hook triggers
    public let `do`: PhoneNumberHookCallEndingDo?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        filters: [PhoneNumberCallEndingHookFilter]? = nil,
        do: PhoneNumberHookCallEndingDo? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.filters = filters
        self.do = `do`
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.filters = try container.decodeIfPresent([PhoneNumberCallEndingHookFilter].self, forKey: .filters)
        self.do = try container.decodeIfPresent(PhoneNumberHookCallEndingDo.self, forKey: .do)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.filters, forKey: .filters)
        try container.encodeIfPresent(self.do, forKey: .do)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case filters
        case `do`
    }
}