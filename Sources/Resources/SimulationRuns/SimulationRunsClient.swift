import Foundation

public final class SimulationRunsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns the simulation runs for the authenticated organization.
    ///
    /// - Parameter status: Filter by status
    /// - Parameter filterStatus: Filter by aggregate run result status
    /// - Parameter targetType: Filter by target type
    /// - Parameter targetId: Filter by target id
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
    public func simulationRunControllerFindAll(status: SimulationRunControllerFindAllRequestStatus? = nil, filterStatus: SimulationRunControllerFindAllRequestFilterStatus? = nil, targetType: SimulationRunControllerFindAllRequestTargetType? = nil, targetId: String? = nil, page: Double? = nil, sortOrder: SimulationRunControllerFindAllRequestSortOrder? = nil, sortBy: SimulationRunControllerFindAllRequestSortBy? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> SimulationRunControllerFindAllResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/eval/simulation/run",
            queryParams: [
                "status": status.map { .string($0.rawValue) }, 
                "filterStatus": filterStatus.map { .string($0.rawValue) }, 
                "targetType": targetType.map { .string($0.rawValue) }, 
                "targetId": targetId.map { .string($0) }, 
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
            responseType: SimulationRunControllerFindAllResponse.self
        )
    }

    /// Starts a simulation run against a target assistant or squad.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func simulationRunControllerCreate(request: Requests.CreateSimulationRunDto, requestOptions: RequestOptions? = nil) async throws -> CreateSimulationRunResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/eval/simulation/run",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateSimulationRunResponse.self
        )
    }

    /// Returns the specified simulation run, including its status and item counts.
    ///
    /// - Parameter id: The unique identifier of the simulation run.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func simulationRunControllerFindOne(id: String, requestOptions: RequestOptions? = nil) async throws -> SimulationRun {
        return try await httpClient.performRequest(
            method: .get,
            path: "/eval/simulation/run/\(id)",
            requestOptions: requestOptions,
            responseType: SimulationRun.self
        )
    }

    /// Cancels the specified simulation run.
    ///
    /// - Parameter id: The unique identifier of the simulation run.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func simulationRunControllerCancelGroup(id: String, requestOptions: RequestOptions? = nil) async throws -> SimulationRun {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/eval/simulation/run/\(id)",
            requestOptions: requestOptions,
            responseType: SimulationRun.self
        )
    }

    /// Returns the run items for the specified simulation run.
    ///
    /// - Parameter id: The unique identifier of the simulation run.
    /// - Parameter simulationId: Filters run items to a specific simulation.
    /// - Parameter runId: Filters run items to a specific run.
    /// - Parameter status: Filters run items by status.
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
    public func simulationRunControllerFindItems(id: String, simulationId: String? = nil, runId: String? = nil, status: SimulationRunControllerFindItemsRequestStatus? = nil, page: Double? = nil, sortOrder: SimulationRunControllerFindItemsRequestSortOrder? = nil, sortBy: SimulationRunControllerFindItemsRequestSortBy? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> [SimulationRunItem] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/eval/simulation/run/\(id)/item",
            queryParams: [
                "simulationId": simulationId.map { .string($0) }, 
                "runId": runId.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
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
            responseType: [SimulationRunItem].self
        )
    }

    /// Returns the specified run item, including its evaluation results and the ID of the call that ran it.
    ///
    /// - Parameter id: The unique identifier of the simulation run.
    /// - Parameter itemId: The unique identifier of the run item.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func simulationRunControllerFindItem(id: String, itemId: String, requestOptions: RequestOptions? = nil) async throws -> SimulationRunItem {
        return try await httpClient.performRequest(
            method: .get,
            path: "/eval/simulation/run/\(id)/item/\(itemId)",
            requestOptions: requestOptions,
            responseType: SimulationRunItem.self
        )
    }

    /// Cancels the specified run item.
    ///
    /// - Parameter id: The unique identifier of the simulation run.
    /// - Parameter itemId: The unique identifier of the run item.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func simulationRunControllerCancelItem(id: String, itemId: String, requestOptions: RequestOptions? = nil) async throws -> SimulationRunItem {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/eval/simulation/run/\(id)/item/\(itemId)",
            requestOptions: requestOptions,
            responseType: SimulationRunItem.self
        )
    }

    /// Generates AI suggestions for improving the assistant or squad's system prompt, tools, and scenarios, based on the specified run item.
    ///
    /// - Parameter id: The unique identifier of the simulation run.
    /// - Parameter itemId: The unique identifier of the run item.
    /// - Parameter force: Set to the string `true` to regenerate improvement suggestions even if they already exist.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func simulationRunControllerGenerateSuggestions(id: String, itemId: String, force: String, persist: String? = nil, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .post,
            path: "/eval/simulation/run/\(id)/item/\(itemId)/generate",
            queryParams: [
                "force": .string(force), 
                "persist": persist.map { .string($0) }
            ],
            requestOptions: requestOptions
        )
    }
}