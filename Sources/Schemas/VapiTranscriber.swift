import Foundation

public struct VapiTranscriber: Codable, Hashable, Sendable {
    /// This is the version of the Vapi transcriber. Vapi manages the underlying
    /// model and routing. When omitted, the latest version is used.
    /// 
    /// Managed version params are additive-only and `'latest'` is an auto-update
    /// channel — see the param-evolution INVARIANT in `vapiManaged/types.ts`.
    public let version: VapiTranscriberVersion?
    /// This is the language for transcription as an ISO 639-1 code (e.g. `en`).
    /// Selecting a language locks transcription to it. For multiple languages,
    /// use `languages` instead. When neither `language` nor `languages` is set,
    /// the transcriber auto-detects the spoken language.
    public let language: VapiTranscriberLanguage?
    /// These are the languages for transcription as ISO 639-1 codes. Set one or
    /// more codes to restrict and bias recognition to those languages. An empty
    /// array `[]` (or omitting both this and `language`) enables auto-detection
    /// of the spoken language.
    public let languages: [VapiTranscriberLanguagesItem]?
    /// These are custom keywords/vocabulary to boost recognition of use-case
    /// specific words (company names, product names, jargon).
    public let keywords: [String]?
    /// This is the turn-taking mode. `intelligent` uses the underlying model's
    /// native end-of-turn detection; `manual` ignores it and waits a fixed
    /// end-of-turn delay. Defaults to `intelligent`.
    public let turnTaking: VapiTranscriberTurnTaking?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        version: VapiTranscriberVersion? = nil,
        language: VapiTranscriberLanguage? = nil,
        languages: [VapiTranscriberLanguagesItem]? = nil,
        keywords: [String]? = nil,
        turnTaking: VapiTranscriberTurnTaking? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.version = version
        self.language = language
        self.languages = languages
        self.keywords = keywords
        self.turnTaking = turnTaking
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.version = try container.decodeIfPresent(VapiTranscriberVersion.self, forKey: .version)
        self.language = try container.decodeIfPresent(VapiTranscriberLanguage.self, forKey: .language)
        self.languages = try container.decodeIfPresent([VapiTranscriberLanguagesItem].self, forKey: .languages)
        self.keywords = try container.decodeIfPresent([String].self, forKey: .keywords)
        self.turnTaking = try container.decodeIfPresent(VapiTranscriberTurnTaking.self, forKey: .turnTaking)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.version, forKey: .version)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.languages, forKey: .languages)
        try container.encodeIfPresent(self.keywords, forKey: .keywords)
        try container.encodeIfPresent(self.turnTaking, forKey: .turnTaking)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case version
        case language
        case languages
        case keywords
        case turnTaking
    }
}