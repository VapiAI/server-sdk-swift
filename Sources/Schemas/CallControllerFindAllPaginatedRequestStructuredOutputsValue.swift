import Foundation

public struct CallControllerFindAllPaginatedRequestStructuredOutputsValue: Codable, Hashable, Sendable {
    /// Equal to
    public let eq: String?
    /// Not equal to
    public let neq: String?
    /// Greater than
    public let gt: String?
    /// Greater than or equal to
    public let gte: String?
    /// Less than
    public let lt: String?
    /// Less than or equal to
    public let lte: String?
    /// Contains
    public let contains: String?
    /// Not contains
    public let notContains: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        eq: String? = nil,
        neq: String? = nil,
        gt: String? = nil,
        gte: String? = nil,
        lt: String? = nil,
        lte: String? = nil,
        contains: String? = nil,
        notContains: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.eq = eq
        self.neq = neq
        self.gt = gt
        self.gte = gte
        self.lt = lt
        self.lte = lte
        self.contains = contains
        self.notContains = notContains
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.eq = try container.decodeIfPresent(String.self, forKey: .eq)
        self.neq = try container.decodeIfPresent(String.self, forKey: .neq)
        self.gt = try container.decodeIfPresent(String.self, forKey: .gt)
        self.gte = try container.decodeIfPresent(String.self, forKey: .gte)
        self.lt = try container.decodeIfPresent(String.self, forKey: .lt)
        self.lte = try container.decodeIfPresent(String.self, forKey: .lte)
        self.contains = try container.decodeIfPresent(String.self, forKey: .contains)
        self.notContains = try container.decodeIfPresent(String.self, forKey: .notContains)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.eq, forKey: .eq)
        try container.encodeIfPresent(self.neq, forKey: .neq)
        try container.encodeIfPresent(self.gt, forKey: .gt)
        try container.encodeIfPresent(self.gte, forKey: .gte)
        try container.encodeIfPresent(self.lt, forKey: .lt)
        try container.encodeIfPresent(self.lte, forKey: .lte)
        try container.encodeIfPresent(self.contains, forKey: .contains)
        try container.encodeIfPresent(self.notContains, forKey: .notContains)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case eq
        case neq
        case gt
        case gte
        case lt
        case lte
        case contains
        case notContains
    }
}