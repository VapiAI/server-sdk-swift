import Foundation

extension Requests {
    public struct CreateBoardDto: Codable, Hashable, Sendable {
        /// This is the contents of the Board, which is an array of objects defining the type, contents, and position of the widgets on the Board.
        public let items: [CreateBoardDtoItemsItem]?
        /// This is the name of the Board.
        public let name: String
        /// This is the layout of the Board.
        public let layout: BoardLayout
        /// This is the timerange override for the board.
        /// By default, individual insights have their own timerange.
        /// This is a global override for the board which will be passed to all insights on the board.
        public let timeRangeOverride: InsightTimeRangeWithStep?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            items: [CreateBoardDtoItemsItem]? = nil,
            name: String,
            layout: BoardLayout,
            timeRangeOverride: InsightTimeRangeWithStep? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.items = items
            self.name = name
            self.layout = layout
            self.timeRangeOverride = timeRangeOverride
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.items = try container.decodeIfPresent([CreateBoardDtoItemsItem].self, forKey: .items)
            self.name = try container.decode(String.self, forKey: .name)
            self.layout = try container.decode(BoardLayout.self, forKey: .layout)
            self.timeRangeOverride = try container.decodeIfPresent(InsightTimeRangeWithStep.self, forKey: .timeRangeOverride)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.items, forKey: .items)
            try container.encode(self.name, forKey: .name)
            try container.encode(self.layout, forKey: .layout)
            try container.encodeIfPresent(self.timeRangeOverride, forKey: .timeRangeOverride)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case items
            case name
            case layout
            case timeRangeOverride
        }
    }
}