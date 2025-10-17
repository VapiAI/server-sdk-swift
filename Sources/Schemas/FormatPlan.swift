import Foundation

public struct FormatPlan: Codable, Hashable, Sendable {
    /// This determines whether the chunk is formatted before being sent to the voice provider. This helps with enunciation. This includes phone numbers, emails and addresses. Default `true`.
    /// 
    /// Usage:
    /// - To rely on the voice provider's formatting logic, set this to `false`.
    /// 
    /// If `voice.chunkPlan.enabled` is `false`, this is automatically `false` since there's no chunk to format.
    /// 
    /// @default true
    public let enabled: Bool?
    /// This is the cutoff after which a number is converted to individual digits instead of being spoken as words.
    /// 
    /// Example:
    /// - If cutoff 2025, "12345" is converted to "1 2 3 4 5" while "1200" is converted to "twelve hundred".
    /// 
    /// Usage:
    /// - If your use case doesn't involve IDs like zip codes, set this to a high value.
    /// - If your use case involves IDs that are shorter than 5 digits, set this to a lower value.
    /// 
    /// @default 2025
    public let numberToDigitsCutoff: Double?
    /// These are the custom replacements you can make to the chunk before it is sent to the voice provider.
    /// 
    /// Usage:
    /// - To replace a specific word or phrase with a different word or phrase, use the `ExactReplacement` type. Eg. `{ type: 'exact', key: 'hello', value: 'hi' }`
    /// - To replace a word or phrase that matches a pattern, use the `RegexReplacement` type. Eg. `{ type: 'regex', regex: '\\b[a-zA-Z]{5}\\b', value: 'hi' }`
    /// 
    /// @default []
    public let replacements: [FormatPlanReplacementsItem]?
    /// List of formatters to apply. If not provided, all default formatters will be applied.
    /// If provided, only the specified formatters will be applied.
    /// Note: Some essential formatters like angle bracket removal will always be applied.
    /// @default undefined
    public let formattersEnabled: [FormatPlanFormattersEnabledItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        enabled: Bool? = nil,
        numberToDigitsCutoff: Double? = nil,
        replacements: [FormatPlanReplacementsItem]? = nil,
        formattersEnabled: [FormatPlanFormattersEnabledItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.enabled = enabled
        self.numberToDigitsCutoff = numberToDigitsCutoff
        self.replacements = replacements
        self.formattersEnabled = formattersEnabled
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled)
        self.numberToDigitsCutoff = try container.decodeIfPresent(Double.self, forKey: .numberToDigitsCutoff)
        self.replacements = try container.decodeIfPresent([FormatPlanReplacementsItem].self, forKey: .replacements)
        self.formattersEnabled = try container.decodeIfPresent([FormatPlanFormattersEnabledItem].self, forKey: .formattersEnabled)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.enabled, forKey: .enabled)
        try container.encodeIfPresent(self.numberToDigitsCutoff, forKey: .numberToDigitsCutoff)
        try container.encodeIfPresent(self.replacements, forKey: .replacements)
        try container.encodeIfPresent(self.formattersEnabled, forKey: .formattersEnabled)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case enabled
        case numberToDigitsCutoff
        case replacements
        case formattersEnabled
    }
}