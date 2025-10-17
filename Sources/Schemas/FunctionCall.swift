import Foundation

public struct FunctionCall: Codable, Hashable, Sendable {
    /// This is the arguments to call the function with
    public let arguments: String
    /// This is the name of the function to call
    public let name: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        arguments: String,
        name: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.arguments = arguments
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.arguments = try container.decode(String.self, forKey: .arguments)
        self.name = try container.decode(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.arguments, forKey: .arguments)
        try container.encode(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case arguments
        case name
    }
}