import Foundation

public final class TrafficAllocationsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// The append-only history of an assistant's allocations, newest first. Traffic splitting is in beta, rolling out to select organizations; requests from organizations without access receive a 403.
    ///
    /// - Parameter assistantId: Filter to allocations for this assistant.
    /// - Parameter page: The page number to return. Defaults to 1.
    /// - Parameter limit: The maximum number of items to return. Defaults to 100.
    /// - Parameter sortOrder: The sort order for pagination. Defaults to 'DESC'.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func trafficAllocationControllerFindAllPaginated(assistantId: String? = nil, page: Int? = nil, limit: Int? = nil, sortOrder: TrafficAllocationControllerFindAllPaginatedRequestSortOrder? = nil, requestOptions: RequestOptions? = nil) async throws -> TrafficAllocationPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/traffic-allocations",
            queryParams: [
                "assistantId": assistantId.map { .string($0) }, 
                "page": page.map { .int($0) }, 
                "limit": limit.map { .int($0) }, 
                "sortOrder": sortOrder.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: TrafficAllocationPaginatedResponse.self
        )
    }

    /// Creates a new traffic allocation for an assistant, replacing the one currently in effect. To start or adjust a split, send targets naming published versions (such as "v7") with percentages totaling 100; allocationIntent is inferred as 'explicit'. To stop splitting and send every call to the newest published version, send allocationIntent 'follow-latest' with no targets field; stopping always names its intent, so a dropped targets field can never end a split by accident. Traffic splitting is in beta, rolling out to select organizations; requests from organizations without access receive a 403.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func trafficAllocationControllerCreate(request: Requests.CreateTrafficAllocationDto, requestOptions: RequestOptions? = nil) async throws -> TrafficAllocation {
        return try await httpClient.performRequest(
            method: .post,
            path: "/traffic-allocations",
            body: request,
            requestOptions: requestOptions,
            responseType: TrafficAllocation.self
        )
    }

    /// The allocation currently in effect for the assistant, with its targets. The response carries no allocation field when traffic splitting has never been configured. Traffic splitting is in beta, rolling out to select organizations; requests from organizations without access receive a 403.
    ///
    /// - Parameter assistantId: The assistant whose latest allocation to return.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func trafficAllocationControllerLatestGet(assistantId: String, requestOptions: RequestOptions? = nil) async throws -> TrafficAllocationLatestResponseDto {
        return try await httpClient.performRequest(
            method: .get,
            path: "/traffic-allocations/latest",
            queryParams: [
                "assistantId": .string(assistantId)
            ],
            requestOptions: requestOptions,
            responseType: TrafficAllocationLatestResponseDto.self
        )
    }

    /// Returns a single allocation by id, including its targets and actor attribution. Traffic splitting is in beta, rolling out to select organizations; requests from organizations without access receive a 403.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func trafficAllocationControllerFindOne(id: String, requestOptions: RequestOptions? = nil) async throws -> TrafficAllocation {
        return try await httpClient.performRequest(
            method: .get,
            path: "/traffic-allocations/\(id)",
            requestOptions: requestOptions,
            responseType: TrafficAllocation.self
        )
    }
}