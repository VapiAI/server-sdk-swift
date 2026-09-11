import Foundation

public struct BoardLayout: Codable, Hashable, Sendable {
    /// This is the number of columns in the Board.
    /// For now, it is fixed to 6.
    public let columns: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        columns: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.columns = columns
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.columns = try container.decode(Double.self, forKey: .columns)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.columns, forKey: .columns)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case columns
    }
}