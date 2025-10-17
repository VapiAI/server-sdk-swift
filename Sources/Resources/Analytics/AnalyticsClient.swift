import Foundation

public final class AnalyticsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

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