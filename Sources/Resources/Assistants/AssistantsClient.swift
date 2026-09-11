import Foundation

public final class AssistantsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns assistants for the authenticated organization. Filter results by creation or update timestamps and limit the number returned.
    ///
    /// - Parameter limit: This is the maximum number of items to return. Defaults to 100.
    /// - Parameter createdAtGt: This will return items where the createdAt is greater than the specified value.
    /// - Parameter createdAtLt: This will return items where the createdAt is less than the specified value.
    /// - Parameter createdAtGe: This will return items where the createdAt is greater than or equal to the specified value.
    /// - Parameter createdAtLe: This will return items where the createdAt is less than or equal to the specified value.
    /// - Parameter updatedAtGt: This will return items where the updatedAt is greater than the specified value.
    /// - Parameter updatedAtLt: This will return items where the updatedAt is less than the specified value.
    /// - Parameter updatedAtGe: This will return items where the updatedAt is greater than or equal to the specified value.
    /// - Parameter updatedAtLe: This will return items where the updatedAt is less than or equal to the specified value.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> [Assistant] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/assistant",
            queryParams: [
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
            responseType: [Assistant].self
        )
    }

    /// Creates a reusable assistant configuration containing the model, voice, transcriber, tools, prompts, and call behavior.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: CreateAssistantDto, requestOptions: RequestOptions? = nil) async throws -> Assistant {
        return try await httpClient.performRequest(
            method: .post,
            path: "/assistant",
            body: request,
            requestOptions: requestOptions,
            responseType: Assistant.self
        )
    }

    public func assistantControllerValidateBackgroundSoundUrl(request: Requests.ValidateBackgroundSoundUrlDto, requestOptions: RequestOptions? = nil) async throws -> BackgroundSoundUrlValidationResult {
        return try await httpClient.performRequest(
            method: .post,
            path: "/assistant/background-sound/validate",
            body: request,
            requestOptions: requestOptions,
            responseType: BackgroundSoundUrlValidationResult.self
        )
    }

    /// Returns the assistant identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the assistant.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> Assistant {
        return try await httpClient.performRequest(
            method: .get,
            path: "/assistant/\(id)",
            requestOptions: requestOptions,
            responseType: Assistant.self
        )
    }

    /// Deletes the assistant identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the assistant.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> Assistant {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/assistant/\(id)",
            requestOptions: requestOptions,
            responseType: Assistant.self
        )
    }

    /// Updates the specified fields of the assistant identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the assistant.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateAssistantDto, requestOptions: RequestOptions? = nil) async throws -> Assistant {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/assistant/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Assistant.self
        )
    }
}