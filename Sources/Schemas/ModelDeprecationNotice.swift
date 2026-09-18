import Foundation

public struct ModelDeprecationNotice: Codable, Hashable, Sendable {
    /// Path of the slot that carries the model, relative to the response root,
    /// e.g. `model`, `model.fallbackModels[1]`, `transcriber`, `voice`, or
    /// `members[2].assistantOverrides.model` on a squad.
    public let slot: String
    /// Provider as stored on the slot.
    public let provider: String
    /// Model name as stored on the slot.
    public let model: String
    /// Day the model became deprecated, `YYYY-MM-DD` in UTC.
    public let deprecationDate: String
    /// Day the model is or was retired, `YYYY-MM-DD` in UTC. On and after this
    /// day Vapi no longer runs the model as configured.
    public let retirementDate: String
    /// The recommended migration target for the slot's model: the registry's
    /// replacement, followed through any further retirements as of the response
    /// date, so it names a model that is alive on that day. A `<model>:<region>`
    /// pin on the slot's model is kept on the target.
    public let replacementModel: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        slot: String,
        provider: String,
        model: String,
        deprecationDate: String,
        retirementDate: String,
        replacementModel: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.slot = slot
        self.provider = provider
        self.model = model
        self.deprecationDate = deprecationDate
        self.retirementDate = retirementDate
        self.replacementModel = replacementModel
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.slot = try container.decode(String.self, forKey: .slot)
        self.provider = try container.decode(String.self, forKey: .provider)
        self.model = try container.decode(String.self, forKey: .model)
        self.deprecationDate = try container.decode(String.self, forKey: .deprecationDate)
        self.retirementDate = try container.decode(String.self, forKey: .retirementDate)
        self.replacementModel = try container.decode(String.self, forKey: .replacementModel)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.slot, forKey: .slot)
        try container.encode(self.provider, forKey: .provider)
        try container.encode(self.model, forKey: .model)
        try container.encode(self.deprecationDate, forKey: .deprecationDate)
        try container.encode(self.retirementDate, forKey: .retirementDate)
        try container.encode(self.replacementModel, forKey: .replacementModel)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case slot
        case provider
        case model
        case deprecationDate
        case retirementDate
        case replacementModel
    }
}