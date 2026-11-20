import Foundation

public enum OpenAiReasonerSkillToolsItem: Codable, Hashable, Sendable {
    case apiRequest(CreateApiRequestToolDto)
    case dtmf(CreateDtmfToolDto)
    case endCall(CreateEndCallToolDto)
    case function(CreateFunctionToolDto)
    case mcp(CreateMcpToolDto)
    case transferCall(CreateTransferCallToolDto)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "apiRequest":
            self = .apiRequest(try CreateApiRequestToolDto(from: decoder))
        case "dtmf":
            self = .dtmf(try CreateDtmfToolDto(from: decoder))
        case "endCall":
            self = .endCall(try CreateEndCallToolDto(from: decoder))
        case "function":
            self = .function(try CreateFunctionToolDto(from: decoder))
        case "mcp":
            self = .mcp(try CreateMcpToolDto(from: decoder))
        case "transferCall":
            self = .transferCall(try CreateTransferCallToolDto(from: decoder))
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
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .apiRequest(let data):
            try container.encode("apiRequest", forKey: .type)
            try data.encode(to: encoder)
        case .dtmf(let data):
            try container.encode("dtmf", forKey: .type)
            try data.encode(to: encoder)
        case .endCall(let data):
            try container.encode("endCall", forKey: .type)
            try data.encode(to: encoder)
        case .function(let data):
            try container.encode("function", forKey: .type)
            try data.encode(to: encoder)
        case .mcp(let data):
            try container.encode("mcp", forKey: .type)
            try data.encode(to: encoder)
        case .transferCall(let data):
            try container.encode("transferCall", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}