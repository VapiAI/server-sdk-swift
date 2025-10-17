import Foundation

/// This is the type of output you'd like.
/// 
/// `string`, `number`, `integer`, `boolean` are the primitive types and should be obvious.
/// 
/// `array` and `object` are more interesting and quite powerful. They allow you to define nested structures.
/// 
/// For `array`, you can define the schema of the items in the array using the `items` property.
/// 
/// For `object`, you can define the properties of the object using the `properties` property.
public enum JsonSchemaType: String, Codable, Hashable, CaseIterable, Sendable {
    case string
    case number
    case integer
    case boolean
    case array
    case object
}