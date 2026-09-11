import Foundation

public final class PhoneNumbersClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns phone numbers for the authenticated organization. Filter results by creation or update timestamps and limit the number returned.
    ///
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

    /// Creates a Vapi phone number or imports a phone number from a supported provider, including Twilio, Vonage, Telnyx, or a bring-your-own provider.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: CreatePhoneNumbersRequest, requestOptions: RequestOptions? = nil) async throws -> CreatePhoneNumbersResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/phone-number",
            body: request,
            requestOptions: requestOptions,
            responseType: CreatePhoneNumbersResponse.self
        )
    }

    /// Returns a paginated list of phone numbers for the authenticated organization. Search by name, number, or SIP URI using a partial, case-insensitive match, and filter by creation or update timestamps.
    ///
    /// - Parameter search: This will search phone numbers by name, number, or SIP URI (partial match, case-insensitive).
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
    public func phoneNumberControllerFindAllPaginated(search: String? = nil, page: Double? = nil, sortOrder: PhoneNumberControllerFindAllPaginatedRequestSortOrder? = nil, sortBy: PhoneNumberControllerFindAllPaginatedRequestSortBy? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> PhoneNumberPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v2/phone-number",
            queryParams: [
                "search": search.map { .string($0) }, 
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
            responseType: PhoneNumberPaginatedResponse.self
        )
    }

    /// Returns the phone number resource identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the phone number.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> GetPhoneNumbersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/phone-number/\(id)",
            requestOptions: requestOptions,
            responseType: GetPhoneNumbersResponse.self
        )
    }

    /// Deletes the phone number resource identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the phone number.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> DeletePhoneNumbersResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/phone-number/\(id)",
            requestOptions: requestOptions,
            responseType: DeletePhoneNumbersResponse.self
        )
    }

    /// Updates the specified fields of the phone number resource identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the phone number.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
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