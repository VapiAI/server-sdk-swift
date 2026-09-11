import Foundation

public final class SquadsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns squads for the authenticated organization. Filter results by creation or update timestamps and limit the number returned.
    ///
    /// - Parameter idAny: Return only squads matching the provided ids
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
    public func list(idAny: String? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> [Squad] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/squad",
            queryParams: [
                "idAny": idAny.map { .string($0) }, 
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
            responseType: [Squad].self
        )
    }

    /// Creates a squad that coordinates multiple assistants and their handoffs during a conversation.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: CreateSquadDto, requestOptions: RequestOptions? = nil) async throws -> Squad {
        return try await httpClient.performRequest(
            method: .post,
            path: "/squad",
            body: request,
            requestOptions: requestOptions,
            responseType: Squad.self
        )
    }

    /// Returns the squad identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the squad.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> Squad {
        return try await httpClient.performRequest(
            method: .get,
            path: "/squad/\(id)",
            requestOptions: requestOptions,
            responseType: Squad.self
        )
    }

    /// Deletes the squad identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the squad.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> Squad {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/squad/\(id)",
            requestOptions: requestOptions,
            responseType: Squad.self
        )
    }

    /// Updates the specified fields of the squad identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the squad.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateSquadDto, requestOptions: RequestOptions? = nil) async throws -> Squad {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/squad/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Squad.self
        )
    }
}