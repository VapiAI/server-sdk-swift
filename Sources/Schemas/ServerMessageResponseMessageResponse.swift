import Foundation

/// This is the response that is expected from the server to the message.
/// 
/// Note: Most messages don't expect a response. Only "assistant-request", "tool-calls" and "transfer-destination-request" do.
public enum ServerMessageResponseMessageResponse: Codable, Hashable, Sendable {
    case serverMessageResponseAssistantRequest(ServerMessageResponseAssistantRequest)
    case serverMessageResponseHandoffDestinationRequest(ServerMessageResponseHandoffDestinationRequest)
    case serverMessageResponseKnowledgeBaseRequest(ServerMessageResponseKnowledgeBaseRequest)
    case serverMessageResponseToolCalls(ServerMessageResponseToolCalls)
    case serverMessageResponseTransferDestinationRequest(ServerMessageResponseTransferDestinationRequest)
    case serverMessageResponseVoiceRequest(ServerMessageResponseVoiceRequest)
    case serverMessageResponseCallEndpointingRequest(ServerMessageResponseCallEndpointingRequest)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(ServerMessageResponseAssistantRequest.self) {
            self = .serverMessageResponseAssistantRequest(value)
        } else if let value = try? container.decode(ServerMessageResponseHandoffDestinationRequest.self) {
            self = .serverMessageResponseHandoffDestinationRequest(value)
        } else if let value = try? container.decode(ServerMessageResponseKnowledgeBaseRequest.self) {
            self = .serverMessageResponseKnowledgeBaseRequest(value)
        } else if let value = try? container.decode(ServerMessageResponseToolCalls.self) {
            self = .serverMessageResponseToolCalls(value)
        } else if let value = try? container.decode(ServerMessageResponseTransferDestinationRequest.self) {
            self = .serverMessageResponseTransferDestinationRequest(value)
        } else if let value = try? container.decode(ServerMessageResponseVoiceRequest.self) {
            self = .serverMessageResponseVoiceRequest(value)
        } else if let value = try? container.decode(ServerMessageResponseCallEndpointingRequest.self) {
            self = .serverMessageResponseCallEndpointingRequest(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Unexpected value."
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.singleValueContainer()
        switch self {
        case .serverMessageResponseAssistantRequest(let value):
            try container.encode(value)
        case .serverMessageResponseHandoffDestinationRequest(let value):
            try container.encode(value)
        case .serverMessageResponseKnowledgeBaseRequest(let value):
            try container.encode(value)
        case .serverMessageResponseToolCalls(let value):
            try container.encode(value)
        case .serverMessageResponseTransferDestinationRequest(let value):
            try container.encode(value)
        case .serverMessageResponseVoiceRequest(let value):
            try container.encode(value)
        case .serverMessageResponseCallEndpointingRequest(let value):
            try container.encode(value)
        }
    }
}