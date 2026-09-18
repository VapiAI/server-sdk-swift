import Foundation

public final class AnalyticsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Runs one or more metric queries against call or subscription data using the requested time range, groupings, and aggregate operations.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(request: Requests.AnalyticsQueryDto, requestOptions: RequestOptions? = nil) async throws -> [AnalyticsQueryResult] {
        return try await httpClient.performRequest(
            method: .post,
            path: "/analytics",
            body: request,
            requestOptions: requestOptions,
            responseType: [AnalyticsQueryResult].self
        )
    }
}