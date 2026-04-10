import Foundation

public struct SimulationRunSuiteEntry: Codable, Hashable, Sendable {
    /// ID of the simulation suite to run
    public let simulationSuiteId: String?
    public let suiteId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        simulationSuiteId: String? = nil,
        suiteId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.simulationSuiteId = simulationSuiteId
        self.suiteId = suiteId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.simulationSuiteId = try container.decodeIfPresent(String.self, forKey: .simulationSuiteId)
        self.suiteId = try container.decodeIfPresent(String.self, forKey: .suiteId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.simulationSuiteId, forKey: .simulationSuiteId)
        try container.encodeIfPresent(self.suiteId, forKey: .suiteId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case simulationSuiteId
        case suiteId
    }
}