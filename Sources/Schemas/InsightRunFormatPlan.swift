import Foundation

public struct InsightRunFormatPlan: Codable, Hashable, Sendable {
    /// This is the format of the data to return.
    /// If not provided, defaults to "raw".
    /// Raw provides the data as fetched from the database, with formulas evaluated.
    /// Recharts provides the data in a format that can is ready to be used by recharts.js to render charts.
    public let format: InsightRunFormatPlanFormat?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        format: InsightRunFormatPlanFormat? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.format = format
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.format = try container.decodeIfPresent(InsightRunFormatPlanFormat.self, forKey: .format)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.format, forKey: .format)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case format
    }
}