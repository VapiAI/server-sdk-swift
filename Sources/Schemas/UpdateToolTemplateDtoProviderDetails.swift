import Foundation

public enum UpdateToolTemplateDtoProviderDetails: Codable, Hashable, Sendable {
    case make(Make)
    case ghl(Ghl)
    case function(Function)
    case googleCalendarEventCreate(GoogleCalendarEventCreate)
    case googleSheetsRowAppend(GoogleSheetsRowAppend)
    case gohighlevelCalendarAvailabilityCheck(GohighlevelCalendarAvailabilityCheck)
    case gohighlevelCalendarEventCreate(GohighlevelCalendarEventCreate)
    case gohighlevelContactCreate(GohighlevelContactCreate)
    case gohighlevelContactGet(GohighlevelContactGet)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "make":
            self = .make(try Make(from: decoder))
        case "ghl":
            self = .ghl(try Ghl(from: decoder))
        case "function":
            self = .function(try Function(from: decoder))
        case "google.calendar.event.create":
            self = .googleCalendarEventCreate(try GoogleCalendarEventCreate(from: decoder))
        case "google.sheets.row.append":
            self = .googleSheetsRowAppend(try GoogleSheetsRowAppend(from: decoder))
        case "gohighlevel.calendar.availability.check":
            self = .gohighlevelCalendarAvailabilityCheck(try GohighlevelCalendarAvailabilityCheck(from: decoder))
        case "gohighlevel.calendar.event.create":
            self = .gohighlevelCalendarEventCreate(try GohighlevelCalendarEventCreate(from: decoder))
        case "gohighlevel.contact.create":
            self = .gohighlevelContactCreate(try GohighlevelContactCreate(from: decoder))
        case "gohighlevel.contact.get":
            self = .gohighlevelContactGet(try GohighlevelContactGet(from: decoder))
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unknown shape discriminant value: \(discriminant)"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        switch self {
        case .make(let data):
            try data.encode(to: encoder)
        case .ghl(let data):
            try data.encode(to: encoder)
        case .function(let data):
            try data.encode(to: encoder)
        case .googleCalendarEventCreate(let data):
            try data.encode(to: encoder)
        case .googleSheetsRowAppend(let data):
            try data.encode(to: encoder)
        case .gohighlevelCalendarAvailabilityCheck(let data):
            try data.encode(to: encoder)
        case .gohighlevelCalendarEventCreate(let data):
            try data.encode(to: encoder)
        case .gohighlevelContactCreate(let data):
            try data.encode(to: encoder)
        case .gohighlevelContactGet(let data):
            try data.encode(to: encoder)
        }
    }

    public struct Make: Codable, Hashable, Sendable {
        public let type: String = "make"
        /// This is the Template URL or the Snapshot URL corresponding to the Template.
        public let templateUrl: String?
        public let setupInstructions: [ToolTemplateSetup]?
        public let scenarioId: Double?
        public let scenarioName: String?
        public let triggerHookId: Double?
        public let triggerHookName: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            templateUrl: String? = nil,
            setupInstructions: [ToolTemplateSetup]? = nil,
            scenarioId: Double? = nil,
            scenarioName: String? = nil,
            triggerHookId: Double? = nil,
            triggerHookName: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.templateUrl = templateUrl
            self.setupInstructions = setupInstructions
            self.scenarioId = scenarioId
            self.scenarioName = scenarioName
            self.triggerHookId = triggerHookId
            self.triggerHookName = triggerHookName
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.templateUrl = try container.decodeIfPresent(String.self, forKey: .templateUrl)
            self.setupInstructions = try container.decodeIfPresent([ToolTemplateSetup].self, forKey: .setupInstructions)
            self.scenarioId = try container.decodeIfPresent(Double.self, forKey: .scenarioId)
            self.scenarioName = try container.decodeIfPresent(String.self, forKey: .scenarioName)
            self.triggerHookId = try container.decodeIfPresent(Double.self, forKey: .triggerHookId)
            self.triggerHookName = try container.decodeIfPresent(String.self, forKey: .triggerHookName)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.templateUrl, forKey: .templateUrl)
            try container.encodeIfPresent(self.setupInstructions, forKey: .setupInstructions)
            try container.encodeIfPresent(self.scenarioId, forKey: .scenarioId)
            try container.encodeIfPresent(self.scenarioName, forKey: .scenarioName)
            try container.encodeIfPresent(self.triggerHookId, forKey: .triggerHookId)
            try container.encodeIfPresent(self.triggerHookName, forKey: .triggerHookName)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case templateUrl
            case setupInstructions
            case scenarioId
            case scenarioName
            case triggerHookId
            case triggerHookName
        }
    }

    public struct Ghl: Codable, Hashable, Sendable {
        public let type: String = "ghl"
        /// This is the Template URL or the Snapshot URL corresponding to the Template.
        public let templateUrl: String?
        public let setupInstructions: [ToolTemplateSetup]?
        public let workflowId: String?
        public let workflowName: String?
        public let webhookHookId: String?
        public let webhookHookName: String?
        public let locationId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            templateUrl: String? = nil,
            setupInstructions: [ToolTemplateSetup]? = nil,
            workflowId: String? = nil,
            workflowName: String? = nil,
            webhookHookId: String? = nil,
            webhookHookName: String? = nil,
            locationId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.templateUrl = templateUrl
            self.setupInstructions = setupInstructions
            self.workflowId = workflowId
            self.workflowName = workflowName
            self.webhookHookId = webhookHookId
            self.webhookHookName = webhookHookName
            self.locationId = locationId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.templateUrl = try container.decodeIfPresent(String.self, forKey: .templateUrl)
            self.setupInstructions = try container.decodeIfPresent([ToolTemplateSetup].self, forKey: .setupInstructions)
            self.workflowId = try container.decodeIfPresent(String.self, forKey: .workflowId)
            self.workflowName = try container.decodeIfPresent(String.self, forKey: .workflowName)
            self.webhookHookId = try container.decodeIfPresent(String.self, forKey: .webhookHookId)
            self.webhookHookName = try container.decodeIfPresent(String.self, forKey: .webhookHookName)
            self.locationId = try container.decodeIfPresent(String.self, forKey: .locationId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.templateUrl, forKey: .templateUrl)
            try container.encodeIfPresent(self.setupInstructions, forKey: .setupInstructions)
            try container.encodeIfPresent(self.workflowId, forKey: .workflowId)
            try container.encodeIfPresent(self.workflowName, forKey: .workflowName)
            try container.encodeIfPresent(self.webhookHookId, forKey: .webhookHookId)
            try container.encodeIfPresent(self.webhookHookName, forKey: .webhookHookName)
            try container.encodeIfPresent(self.locationId, forKey: .locationId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case templateUrl
            case setupInstructions
            case workflowId
            case workflowName
            case webhookHookId
            case webhookHookName
            case locationId
        }
    }

    public struct Function: Codable, Hashable, Sendable {
        public let type: String = "function"
        /// This is the Template URL or the Snapshot URL corresponding to the Template.
        public let templateUrl: String?
        public let setupInstructions: [ToolTemplateSetup]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            templateUrl: String? = nil,
            setupInstructions: [ToolTemplateSetup]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.templateUrl = templateUrl
            self.setupInstructions = setupInstructions
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.templateUrl = try container.decodeIfPresent(String.self, forKey: .templateUrl)
            self.setupInstructions = try container.decodeIfPresent([ToolTemplateSetup].self, forKey: .setupInstructions)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.templateUrl, forKey: .templateUrl)
            try container.encodeIfPresent(self.setupInstructions, forKey: .setupInstructions)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case templateUrl
            case setupInstructions
        }
    }

    public struct GoogleCalendarEventCreate: Codable, Hashable, Sendable {
        public let type: String = "google.calendar.event.create"
        /// This is the Template URL or the Snapshot URL corresponding to the Template.
        public let templateUrl: String?
        public let setupInstructions: [ToolTemplateSetup]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            templateUrl: String? = nil,
            setupInstructions: [ToolTemplateSetup]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.templateUrl = templateUrl
            self.setupInstructions = setupInstructions
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.templateUrl = try container.decodeIfPresent(String.self, forKey: .templateUrl)
            self.setupInstructions = try container.decodeIfPresent([ToolTemplateSetup].self, forKey: .setupInstructions)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.templateUrl, forKey: .templateUrl)
            try container.encodeIfPresent(self.setupInstructions, forKey: .setupInstructions)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case templateUrl
            case setupInstructions
        }
    }

    public struct GoogleSheetsRowAppend: Codable, Hashable, Sendable {
        public let type: String = "google.sheets.row.append"
        /// This is the Template URL or the Snapshot URL corresponding to the Template.
        public let templateUrl: String?
        public let setupInstructions: [ToolTemplateSetup]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            templateUrl: String? = nil,
            setupInstructions: [ToolTemplateSetup]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.templateUrl = templateUrl
            self.setupInstructions = setupInstructions
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.templateUrl = try container.decodeIfPresent(String.self, forKey: .templateUrl)
            self.setupInstructions = try container.decodeIfPresent([ToolTemplateSetup].self, forKey: .setupInstructions)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.templateUrl, forKey: .templateUrl)
            try container.encodeIfPresent(self.setupInstructions, forKey: .setupInstructions)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case templateUrl
            case setupInstructions
        }
    }

    public struct GohighlevelCalendarAvailabilityCheck: Codable, Hashable, Sendable {
        public let type: String = "gohighlevel.calendar.availability.check"
        /// This is the Template URL or the Snapshot URL corresponding to the Template.
        public let templateUrl: String?
        public let setupInstructions: [ToolTemplateSetup]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            templateUrl: String? = nil,
            setupInstructions: [ToolTemplateSetup]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.templateUrl = templateUrl
            self.setupInstructions = setupInstructions
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.templateUrl = try container.decodeIfPresent(String.self, forKey: .templateUrl)
            self.setupInstructions = try container.decodeIfPresent([ToolTemplateSetup].self, forKey: .setupInstructions)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.templateUrl, forKey: .templateUrl)
            try container.encodeIfPresent(self.setupInstructions, forKey: .setupInstructions)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case templateUrl
            case setupInstructions
        }
    }

    public struct GohighlevelCalendarEventCreate: Codable, Hashable, Sendable {
        public let type: String = "gohighlevel.calendar.event.create"
        /// This is the Template URL or the Snapshot URL corresponding to the Template.
        public let templateUrl: String?
        public let setupInstructions: [ToolTemplateSetup]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            templateUrl: String? = nil,
            setupInstructions: [ToolTemplateSetup]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.templateUrl = templateUrl
            self.setupInstructions = setupInstructions
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.templateUrl = try container.decodeIfPresent(String.self, forKey: .templateUrl)
            self.setupInstructions = try container.decodeIfPresent([ToolTemplateSetup].self, forKey: .setupInstructions)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.templateUrl, forKey: .templateUrl)
            try container.encodeIfPresent(self.setupInstructions, forKey: .setupInstructions)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case templateUrl
            case setupInstructions
        }
    }

    public struct GohighlevelContactCreate: Codable, Hashable, Sendable {
        public let type: String = "gohighlevel.contact.create"
        /// This is the Template URL or the Snapshot URL corresponding to the Template.
        public let templateUrl: String?
        public let setupInstructions: [ToolTemplateSetup]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            templateUrl: String? = nil,
            setupInstructions: [ToolTemplateSetup]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.templateUrl = templateUrl
            self.setupInstructions = setupInstructions
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.templateUrl = try container.decodeIfPresent(String.self, forKey: .templateUrl)
            self.setupInstructions = try container.decodeIfPresent([ToolTemplateSetup].self, forKey: .setupInstructions)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.templateUrl, forKey: .templateUrl)
            try container.encodeIfPresent(self.setupInstructions, forKey: .setupInstructions)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case templateUrl
            case setupInstructions
        }
    }

    public struct GohighlevelContactGet: Codable, Hashable, Sendable {
        public let type: String = "gohighlevel.contact.get"
        /// This is the Template URL or the Snapshot URL corresponding to the Template.
        public let templateUrl: String?
        public let setupInstructions: [ToolTemplateSetup]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            templateUrl: String? = nil,
            setupInstructions: [ToolTemplateSetup]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.templateUrl = templateUrl
            self.setupInstructions = setupInstructions
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.templateUrl = try container.decodeIfPresent(String.self, forKey: .templateUrl)
            self.setupInstructions = try container.decodeIfPresent([ToolTemplateSetup].self, forKey: .setupInstructions)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.templateUrl, forKey: .templateUrl)
            try container.encodeIfPresent(self.setupInstructions, forKey: .setupInstructions)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case templateUrl
            case setupInstructions
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}