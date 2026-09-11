import Foundation

public struct CampaignContactCounters: Codable, Hashable, Sendable {
    public let pending: Double
    public let dispatched: Double
    public let completed: Double
    public let failed: Double
    public let skipped: Double
    public let predialFailed: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        pending: Double,
        dispatched: Double,
        completed: Double,
        failed: Double,
        skipped: Double,
        predialFailed: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.pending = pending
        self.dispatched = dispatched
        self.completed = completed
        self.failed = failed
        self.skipped = skipped
        self.predialFailed = predialFailed
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pending = try container.decode(Double.self, forKey: .pending)
        self.dispatched = try container.decode(Double.self, forKey: .dispatched)
        self.completed = try container.decode(Double.self, forKey: .completed)
        self.failed = try container.decode(Double.self, forKey: .failed)
        self.skipped = try container.decode(Double.self, forKey: .skipped)
        self.predialFailed = try container.decode(Double.self, forKey: .predialFailed)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.pending, forKey: .pending)
        try container.encode(self.dispatched, forKey: .dispatched)
        try container.encode(self.completed, forKey: .completed)
        try container.encode(self.failed, forKey: .failed)
        try container.encode(self.skipped, forKey: .skipped)
        try container.encode(self.predialFailed, forKey: .predialFailed)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case pending
        case dispatched
        case completed
        case failed
        case skipped
        case predialFailed
    }
}