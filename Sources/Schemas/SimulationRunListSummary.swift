import Foundation

public struct SimulationRunListSummary: Codable, Hashable, Sendable {
    public let source: SimulationRunListSource
    public let targetSnapshotName: String?
    public let simulationCount: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        source: SimulationRunListSource,
        targetSnapshotName: String? = nil,
        simulationCount: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.source = source
        self.targetSnapshotName = targetSnapshotName
        self.simulationCount = simulationCount
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.source = try container.decode(SimulationRunListSource.self, forKey: .source)
        self.targetSnapshotName = try container.decodeIfPresent(String.self, forKey: .targetSnapshotName)
        self.simulationCount = try container.decode(Double.self, forKey: .simulationCount)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.source, forKey: .source)
        try container.encodeIfPresent(self.targetSnapshotName, forKey: .targetSnapshotName)
        try container.encode(self.simulationCount, forKey: .simulationCount)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case source
        case targetSnapshotName
        case simulationCount
    }
}