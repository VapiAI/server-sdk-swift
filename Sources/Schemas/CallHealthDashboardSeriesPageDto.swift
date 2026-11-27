import Foundation

public struct CallHealthDashboardSeriesPageDto: Codable, Hashable, Sendable {
    /// Full resolved completion window used by every total, rate and coverage count.
    public let window: CallHealthDashboardWindowDto
    /// Clipped completion window represented by this page's daily buckets.
    public let pageWindow: CallHealthDashboardWindowDto
    /// Continue chart dates only; independent of the issue-row nextCursor.
    public let nextCursor: String?
    /// The requested time zone whose midnights bound this page and label its dates; absent for UTC.
    public let timeZone: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        window: CallHealthDashboardWindowDto,
        pageWindow: CallHealthDashboardWindowDto,
        nextCursor: String? = nil,
        timeZone: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.window = window
        self.pageWindow = pageWindow
        self.nextCursor = nextCursor
        self.timeZone = timeZone
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.window = try container.decode(CallHealthDashboardWindowDto.self, forKey: .window)
        self.pageWindow = try container.decode(CallHealthDashboardWindowDto.self, forKey: .pageWindow)
        self.nextCursor = try container.decodeIfPresent(String.self, forKey: .nextCursor)
        self.timeZone = try container.decodeIfPresent(String.self, forKey: .timeZone)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.window, forKey: .window)
        try container.encode(self.pageWindow, forKey: .pageWindow)
        try container.encodeIfPresent(self.nextCursor, forKey: .nextCursor)
        try container.encodeIfPresent(self.timeZone, forKey: .timeZone)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case window
        case pageWindow
        case nextCursor
        case timeZone
    }
}