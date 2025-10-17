import Foundation

extension Requests {
    public struct AnalyticsQueryDto: Codable, Hashable, Sendable {
        /// This is the list of metric queries you want to perform.
        public let queries: [AnalyticsQuery]
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            queries: [AnalyticsQuery],
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.queries = queries
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.queries = try container.decode([AnalyticsQuery].self, forKey: .queries)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.queries, forKey: .queries)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case queries
        }
    }
}