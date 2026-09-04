import Foundation

public final class SimulationsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Generates scenarios for an assistant or squad by analyzing its configuration with AI.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func simulationGenerateControllerGenerate(request: Requests.GenerateScenariosDto, requestOptions: RequestOptions? = nil) async throws -> GenerateScenariosResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/eval/simulation/scenario/generate",
            body: request,
            requestOptions: requestOptions,
            responseType: GenerateScenariosResponse.self
        )
    }

    /// Returns the simulations for the authenticated organization.
    ///
    /// - Parameter idAny: Return only simulations matching the provided ids
    /// - Parameter standaloneOnly: Only include simulations that are not part of a suite
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
    public func simulationControllerFindAll(idAny: String? = nil, standaloneOnly: Bool? = nil, page: Double? = nil, sortOrder: SimulationControllerFindAllRequestSortOrder? = nil, sortBy: SimulationControllerFindAllRequestSortBy? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> [Simulation] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/eval/simulation",
            queryParams: [
                "idAny": idAny.map { .string($0) }, 
                "standaloneOnly": standaloneOnly.map { .bool($0) }, 
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
            responseType: [Simulation].self
        )
    }

    /// Creates a simulation by pairing a scenario with a personality.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func simulationControllerCreate(request: Requests.CreateSimulationDto, requestOptions: RequestOptions? = nil) async throws -> Simulation {
        return try await httpClient.performRequest(
            method: .post,
            path: "/eval/simulation",
            body: request,
            requestOptions: requestOptions,
            responseType: Simulation.self
        )
    }

    /// Returns the specified simulation.
    ///
    /// - Parameter id: The unique identifier of the simulation.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func simulationControllerFindOne(id: String, requestOptions: RequestOptions? = nil) async throws -> Simulation {
        return try await httpClient.performRequest(
            method: .get,
            path: "/eval/simulation/\(id)",
            requestOptions: requestOptions,
            responseType: Simulation.self
        )
    }

    /// Deletes the specified simulation.
    ///
    /// - Parameter id: The unique identifier of the simulation.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func simulationControllerRemove(id: String, requestOptions: RequestOptions? = nil) async throws -> Simulation {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/eval/simulation/\(id)",
            requestOptions: requestOptions,
            responseType: Simulation.self
        )
    }

    /// Updates the specified simulation.
    ///
    /// - Parameter id: The unique identifier of the simulation.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func simulationControllerUpdate(id: String, request: Requests.UpdateSimulationDto, requestOptions: RequestOptions? = nil) async throws -> Simulation {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/eval/simulation/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Simulation.self
        )
    }

    /// Returns the organization's simulation concurrency limit, the number of active simulations, and how many more can start.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func simulationControllerGetConcurrency(requestOptions: RequestOptions? = nil) async throws -> SimulationConcurrencyResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/eval/simulation/concurrency",
            requestOptions: requestOptions,
            responseType: SimulationConcurrencyResponse.self
        )
    }
}