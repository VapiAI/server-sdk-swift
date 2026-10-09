import Foundation

public final class SimulationPersonalitiesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns the personalities for the authenticated organization.
    ///
    /// - Parameter page: This is the page number to return. Defaults to 1.
    /// - Parameter sortOrder: This is the sort order for pagination. Defaults to 'DESC'.
    /// - Parameter sortBy: This is the column to sort by. Defaults to 'createdAt'.
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
    public func personalityControllerFindAll(page: Double? = nil, sortOrder: PersonalityControllerFindAllRequestSortOrder? = nil, sortBy: PersonalityControllerFindAllRequestSortBy? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> [Personality] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/eval/simulation/personality",
            queryParams: [
                "page": page.map { .double($0) }, 
                "sortOrder": sortOrder.map { .string($0.rawValue) }, 
                "sortBy": sortBy.map { .string($0.rawValue) }, 
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
            responseType: [Personality].self
        )
    }

    /// Creates a personality, the AI tester's configuration used in simulations.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func personalityControllerCreate(request: CreatePersonalityDto, requestOptions: RequestOptions? = nil) async throws -> Personality {
        return try await httpClient.performRequest(
            method: .post,
            path: "/eval/simulation/personality",
            body: request,
            requestOptions: requestOptions,
            responseType: Personality.self
        )
    }

    /// Returns the specified personality.
    ///
    /// - Parameter id: The unique identifier of the personality.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func personalityControllerFindOne(id: String, requestOptions: RequestOptions? = nil) async throws -> Personality {
        return try await httpClient.performRequest(
            method: .get,
            path: "/eval/simulation/personality/\(id)",
            requestOptions: requestOptions,
            responseType: Personality.self
        )
    }

    /// Deletes the specified personality.
    ///
    /// - Parameter id: The unique identifier of the personality.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func personalityControllerRemove(id: String, requestOptions: RequestOptions? = nil) async throws -> Personality {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/eval/simulation/personality/\(id)",
            requestOptions: requestOptions,
            responseType: Personality.self
        )
    }

    /// Updates the specified personality. Changes apply to future runs.
    ///
    /// - Parameter id: The unique identifier of the personality.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func personalityControllerUpdate(id: String, request: Requests.UpdatePersonalityDto, requestOptions: RequestOptions? = nil) async throws -> Personality {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/eval/simulation/personality/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Personality.self
        )
    }
}