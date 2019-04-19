import Foundation

public class JSONEquality {
    
    enum Errors : Error {
        case dataConversionError
        case jsonConversionError
    }
    
    /**
     Is the JSON in the **left** and **right** arguments logically equivalent?
     
     - parameter left: A JSON String
     - parameter right: A JSON String
     
     - throws: If either argument does not contain proper JSON.
     */
    public static func JSONEquals (_ left: String, _ right: String) throws -> Bool {
        if
            let leftData = left.data(using: .utf8),
            let leftDictionary = try JSONSerialization.jsonObject(with: leftData) as? [String:AnyObject],
            let rightData = right.data(using: .utf8),
            let rightDictionary = try JSONSerialization.jsonObject(with: rightData) as? [String:AnyObject]
        {
            return JSONEquality.equals(leftDictionary, rightDictionary)
        }
        return false
    }

    /**
     Is the Data in the **left** and **right** arguments logically equivalent?
     
     - parameter left: Data representing an encoded JSON object
     - parameter right: Data representing an encoded JSON object
     
     - throws: If either argument does not represent a proper JSON object.
     */
    public static func JSONEquals (_ left: Data, _ right: Data) throws -> Bool {
        return try JSONEquals (String (decoding: left, as: UTF8.self), String (decoding: right, as: UTF8.self))
    }
    
    /**
     Do the contents of the **left** and **right** arguments represent equivalent JSON data?
     
     - parameter left: A dictionary containing (deserialized) JSON data.
     - parameter right: A dictionary containing (deserialized) JSON data.
     */
    public static func equals (_ left: [String:AnyObject], _ right: [String:AnyObject]) -> Bool {
        if (left.count == right.count) {
            for key in left.keys {
                if right.keys.contains(key) {
                    if let leftObject = left[key], let rightObject = right[key], !JSONEquality.objectsEqual(leftObject, rightObject) {
                        return false
                    }
                } else {
                    return false
                }
            }
            return true
        } else {
            return false
        }
    }

/**
     Does **construct** encode to **json**?
     
     - parameter construct: The class or struct to be encoded
     - parameter json: String representation of the **JSON** which the encoded **construct** will be compared to
     - parameter encoder: Optional encoder used for encoding the **construct**
     
     - throws: If **JSON** does not contain proper json or there is an exception encoding.
*/
    public static func encodesTo<T:Encodable> (_ construct: T, json: String, encoder: JSONEncoder = JSONEncoder()) throws -> Bool {
        let constructData = try encoder.encode(construct)
        if let constructJson = String (data: constructData, encoding: .utf8) {
            return try JSONEquality.JSONEquals(json, constructJson)
        } else {
            throw Errors.jsonConversionError
        }
    }
    
/**
     Does **json** successfully decode to construct of **type** and then encode back to **json**?
     
     - parameter type: The type of the construct to which **json** should be decoded to.
     - parameter json: String representation of the JSON to be used for decoding
     - parameter decoder: Optional decoder used for decoding the **json*
     - parameter encoder: Optional encoder used for encoding the construct.
     
     - throws: If **json** does not contain proper JSON or there is an exception decoding/encoding.
*/
    public static func isFullyCodable<T:Codable> (type: T.Type, json: String, decoder: JSONDecoder = JSONDecoder(), encoder: JSONEncoder = JSONEncoder()) throws -> Bool {
        let jsonData = json.data(using: .utf8)
        if let jsonData = jsonData {
            let construct = try decoder.decode(type, from: jsonData)
            return try JSONEquality.encodesTo (construct, json: json, encoder: encoder)
        } else {
            throw Errors.dataConversionError
        }
    }
    
    internal static func objectsEqual (_ left: AnyObject, _ right: AnyObject) -> Bool {
        if let leftString = left as? String, let rightString = right as? String, leftString == rightString {
            return true
        } else if
            let leftStringArray = left as? [String],
            let rightStringArray = right as? [String],
            leftStringArray == rightStringArray
        {
            return true
        } else if let _ = left as? NSNull, let _ = right as? NSNull {
            return true
        } else if let leftNumber = left as? NSNumber, let rightNumber = right as? NSNumber, leftNumber == rightNumber {
            return true
        } else if let _ = left as? NSNumber {
            return false
        } else if let _ = right as? NSNumber {
            return false
        } else if let leftNumberArray = left as? [NSNumber], let rightNumberArray = right as? [NSNumber], leftNumberArray == rightNumberArray {
            return true
        } else if let _ = left as? [NSNumber] { // To prevent a number from being cast to a Bool and accidently matching
            return false
        } else if let _ = right as? [NSNumber] {
            return false
        } else if let leftBool = left as? Bool, let rightBool = right as? Bool, leftBool == rightBool {
            return true
        } else if let leftBoolArray = left as? [Bool], let rightBoolArray = right as? [Bool], leftBoolArray == rightBoolArray {
            return true
        } else if let leftDict = left as? [String:AnyObject], let rightDict = right as?[String:AnyObject], JSONEquality.equals (leftDict, rightDict) {
            return true
        } else if let leftNullArray = left as? [NSNull], let rightNullArray = right as? [NSNull], leftNullArray.count == rightNullArray.count {
            return true
        } else if let leftAnyObjectArray = left as? [AnyObject], let rightAnyObjectArray = right as? [AnyObject] {
            if leftAnyObjectArray.count == rightAnyObjectArray.count {
                for (index, leftObject) in leftAnyObjectArray.enumerated() {
                    if !JSONEquality.objectsEqual (leftObject, rightAnyObjectArray[index]) {
                        return false
                    }
                }
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
}

