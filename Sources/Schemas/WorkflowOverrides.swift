import Foundation

public struct WorkflowOverrides: Codable, Hashable, Sendable {
    /// These are values that will be used to replace the template variables in the workflow messages and other text-based fields.
    /// This uses LiquidJS syntax. https://liquidjs.com/tutorials/intro-to-liquid.html
    /// 
    /// So for example, `{{ name }}` will be replaced with the value of `name` in `variableValues`.
    /// `{{"now" | date: "%b %d, %Y, %I:%M %p", "America/New_York"}}` will be replaced with the current date and time in New York.
    ///  Some VAPI reserved defaults:
    ///  - *customer* - the customer object
    public let variableValues: [String: JSONValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        variableValues: [String: JSONValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.variableValues = variableValues
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.variableValues = try container.decodeIfPresent([String: JSONValue].self, forKey: .variableValues)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.variableValues, forKey: .variableValues)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case variableValues
    }
}