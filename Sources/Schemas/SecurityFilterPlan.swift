import Foundation

public struct SecurityFilterPlan: Codable, Hashable, Sendable {
    /// Whether the security filter is enabled.
    /// @default false
    public let enabled: Bool?
    /// Array of security filter types to apply.
    /// If array is not empty, only those security filters are run.
    public let filters: [SecurityFilterBase]?
    /// Mode of operation when a security threat is detected.
    /// - 'sanitize': Remove or replace the threatening content
    /// - 'reject': Replace the entire transcript with replacement text
    /// - 'replace': Replace threatening patterns with replacement text
    /// @default 'sanitize'
    public let mode: SecurityFilterPlanMode?
    /// Text to use when replacing filtered content.
    /// @default '[FILTERED]'
    public let replacementText: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        enabled: Bool? = nil,
        filters: [SecurityFilterBase]? = nil,
        mode: SecurityFilterPlanMode? = nil,
        replacementText: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.enabled = enabled
        self.filters = filters
        self.mode = mode
        self.replacementText = replacementText
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled)
        self.filters = try container.decodeIfPresent([SecurityFilterBase].self, forKey: .filters)
        self.mode = try container.decodeIfPresent(SecurityFilterPlanMode.self, forKey: .mode)
        self.replacementText = try container.decodeIfPresent(String.self, forKey: .replacementText)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.enabled, forKey: .enabled)
        try container.encodeIfPresent(self.filters, forKey: .filters)
        try container.encodeIfPresent(self.mode, forKey: .mode)
        try container.encodeIfPresent(self.replacementText, forKey: .replacementText)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case enabled
        case filters
        case mode
        case replacementText
    }
}