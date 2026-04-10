import Foundation

public final class ChatsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func list(id: String? = nil, assistantId: String? = nil, assistantIdAny: String? = nil, squadId: String? = nil, sessionId: String? = nil, previousChatId: String? = nil, page: Double? = nil, sortOrder: ListChatsRequestSortOrder? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> ChatPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/chat",
            queryParams: [
                "id": id.map { .string($0) }, 
                "assistantId": assistantId.map { .string($0) }, 
                "assistantIdAny": assistantIdAny.map { .string($0) }, 
                "squadId": squadId.map { .string($0) }, 
                "sessionId": sessionId.map { .string($0) }, 
                "previousChatId": previousChatId.map { .string($0) }, 
                "page": page.map { .double($0) }, 
                "sortOrder": sortOrder.map { .string($0.rawValue) }, 
                "limit": limit.map { .double($0) }, 
                "createdAtGt": createdAtGt.map { .date($0) }, 
                "createdAtLt": createdAtLt.map { .date($0) }, 
                "createdAtGe": createdAtGe.map { .date($0) }, 
                "createdAtLe": createdAtLe.map { .date($0) }, 
                "updatedAtGt": updatedAtGt.map { .date($0) }, 
                "updatedAtLt": updatedAtLt.map { .date($0) }, 
                "updatedAtGe": updatedAtGe.map { .date($0) }, 
                "updatedAtLe": updatedAtLe.map { .date($0) }
            ],
            requestOptions: requestOptions,
            responseType: ChatPaginatedResponse.self
        )
    }

    /// Creates a new chat with optional SMS delivery via transport field. Requires at least one of: assistantId/assistant, sessionId, or previousChatId. Note: sessionId and previousChatId are mutually exclusive. Transport field enables SMS delivery with two modes: (1) New conversation - provide transport.phoneNumberId and transport.customer to create a new session, (2) Existing conversation - provide sessionId to use existing session data. Cannot specify both sessionId and transport fields together. The transport.useLLMGeneratedMessageForOutbound flag controls whether input is processed by LLM (true, default) or forwarded directly as SMS (false).
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateChatDto, requestOptions: RequestOptions? = nil) async throws -> CreateChatsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/chat",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateChatsResponse.self
        )
    }

    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> Chat {
        return try await httpClient.performRequest(
            method: .get,
            path: "/chat/\(id)",
            requestOptions: requestOptions,
            responseType: Chat.self
        )
    }

    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> Chat {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/chat/\(id)",
            requestOptions: requestOptions,
            responseType: Chat.self
        )
    }

    public func createResponse(request: Requests.OpenAiResponsesRequest, requestOptions: RequestOptions? = nil) async throws -> CreateResponseChatsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/chat/responses",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateResponseChatsResponse.self
        )
    }
}