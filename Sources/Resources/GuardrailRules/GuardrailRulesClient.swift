import Foundation

public final class GuardrailRulesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func guardrailRulesControllerList(limit: Double? = nil, search: String? = nil, packId: String? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> [GuardrailRule] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/guardrail/rules",
            queryParams: [
                "limit": limit.map { .double($0) }, 
                "search": search.map { .string($0) }, 
                "packId": packId.map { .string($0) }, 
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
            responseType: [GuardrailRule].self
        )
    }

    public func guardrailRulesControllerPaginated(limit: Double? = nil, search: String? = nil, packId: String? = nil, sortBy: GuardrailRulesControllerPaginatedRequestSortBy? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, page: Double? = nil, sortOrder: GuardrailRulesControllerPaginatedRequestSortOrder? = nil, requestOptions: RequestOptions? = nil) async throws -> GuardrailRulesPage {
        return try await httpClient.performRequest(
            method: .get,
            path: "/guardrail/rules/paginated",
            queryParams: [
                "limit": limit.map { .double($0) }, 
                "search": search.map { .string($0) }, 
                "packId": packId.map { .string($0) }, 
                "sortBy": sortBy.map { .string($0.rawValue) }, 
                "createdAtGt": createdAtGt.map { .date($0) }, 
                "createdAtLt": createdAtLt.map { .date($0) }, 
                "createdAtGe": createdAtGe.map { .date($0) }, 
                "createdAtLe": createdAtLe.map { .date($0) }, 
                "updatedAtGt": updatedAtGt.map { .date($0) }, 
                "updatedAtLt": updatedAtLt.map { .date($0) }, 
                "updatedAtGe": updatedAtGe.map { .date($0) }, 
                "updatedAtLe": updatedAtLe.map { .date($0) }, 
                "page": page.map { .double($0) }, 
                "sortOrder": sortOrder.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: GuardrailRulesPage.self
        )
    }

    public func guardrailRulesControllerFind(id: String, requestOptions: RequestOptions? = nil) async throws -> GuardrailRule {
        return try await httpClient.performRequest(
            method: .get,
            path: "/guardrail/rules/\(id)",
            requestOptions: requestOptions,
            responseType: GuardrailRule.self
        )
    }
}