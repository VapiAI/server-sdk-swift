import Foundation

public final class SimulationScenariosClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns the scenarios for the authenticated organization.
    ///
    /// - Parameter idAny: Return only scenarios matching the provided ids
    /// - Parameter name: Search by scenario name
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
    public func scenarioControllerFindAll(idAny: String? = nil, name: String? = nil, page: Double? = nil, sortOrder: ScenarioControllerFindAllRequestSortOrder? = nil, sortBy: ScenarioControllerFindAllRequestSortBy? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> [Scenario] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/eval/simulation/scenario",
            queryParams: [
                "idAny": idAny.map { .string($0) }, 
                "name": name.map { .string($0) }, 
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
            responseType: [Scenario].self
        )
    }

    /// Creates a scenario, the AI tester's intent plus the success criteria that score a run.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func scenarioControllerCreate(request: CreateScenarioDto, requestOptions: RequestOptions? = nil) async throws -> Scenario {
        return try await httpClient.performRequest(
            method: .post,
            path: "/eval/simulation/scenario",
            body: request,
            requestOptions: requestOptions,
            responseType: Scenario.self
        )
    }

    /// Returns the specified scenario.
    ///
    /// - Parameter id: The unique identifier of the scenario.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func scenarioControllerFindOne(id: String, requestOptions: RequestOptions? = nil) async throws -> Scenario {
        return try await httpClient.performRequest(
            method: .get,
            path: "/eval/simulation/scenario/\(id)",
            requestOptions: requestOptions,
            responseType: Scenario.self
        )
    }

    /// Deletes the specified scenario.
    ///
    /// - Parameter id: The unique identifier of the scenario.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func scenarioControllerRemove(id: String, requestOptions: RequestOptions? = nil) async throws -> Scenario {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/eval/simulation/scenario/\(id)",
            requestOptions: requestOptions,
            responseType: Scenario.self
        )
    }

    /// Updates the specified scenario.
    ///
    /// - Parameter id: The unique identifier of the scenario.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func scenarioControllerUpdate(id: String, request: Requests.UpdateScenarioDto, requestOptions: RequestOptions? = nil) async throws -> Scenario {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/eval/simulation/scenario/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Scenario.self
        )
    }
}