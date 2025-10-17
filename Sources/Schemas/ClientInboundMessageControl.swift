import Foundation

public struct ClientInboundMessageControl: Codable, Hashable, Sendable {
    /// This is the control action
    public let control: ClientInboundMessageControlControl
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        control: ClientInboundMessageControlControl,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.control = control
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.control = try container.decode(ClientInboundMessageControlControl.self, forKey: .control)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.control, forKey: .control)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case control
    }
}