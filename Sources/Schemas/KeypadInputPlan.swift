import Foundation

public struct KeypadInputPlan: Codable, Hashable, Sendable {
    /// This keeps track of whether the user has enabled keypad input.
    /// By default, it is off.
    /// 
    /// @default false
    public let enabled: Bool?
    /// This is the time in seconds to wait before processing the input.
    /// If the input is not received within this time, the input will be ignored.
    /// If set to "off", the input will be processed when the user enters a delimiter or immediately if no delimiter is used.
    /// 
    /// @default 2
    public let timeoutSeconds: Double?
    /// This is the delimiter(s) that will be used to process the input.
    /// Can be '#', '*', or an empty array.
    public let delimiters: KeypadInputPlanDelimiters?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        enabled: Bool? = nil,
        timeoutSeconds: Double? = nil,
        delimiters: KeypadInputPlanDelimiters? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.enabled = enabled
        self.timeoutSeconds = timeoutSeconds
        self.delimiters = delimiters
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled)
        self.timeoutSeconds = try container.decodeIfPresent(Double.self, forKey: .timeoutSeconds)
        self.delimiters = try container.decodeIfPresent(KeypadInputPlanDelimiters.self, forKey: .delimiters)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.enabled, forKey: .enabled)
        try container.encodeIfPresent(self.timeoutSeconds, forKey: .timeoutSeconds)
        try container.encodeIfPresent(self.delimiters, forKey: .delimiters)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case enabled
        case timeoutSeconds
        case delimiters
    }
}