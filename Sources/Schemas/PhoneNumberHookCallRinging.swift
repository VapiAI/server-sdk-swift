import Foundation

public struct PhoneNumberHookCallRinging: Codable, Hashable, Sendable {
    /// Optional filters to decide when to trigger the hook. Currently supports filtering by caller country code.
    public let filters: [PhoneNumberCallRingingHookFilter]?
    /// Only the first action will be executed. Additional actions will be ignored.
    public let `do`: [PhoneNumberHookCallRingingDoItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        filters: [PhoneNumberCallRingingHookFilter]? = nil,
        do: [PhoneNumberHookCallRingingDoItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.filters = filters
        self.do = `do`
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.filters = try container.decodeIfPresent([PhoneNumberCallRingingHookFilter].self, forKey: .filters)
        self.do = try container.decode([PhoneNumberHookCallRingingDoItem].self, forKey: .do)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.filters, forKey: .filters)
        try container.encode(self.do, forKey: .do)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case filters
        case `do`
    }
}