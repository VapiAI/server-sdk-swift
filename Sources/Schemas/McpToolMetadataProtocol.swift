import Foundation

/// This is the protocol used for MCP communication. Defaults to Streamable HTTP.
public enum McpToolMetadataProtocol: String, Codable, Hashable, CaseIterable, Sendable {
    case sse
    case shttp
}