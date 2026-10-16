import Foundation

public struct TrafficAllocationLatestResponseDto: Codable, Hashable, Sendable {
    /// The source's current configuration: the newest allocation row with its targets. Absent when the source has never been configured.
    public let allocation: TrafficAllocation?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        allocation: TrafficAllocation? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.allocation = allocation
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.allocation = try container.decodeIfPresent(TrafficAllocation.self, forKey: .allocation)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.allocation, forKey: .allocation)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case allocation
    }
}