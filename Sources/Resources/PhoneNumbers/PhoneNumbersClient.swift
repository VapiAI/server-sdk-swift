import Foundation

public final class PhoneNumbersClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func list(limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> [ListPhoneNumbersResponseItem] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/phone-number",
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
            responseType: [ListPhoneNumbersResponseItem].self
        )
    }

    public func create(request: CreatePhoneNumbersRequest, requestOptions: RequestOptions? = nil) async throws -> CreatePhoneNumbersResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/phone-number",
            body: request,
            requestOptions: requestOptions,
            responseType: CreatePhoneNumbersResponse.self
        )
    }

    public func phoneNumberControllerFindAllPaginated(search: String? = nil, page: Double? = nil, sortOrder: PhoneNumberControllerFindAllPaginatedRequestSortOrder? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> PhoneNumberPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v2/phone-number",
            queryParams: [
                "search": search.map { .string($0) }, 
                "page": page.map { .double($0) }, 
                "sortOrder": sortOrder.map { .string($0.rawValue) }, 
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
            responseType: PhoneNumberPaginatedResponse.self
        )
    }

    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> GetPhoneNumbersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/phone-number/\(id)",
            requestOptions: requestOptions,
            responseType: GetPhoneNumbersResponse.self
        )
    }

    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> DeletePhoneNumbersResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/phone-number/\(id)",
            requestOptions: requestOptions,
            responseType: DeletePhoneNumbersResponse.self
        )
    }

    public func update(id: String, request: UpdatePhoneNumbersRequestBody, requestOptions: RequestOptions? = nil) async throws -> UpdatePhoneNumbersResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/phone-number/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdatePhoneNumbersResponse.self
        )
    }
}