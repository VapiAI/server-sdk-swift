import Foundation

extension Requests {
    public struct InsightRunDto: Codable, Hashable, Sendable {
        public let formatPlan: InsightRunFormatPlan?
        /// This is the optional time range override for the insight.
        /// If provided, overrides every field in the insight's timeRange.
        /// If this is provided with missing fields, defaults will be used, not the insight's timeRange.
        /// start default - "-7d"
        /// end default - "now"
        /// step default - "day"
        /// For Pie and Text Insights, step will be ignored even if provided.
        public let timeRangeOverride: InsightTimeRangeWithStep?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            formatPlan: InsightRunFormatPlan? = nil,
            timeRangeOverride: InsightTimeRangeWithStep? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.formatPlan = formatPlan
            self.timeRangeOverride = timeRangeOverride
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.formatPlan = try container.decodeIfPresent(InsightRunFormatPlan.self, forKey: .formatPlan)
            self.timeRangeOverride = try container.decodeIfPresent(InsightTimeRangeWithStep.self, forKey: .timeRangeOverride)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.formatPlan, forKey: .formatPlan)
            try container.encodeIfPresent(self.timeRangeOverride, forKey: .timeRangeOverride)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case formatPlan
            case timeRangeOverride
        }
    }
}