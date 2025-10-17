import Foundation

public final class ChatsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func list(assistantId: Nullable<String>? = nil, squadId: Nullable<String>? = nil, workflowId: Nullable<String>? = nil, sessionId: Nullable<String>? = nil, page: Nullable<Double>? = nil, sortOrder: Nullable<ChatsListRequestSortOrder>? = nil, limit: Nullable<Double>? = nil, createdAtGt: Nullable<Date>? = nil, createdAtLt: Nullable<Date>? = nil, createdAtGe: Nullable<Date>? = nil, createdAtLe: Nullable<Date>? = nil, updatedAtGt: Nullable<Date>? = nil, updatedAtLt: Nullable<Date>? = nil, updatedAtGe: Nullable<Date>? = nil, updatedAtLe: Nullable<Date>? = nil, requestOptions: RequestOptions? = nil) async throws -> ChatPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/chat",
            queryParams: [
                "assistantId": assistantId?.wrappedValue.map { .string($0) }, 
                "squadId": squadId?.wrappedValue.map { .string($0) }, 
                "workflowId": workflowId?.wrappedValue.map { .string($0) }, 
                "sessionId": sessionId?.wrappedValue.map { .string($0) }, 
                "page": page?.wrappedValue.map { .double($0) }, 
                "sortOrder": sortOrder?.wrappedValue.map { .string($0) }, 
                "limit": limit?.wrappedValue.map { .double($0) }, 
                "createdAtGt": createdAtGt?.wrappedValue.map { .date($0) }, 
                "createdAtLt": createdAtLt?.wrappedValue.map { .date($0) }, 
                "createdAtGe": createdAtGe?.wrappedValue.map { .date($0) }, 
                "createdAtLe": createdAtLe?.wrappedValue.map { .date($0) }, 
                "updatedAtGt": updatedAtGt?.wrappedValue.map { .date($0) }, 
                "updatedAtLt": updatedAtLt?.wrappedValue.map { .date($0) }, 
                "updatedAtGe": updatedAtGe?.wrappedValue.map { .date($0) }, 
                "updatedAtLe": updatedAtLe?.wrappedValue.map { .date($0) }
            ],
            requestOptions: requestOptions,
            responseType: ChatPaginatedResponse.self
        )
    }

    /// Creates a new chat with optional SMS delivery via transport field. Requires at least one of: assistantId/assistant, sessionId, or previousChatId. Note: sessionId and previousChatId are mutually exclusive. Transport field enables SMS delivery with two modes: (1) New conversation - provide transport.phoneNumberId and transport.customer to create a new session, (2) Existing conversation - provide sessionId to use existing session data. Cannot specify both sessionId and transport fields together. The transport.useLLMGeneratedMessageForOutbound flag controls whether input is processed by LLM (true, default) or forwarded directly as SMS (false).
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateChatDto, requestOptions: RequestOptions? = nil) async throws -> ChatsCreateResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/chat",
            body: request,
            requestOptions: requestOptions,
            responseType: ChatsCreateResponse.self
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

    public func createResponse(request: Requests.OpenAiResponsesRequest, requestOptions: RequestOptions? = nil) async throws -> ChatsCreateResponseResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/chat/responses",
            body: request,
            requestOptions: requestOptions,
            responseType: ChatsCreateResponseResponse.self
        )
    }
}