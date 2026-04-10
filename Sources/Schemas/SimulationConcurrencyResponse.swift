import Foundation

public struct SimulationConcurrencyResponse: Codable, Hashable, Sendable {
    public let orgId: String
    /// Max call slots for simulations (each voice simulation uses 2 call slots: tester + target)
    public let concurrencyLimit: Double
    /// Number of call slots currently in use by running simulations
    public let activeSimulations: Double
    /// Number of voice simulations that can start now (available call slots / 2)
    public let availableToStart: Double
    public let createdAt: Nullable<Date>
    public let updatedAt: Nullable<Date>
    /// True if org is using platform default concurrency limit
    public let isDefault: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        orgId: String,
        concurrencyLimit: Double,
        activeSimulations: Double,
        availableToStart: Double,
        createdAt: Nullable<Date>,
        updatedAt: Nullable<Date>,
        isDefault: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.orgId = orgId
        self.concurrencyLimit = concurrencyLimit
        self.activeSimulations = activeSimulations
        self.availableToStart = availableToStart
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.isDefault = isDefault
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.concurrencyLimit = try container.decode(Double.self, forKey: .concurrencyLimit)
        self.activeSimulations = try container.decode(Double.self, forKey: .activeSimulations)
        self.availableToStart = try container.decode(Double.self, forKey: .availableToStart)
        self.createdAt = try container.decode(Nullable<Date>.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Nullable<Date>.self, forKey: .updatedAt)
        self.isDefault = try container.decode(Bool.self, forKey: .isDefault)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.concurrencyLimit, forKey: .concurrencyLimit)
        try container.encode(self.activeSimulations, forKey: .activeSimulations)
        try container.encode(self.availableToStart, forKey: .availableToStart)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.isDefault, forKey: .isDefault)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case orgId
        case concurrencyLimit
        case activeSimulations
        case availableToStart
        case createdAt
        case updatedAt
        case isDefault
    }
}