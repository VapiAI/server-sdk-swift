import Foundation

public struct ToolVersion: Codable, Hashable, Sendable {
    /// Optional human-readable label for this version. Pass `null` to clear.
    public let versionName: Nullable<String>?
    /// Optional description for this version. Pass `null` to clear.
    public let versionDescription: Nullable<String>?
    public let type: [String: JSONValue]?
    public let function: Nullable<[String: JSONValue]>?
    public let messages: Nullable<[[String: JSONValue]]>?
    public let metadata: Nullable<[String: JSONValue]>?
    public let templateId: Nullable<String>?
    public let server: Nullable<Server>?
    public let async: Nullable<Bool>?
    public let destinations: Nullable<[[String: JSONValue]]>?
    public let name: Nullable<String>?
    public let subType: Nullable<String>?
    public let displayWidthPx: Nullable<Double>?
    public let displayHeightPx: Nullable<Double>?
    public let displayNumber: Nullable<Double>?
    public let knowledgeBases: Nullable<[[String: JSONValue]]>?
    public let url: Nullable<String>?
    public let method: Nullable<String>?
    public let headers: Nullable<[String: JSONValue]>?
    public let body: [String: JSONValue]?
    public let backoffPlan: Nullable<[String: JSONValue]>?
    public let timeoutSeconds: Nullable<Double>?
    public let description: Nullable<String>?
    public let variableExtractionPlan: Nullable<[String: JSONValue]>?
    public let rejectionPlan: Nullable<[String: JSONValue]>?
    public let credentialId: Nullable<String>?
    public let extendedDelayWhenPrecededByTextEnabled: Nullable<Bool>?
    public let beepDetectionEnabled: Nullable<Bool>?
    public let code: Nullable<String>?
    public let environmentVariables: Nullable<[[String: JSONValue]]>?
    public let parameters: Nullable<[[String: JSONValue]]>?
    public let encryptedPaths: Nullable<[String]>?
    public let sipInfoDtmfEnabled: Nullable<Bool>?
    public let verb: Nullable<String>?
    public let defaultResult: Nullable<String>?
    public let toolMessages: Nullable<[[String: JSONValue]]>?
    /// This is the unique identifier for the version row.
    public let id: String
    /// This is the unique identifier for the org that owns this version.
    public let orgId: String
    /// This is the unique identifier for the tool this version was snapshotted from.
    public let toolId: String
    /// This is the public monotonic version label, e.g. "v1".
    /// System-owned and incremented per tool; never user-supplied.
    public let version: String
    /// This is the SHA-256 hex of the snapshotted content used for no-op detection.
    public let configHash: String
    /// This is the prior version label (vN-1). Null on v1 or for branch roots.
    public let parentVersion: Nullable<String>?
    /// This is the actor that wrote this version. Email when created via JWT, null when created via API.
    public let createdBy: Nullable<String>?
    /// This is the soft-delete timestamp. Null when active.
    public let deletedAt: Nullable<Date>?
    /// This is the ISO 8601 date-time string of when the version was created.
    public let createdAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        versionName: Nullable<String>? = nil,
        versionDescription: Nullable<String>? = nil,
        type: [String: JSONValue]? = nil,
        function: Nullable<[String: JSONValue]>? = nil,
        messages: Nullable<[[String: JSONValue]]>? = nil,
        metadata: Nullable<[String: JSONValue]>? = nil,
        templateId: Nullable<String>? = nil,
        server: Nullable<Server>? = nil,
        async: Nullable<Bool>? = nil,
        destinations: Nullable<[[String: JSONValue]]>? = nil,
        name: Nullable<String>? = nil,
        subType: Nullable<String>? = nil,
        displayWidthPx: Nullable<Double>? = nil,
        displayHeightPx: Nullable<Double>? = nil,
        displayNumber: Nullable<Double>? = nil,
        knowledgeBases: Nullable<[[String: JSONValue]]>? = nil,
        url: Nullable<String>? = nil,
        method: Nullable<String>? = nil,
        headers: Nullable<[String: JSONValue]>? = nil,
        body: [String: JSONValue]? = nil,
        backoffPlan: Nullable<[String: JSONValue]>? = nil,
        timeoutSeconds: Nullable<Double>? = nil,
        description: Nullable<String>? = nil,
        variableExtractionPlan: Nullable<[String: JSONValue]>? = nil,
        rejectionPlan: Nullable<[String: JSONValue]>? = nil,
        credentialId: Nullable<String>? = nil,
        extendedDelayWhenPrecededByTextEnabled: Nullable<Bool>? = nil,
        beepDetectionEnabled: Nullable<Bool>? = nil,
        code: Nullable<String>? = nil,
        environmentVariables: Nullable<[[String: JSONValue]]>? = nil,
        parameters: Nullable<[[String: JSONValue]]>? = nil,
        encryptedPaths: Nullable<[String]>? = nil,
        sipInfoDtmfEnabled: Nullable<Bool>? = nil,
        verb: Nullable<String>? = nil,
        defaultResult: Nullable<String>? = nil,
        toolMessages: Nullable<[[String: JSONValue]]>? = nil,
        id: String,
        orgId: String,
        toolId: String,
        version: String,
        configHash: String,
        parentVersion: Nullable<String>? = nil,
        createdBy: Nullable<String>? = nil,
        deletedAt: Nullable<Date>? = nil,
        createdAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.versionName = versionName
        self.versionDescription = versionDescription
        self.type = type
        self.function = function
        self.messages = messages
        self.metadata = metadata
        self.templateId = templateId
        self.server = server
        self.async = async
        self.destinations = destinations
        self.name = name
        self.subType = subType
        self.displayWidthPx = displayWidthPx
        self.displayHeightPx = displayHeightPx
        self.displayNumber = displayNumber
        self.knowledgeBases = knowledgeBases
        self.url = url
        self.method = method
        self.headers = headers
        self.body = body
        self.backoffPlan = backoffPlan
        self.timeoutSeconds = timeoutSeconds
        self.description = description
        self.variableExtractionPlan = variableExtractionPlan
        self.rejectionPlan = rejectionPlan
        self.credentialId = credentialId
        self.extendedDelayWhenPrecededByTextEnabled = extendedDelayWhenPrecededByTextEnabled
        self.beepDetectionEnabled = beepDetectionEnabled
        self.code = code
        self.environmentVariables = environmentVariables
        self.parameters = parameters
        self.encryptedPaths = encryptedPaths
        self.sipInfoDtmfEnabled = sipInfoDtmfEnabled
        self.verb = verb
        self.defaultResult = defaultResult
        self.toolMessages = toolMessages
        self.id = id
        self.orgId = orgId
        self.toolId = toolId
        self.version = version
        self.configHash = configHash
        self.parentVersion = parentVersion
        self.createdBy = createdBy
        self.deletedAt = deletedAt
        self.createdAt = createdAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.versionName = try container.decodeNullableIfPresent(String.self, forKey: .versionName)
        self.versionDescription = try container.decodeNullableIfPresent(String.self, forKey: .versionDescription)
        self.type = try container.decodeIfPresent([String: JSONValue].self, forKey: .type)
        self.function = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .function)
        self.messages = try container.decodeNullableIfPresent([[String: JSONValue]].self, forKey: .messages)
        self.metadata = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .metadata)
        self.templateId = try container.decodeNullableIfPresent(String.self, forKey: .templateId)
        self.server = try container.decodeNullableIfPresent(Server.self, forKey: .server)
        self.async = try container.decodeNullableIfPresent(Bool.self, forKey: .async)
        self.destinations = try container.decodeNullableIfPresent([[String: JSONValue]].self, forKey: .destinations)
        self.name = try container.decodeNullableIfPresent(String.self, forKey: .name)
        self.subType = try container.decodeNullableIfPresent(String.self, forKey: .subType)
        self.displayWidthPx = try container.decodeNullableIfPresent(Double.self, forKey: .displayWidthPx)
        self.displayHeightPx = try container.decodeNullableIfPresent(Double.self, forKey: .displayHeightPx)
        self.displayNumber = try container.decodeNullableIfPresent(Double.self, forKey: .displayNumber)
        self.knowledgeBases = try container.decodeNullableIfPresent([[String: JSONValue]].self, forKey: .knowledgeBases)
        self.url = try container.decodeNullableIfPresent(String.self, forKey: .url)
        self.method = try container.decodeNullableIfPresent(String.self, forKey: .method)
        self.headers = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .headers)
        self.body = try container.decodeIfPresent([String: JSONValue].self, forKey: .body)
        self.backoffPlan = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .backoffPlan)
        self.timeoutSeconds = try container.decodeNullableIfPresent(Double.self, forKey: .timeoutSeconds)
        self.description = try container.decodeNullableIfPresent(String.self, forKey: .description)
        self.variableExtractionPlan = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .variableExtractionPlan)
        self.rejectionPlan = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .rejectionPlan)
        self.credentialId = try container.decodeNullableIfPresent(String.self, forKey: .credentialId)
        self.extendedDelayWhenPrecededByTextEnabled = try container.decodeNullableIfPresent(Bool.self, forKey: .extendedDelayWhenPrecededByTextEnabled)
        self.beepDetectionEnabled = try container.decodeNullableIfPresent(Bool.self, forKey: .beepDetectionEnabled)
        self.code = try container.decodeNullableIfPresent(String.self, forKey: .code)
        self.environmentVariables = try container.decodeNullableIfPresent([[String: JSONValue]].self, forKey: .environmentVariables)
        self.parameters = try container.decodeNullableIfPresent([[String: JSONValue]].self, forKey: .parameters)
        self.encryptedPaths = try container.decodeNullableIfPresent([String].self, forKey: .encryptedPaths)
        self.sipInfoDtmfEnabled = try container.decodeNullableIfPresent(Bool.self, forKey: .sipInfoDtmfEnabled)
        self.verb = try container.decodeNullableIfPresent(String.self, forKey: .verb)
        self.defaultResult = try container.decodeNullableIfPresent(String.self, forKey: .defaultResult)
        self.toolMessages = try container.decodeNullableIfPresent([[String: JSONValue]].self, forKey: .toolMessages)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.toolId = try container.decode(String.self, forKey: .toolId)
        self.version = try container.decode(String.self, forKey: .version)
        self.configHash = try container.decode(String.self, forKey: .configHash)
        self.parentVersion = try container.decodeNullableIfPresent(String.self, forKey: .parentVersion)
        self.createdBy = try container.decodeNullableIfPresent(String.self, forKey: .createdBy)
        self.deletedAt = try container.decodeNullableIfPresent(Date.self, forKey: .deletedAt)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.versionName, forKey: .versionName)
        try container.encodeNullableIfPresent(self.versionDescription, forKey: .versionDescription)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeNullableIfPresent(self.function, forKey: .function)
        try container.encodeNullableIfPresent(self.messages, forKey: .messages)
        try container.encodeNullableIfPresent(self.metadata, forKey: .metadata)
        try container.encodeNullableIfPresent(self.templateId, forKey: .templateId)
        try container.encodeNullableIfPresent(self.server, forKey: .server)
        try container.encodeNullableIfPresent(self.async, forKey: .async)
        try container.encodeNullableIfPresent(self.destinations, forKey: .destinations)
        try container.encodeNullableIfPresent(self.name, forKey: .name)
        try container.encodeNullableIfPresent(self.subType, forKey: .subType)
        try container.encodeNullableIfPresent(self.displayWidthPx, forKey: .displayWidthPx)
        try container.encodeNullableIfPresent(self.displayHeightPx, forKey: .displayHeightPx)
        try container.encodeNullableIfPresent(self.displayNumber, forKey: .displayNumber)
        try container.encodeNullableIfPresent(self.knowledgeBases, forKey: .knowledgeBases)
        try container.encodeNullableIfPresent(self.url, forKey: .url)
        try container.encodeNullableIfPresent(self.method, forKey: .method)
        try container.encodeNullableIfPresent(self.headers, forKey: .headers)
        try container.encodeIfPresent(self.body, forKey: .body)
        try container.encodeNullableIfPresent(self.backoffPlan, forKey: .backoffPlan)
        try container.encodeNullableIfPresent(self.timeoutSeconds, forKey: .timeoutSeconds)
        try container.encodeNullableIfPresent(self.description, forKey: .description)
        try container.encodeNullableIfPresent(self.variableExtractionPlan, forKey: .variableExtractionPlan)
        try container.encodeNullableIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
        try container.encodeNullableIfPresent(self.credentialId, forKey: .credentialId)
        try container.encodeNullableIfPresent(self.extendedDelayWhenPrecededByTextEnabled, forKey: .extendedDelayWhenPrecededByTextEnabled)
        try container.encodeNullableIfPresent(self.beepDetectionEnabled, forKey: .beepDetectionEnabled)
        try container.encodeNullableIfPresent(self.code, forKey: .code)
        try container.encodeNullableIfPresent(self.environmentVariables, forKey: .environmentVariables)
        try container.encodeNullableIfPresent(self.parameters, forKey: .parameters)
        try container.encodeNullableIfPresent(self.encryptedPaths, forKey: .encryptedPaths)
        try container.encodeNullableIfPresent(self.sipInfoDtmfEnabled, forKey: .sipInfoDtmfEnabled)
        try container.encodeNullableIfPresent(self.verb, forKey: .verb)
        try container.encodeNullableIfPresent(self.defaultResult, forKey: .defaultResult)
        try container.encodeNullableIfPresent(self.toolMessages, forKey: .toolMessages)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.toolId, forKey: .toolId)
        try container.encode(self.version, forKey: .version)
        try container.encode(self.configHash, forKey: .configHash)
        try container.encodeNullableIfPresent(self.parentVersion, forKey: .parentVersion)
        try container.encodeNullableIfPresent(self.createdBy, forKey: .createdBy)
        try container.encodeNullableIfPresent(self.deletedAt, forKey: .deletedAt)
        try container.encode(self.createdAt, forKey: .createdAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case versionName
        case versionDescription
        case type
        case function
        case messages
        case metadata
        case templateId
        case server
        case async
        case destinations
        case name
        case subType
        case displayWidthPx
        case displayHeightPx
        case displayNumber
        case knowledgeBases
        case url
        case method
        case headers
        case body
        case backoffPlan
        case timeoutSeconds
        case description
        case variableExtractionPlan
        case rejectionPlan
        case credentialId
        case extendedDelayWhenPrecededByTextEnabled
        case beepDetectionEnabled
        case code
        case environmentVariables
        case parameters
        case encryptedPaths
        case sipInfoDtmfEnabled
        case verb
        case defaultResult
        case toolMessages
        case id
        case orgId
        case toolId
        case version
        case configHash
        case parentVersion
        case createdBy
        case deletedAt
        case createdAt
    }
}