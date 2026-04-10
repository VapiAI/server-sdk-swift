import Foundation

public struct RelayRequest: Codable, Hashable, Sendable {
    /// The source identifier of the relay request
    public let source: String
    /// The target assistant or squad to relay the commands to
    public let target: RelayRequestTarget
    /// The unique identifier of the customer
    public let customerId: String
    /// The list of commands to relay to the target
    public let commands: [RelayRequestCommandsItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        source: String,
        target: RelayRequestTarget,
        customerId: String,
        commands: [RelayRequestCommandsItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.source = source
        self.target = target
        self.customerId = customerId
        self.commands = commands
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.source = try container.decode(String.self, forKey: .source)
        self.target = try container.decode(RelayRequestTarget.self, forKey: .target)
        self.customerId = try container.decode(String.self, forKey: .customerId)
        self.commands = try container.decode([RelayRequestCommandsItem].self, forKey: .commands)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.source, forKey: .source)
        try container.encode(self.target, forKey: .target)
        try container.encode(self.customerId, forKey: .customerId)
        try container.encode(self.commands, forKey: .commands)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case source
        case target
        case customerId
        case commands
    }
}