import XCTest
@testable import JSONEquality

final class JSONEqualityTests: XCTestCase {
    
    func testEqualsJsonStrings() throws {
        // Equal JSON
        // String Values
        try XCTAssertTrue (JSONEquality.JSONEquals ("{}", "{}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"s1\":\"\"}", "{\"s1\":\"\"}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"s1\":\"a\"}", "{\"s1\":\"a\"}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"s1\":\"a\",\"s2\":\"b\"}", "{\"s1\":\"a\",\"s2\":\"b\"}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"s1\":\"a\",\"s2\":\"b\"}", "{\"s2\":\"b\",\"s1\":\"a\"}"))
        // With Whitespace
        try XCTAssertTrue (JSONEquality.JSONEquals ("{ }", "{}"))
        try XCTAssertTrue (JSONEquality.JSONEquals (" {\"s1\":\"\"}", "{\"s1\":\"\"}"))
        try XCTAssertTrue (JSONEquality.JSONEquals (" { \"s1\":\"a\" }", "{\"s1\":\"a\"}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"s1\":\"a\", \"s2\":\"b\"}", "{\"s1\":\"a\",\"s2\":\"b\"}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"s1\":\"a\" , \"s2\":\"b\"}", "{\"s2\":\"b\",\"s1\":\"a\"}"))
        // Arrays of Strings
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"s1\":[]}", "{\"s1\":[]}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"s1\":[\"a\"]}", "{\"s1\":[\"a\"]}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"s1\":[\"a\",\"b\"],\"s2\":[\"c\",\"d\"]}", "{\"s1\":[\"a\",\"b\"],\"s2\":[\"c\",\"d\"]}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"s1\":[\"a\",\"b\"],\"s2\":[\"c\",\"d\"]}", "{\"s2\":[\"c\",\"d\"],\"s1\":[\"a\",\"b\"]}"))
        // Integer Values
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"i1\":1}", "{\"i1\":1}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"i1\":1,\"i2\":2}", "{\"i1\":1,\"i2\":2}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"i1\":1,\"i2\":2}", "{\"i2\":2,\"i1\":1}"))
        // With Whitespace
        try XCTAssertTrue (JSONEquality.JSONEquals (" { \"i1\":1 }", "{\"i1\":1}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"i1\":1, \"i2\":2}", "{\"i1\":1,\"i2\":2}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"i1\":1 , \"i2\":2}", "{\"i2\":2,\"i1\":1}"))
        // Arrays of Integers        try XCTAssertTrue (JSONDictionary.JSONEquals ("{\"i1\":[1]}", "{\"i1\":[1]}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"i1\":[1,2],\"i2\":[3,4]}", "{\"i1\":[1,2],\"i2\":[3,4]}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"i1\":[1,2],\"i2\":[3,4]}", "{\"i2\":[3,4],\"i1\":[1,2]}"))
        // Double Values
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"d1\":1.1}", "{\"d1\":1.1}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"d1\":1.1,\"d2\":2.2}", "{\"d1\":1.1,\"d2\":2.2}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"d1\":1.1,\"d2\":2.2}", "{\"d2\":2.2,\"d1\":1.1}"))
        // With Whitespace
        try XCTAssertTrue (JSONEquality.JSONEquals (" { \"d1\":1.1 }", "{\"d1\":1.1}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"d1\":1.1, \"d2\":2.2}", "{\"d1\":1.1,\"d2\":2.2}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"d1\":1.1 , \"d2\":2.2}", "{\"d2\":2.2,\"d1\":1.1}"))
        // Array of Double
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"d1\":[1.1]}", "{\"d1\":[1.1]}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"d1\":[1.1,2.2],\"d2\":[3.3,4.4]}", "{\"d1\":[1.1,2.2],\"d2\":[3.3,4.4]}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"d1\":[1.1,2.2],\"d2\":[3.3,4.4]}", "{\"d2\":[3.3,4.4],\"d1\":[1.1,2.2]}"))
        // Boolean Values
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"d1\":true}", "{\"d1\":true}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"d1\":true,\"d2\":false}", "{\"d1\":true,\"d2\":false}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"d1\":true,\"d2\":false}", "{\"d2\":false,\"d1\":true}"))
        // With Whitespace
        try XCTAssertTrue (JSONEquality.JSONEquals (" { \"d1\":true }", "{\"d1\":true}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"d1\":true, \"d2\":false}", "{\"d1\":true,\"d2\":false}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"d1\":true , \"d2\":false}", "{\"d2\":false,\"d1\":true}"))
        // Array of Boolean
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"d1\":[true]}", "{\"d1\":[true]}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"d1\":[true,false],\"d2\":[true,false]}", "{\"d1\":[true,false],\"d2\":[true,false]}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"d1\":[true,false],\"d2\":[true,false]}", "{\"d2\":[true,false],\"d1\":[true,false]}"))
        // Null Values
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"d1\":null}", "{\"d1\":null}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"d1\":null,\"d2\":null}", "{\"d1\":null,\"d2\":null}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"d1\":null,\"d2\":null}", "{\"d2\":null,\"d1\":null}"))
        // With Whitespace
        try XCTAssertTrue (JSONEquality.JSONEquals (" { \"d1\":null }", "{\"d1\":null}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"d1\":null, \"d2\":null}", "{\"d1\":null,\"d2\":null}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"d1\":null , \"d2\":null}", "{\"d2\":null,\"d1\":null}"))
        // Array of null
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"d1\":[null]}", "{\"d1\":[null]}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"d1\":[null,null],\"d2\":[null,null]}", "{\"d1\":[null,null],\"d2\":[null,null]}"))
        try XCTAssertTrue (JSONEquality.JSONEquals ("{\"d1\":[null,null],\"d2\":[null,null]}", "{\"d2\":[null,null],\"d1\":[null,null]}"))
        // Nested Objects
        try XCTAssertTrue (JSONEquality.JSONEquals("{\"d1\":{\"d1\":[true]}}", "{\"d1\":{\"d1\":[true]}}"))
        try XCTAssertFalse (JSONEquality.JSONEquals("{\"d1\":{\"d1\":[true]}}", "{\"d1\":{\"d1\":[false]}}"))
        // Array of Nested Objects
        try XCTAssertTrue (JSONEquality.JSONEquals("{\"d1\":[{\"d1\":[true]},{\"d1\":[true]}]}", "{\"d1\":[{\"d1\":[true]},{\"d1\":[true]}]}"))
        try XCTAssertFalse (JSONEquality.JSONEquals("{\"d1\":[{\"d1\":[true]},{\"d1\":[true]}]}", "{\"d1\":[{\"d1\":[true]},{\"d1\":[false]}]}"))
        
        let json1_1 =
        """
{"parent":
[
    {
        "id": "0001",
        "type": "donut",
        "name": "Cake",
        "ppu": 0.55,
        "batters":
            {
                "batter":
                    [
                        { "id": "1001", "type": "Regular" },
                        { "id": "1002", "type": "Chocolate" },
                        { "id": "1003", "type": "Blueberry" },
                        { "id": "1004", "type": "Devil's Food" }
                    ]
            },
        "topping":
            [
                { "id": "5001", "type": "None" },
                { "id": "5002", "type": "Glazed" },
                { "id": "5005", "type": "Sugar" },
                { "id": "5007", "type": "Powdered Sugar" },
                { "id": "5006", "type": "Chocolate with Sprinkles" },
                { "id": "5003", "type": "Chocolate" },
                { "id": "5004", "type": "Maple" }
            ]
    },
    {
        "id": "0002",
        "type": "donut",
        "name": "Raised",
        "ppu": 0.55,
        "batters":
            {
                "batter":
                    [
                        { "id": "1001", "type": "Regular" }
                    ]
            },
        "topping":
            [
                { "id": "5001", "type": "None" },
                { "id": "5002", "type": "Glazed" },
                { "id": "5005", "type": "Sugar" },
                { "id": "5003", "type": "Chocolate" },
                { "id": "5004", "type": "Maple" }
            ]
    },
    {
        "id": "0003",
        "type": "donut",
        "name": "Old Fashioned",
        "ppu": 0.55,
        "batters":
            {
                "batter":
                    [
                        { "id": "1001", "type": "Regular" },
                        { "id": "1002", "type": "Chocolate" }
                    ]
            },
        "topping":
            [
                { "id": "5001", "type": "None" },
                { "id": "5002", "type": "Glazed" },
                { "id": "5003", "type": "Chocolate" },
                { "id": "5004", "type": "Maple" }
            ]
    }
]
}
"""
        
        let json1_2 =
        """
{"parent":
[
    {
        "name": "Cake",
        "ppu": 0.55,
        "id": "0001",
        "type": "donut",
        "batters":
            {
                "batter":
                    [
                        { "id": "1001", "type": "Regular" },
                        { "id": "1002", "type": "Chocolate" },
                        { "id": "1003", "type": "Blueberry" },
                        { "id": "1004", "type": "Devil's Food" }
                    ]
            },
        "topping":
            [
                { "id": "5001", "type": "None" },
                { "id": "5002", "type": "Glazed" },
                { "id": "5005", "type": "Sugar" },
                { "id": "5007", "type": "Powdered Sugar" },
                { "id": "5006", "type": "Chocolate with Sprinkles" },
                { "id": "5003", "type": "Chocolate" },
                { "id": "5004", "type": "Maple" }
            ]
    },
    {
        "id": "0002",
        "type": "donut",
        "name": "Raised",
        "ppu": 0.55,
        "topping":
            [
                { "id": "5001", "type": "None" },
                { "id": "5002", "type": "Glazed" },
                { "id": "5005", "type": "Sugar" },
                { "id": "5003", "type": "Chocolate" },
                { "id": "5004", "type": "Maple" }
            ],
        "batters":
            {
                "batter":
                    [
                        { "id": "1001", "type": "Regular" }
                    ]
            }
    },
    {
        "id": "0003",
        "type": "donut",
        "name": "Old Fashioned",
        "ppu": 0.55,
        "batters":
            {
                "batter":
                    [
                        { "id": "1001", "type": "Regular" },
                        { "id": "1002", "type": "Chocolate" }
                    ]
            },
        "topping":
            [
                { "id": "5001", "type": "None" },
                { "id": "5002", "type": "Glazed" },
                { "id": "5003", "type": "Chocolate" },
                { "id": "5004", "type": "Maple" }
            ]
    }
]
}
"""
        
        let json2_1 =
        """
{"parent":
[
    {
        "name": "Cake",
        "ppu": 0.55,
        "id": "0001",
        "type": "donut",
        "batters":
            {
                "batter":
                    [
                        { "id": "1001", "type": "Regular" },
                        { "id": "1002", "type": "Chocolate" },
                        { "id": "1003", "type": "Blueberry" },
                        { "id": "1004", "type": "Devil's Food 2" }
                    ]
            },
        "topping":
            [
                { "id": "5001", "type": "None" },
                { "id": "5002", "type": "Glazed" },
                { "id": "5005", "type": "Sugar" },
                { "id": "5007", "type": "Powdered Sugar" },
                { "id": "5006", "type": "Chocolate with Sprinkles" },
                { "id": "5003", "type": "Chocolate" },
                { "id": "5004", "type": "Maple" }
            ]
    },
    {
        "id": "0002",
        "type": "donut",
        "name": "Raised",
        "ppu": 0.55,
        "topping":
            [
                { "id": "5001", "type": "None" },
                { "id": "5002", "type": "Glazed" },
                { "id": "5005", "type": "Sugar" },
                { "id": "5003", "type": "Chocolate" },
                { "id": "5004", "type": "Maple" }
            ],
        "batters":
            {
                "batter":
                    [
                        { "id": "1001", "type": "Regular" }
                    ]
            }
    },
    {
        "id": "0003",
        "type": "donut",
        "name": "Old Fashioned",
        "ppu": 0.55,
        "batters":
            {
                "batter":
                    [
                        { "id": "1001", "type": "Regular" },
                        { "id": "1002", "type": "Chocolate" }
                    ]
            },
        "topping":
            [
                { "id": "5001", "type": "None" },
                { "id": "5002", "type": "Glazed" },
                { "id": "5003", "type": "Chocolate" },
                { "id": "5004", "type": "Maple" }
            ]
    }
]
}
"""
        
        try XCTAssertTrue (JSONEquality.JSONEquals(json1_1, json1_2))
        try XCTAssertFalse (JSONEquality.JSONEquals(json1_1, json2_1))
    }
    
    
    
    func testEqualsAnyObject() {
        // Strings
        XCTAssertTrue (JSONEquality.objectsEqual ("A" as AnyObject, "A" as AnyObject))
        XCTAssertTrue (JSONEquality.objectsEqual ("" as AnyObject, "" as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual ("A" as AnyObject, "" as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual ("A" as AnyObject, "B" as AnyObject))
        // String Arrays
        XCTAssertTrue (JSONEquality.objectsEqual ([] as AnyObject, [] as AnyObject))
        XCTAssertTrue (JSONEquality.objectsEqual (["A"] as AnyObject, ["A"] as AnyObject))
        XCTAssertTrue (JSONEquality.objectsEqual (["A", "B"] as AnyObject, ["A", "B"] as AnyObject))
        XCTAssertTrue (JSONEquality.objectsEqual ([""] as AnyObject, [""] as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual (["A"] as AnyObject, [] as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual (["A"] as AnyObject, [""] as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual (["A"] as AnyObject, ["B"] as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual (["A", "B"] as AnyObject, ["B", "A"] as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual (["A"] as AnyObject, ["A", "B"] as AnyObject))
        // Integers
        XCTAssertTrue (JSONEquality.objectsEqual (0 as AnyObject, 0 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual (0 as AnyObject, 1 as AnyObject))
        // Integer Arrays
        XCTAssertTrue (JSONEquality.objectsEqual ([1] as AnyObject, [1] as AnyObject))
        XCTAssertTrue (JSONEquality.objectsEqual ([1, 2, 3] as AnyObject, [1, 2, 3] as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual ([1] as AnyObject, [0] as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual ([1] as AnyObject, [] as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual ([1, 2] as AnyObject, [2, 1] as AnyObject))
        // Doubles
        XCTAssertTrue (JSONEquality.objectsEqual (0.0 as AnyObject, 0.0 as AnyObject))
        XCTAssertTrue (JSONEquality.objectsEqual (1.0 as AnyObject, 1.0 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual (0.0 as AnyObject, 1.1 as AnyObject))
        // Double Arrays
        XCTAssertTrue (JSONEquality.objectsEqual ([1.1] as AnyObject, [1.1] as AnyObject))
        XCTAssertTrue (JSONEquality.objectsEqual ([1.1, 2.2, 3.3] as AnyObject, [1.1, 2.2, 3.3] as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual ([1.1] as AnyObject, [0.0] as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual ([1.1] as AnyObject, [] as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual ([1.1, 2.2] as AnyObject, [2.2, 1.1] as AnyObject))
        // Booleans
        XCTAssertTrue (JSONEquality.objectsEqual (true as AnyObject, true as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual (true as AnyObject, false as AnyObject))
        // Boolean Arrays
        XCTAssertTrue (JSONEquality.objectsEqual ([true] as AnyObject, [true] as AnyObject))
        XCTAssertTrue (JSONEquality.objectsEqual ([true, false, true] as AnyObject, [true, false, true] as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual ([true] as AnyObject, [false] as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual ([true] as AnyObject, [] as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual ([true, false] as AnyObject, [false, true] as AnyObject))
        // NSNull
        XCTAssertTrue (JSONEquality.objectsEqual (NSNull() as AnyObject, NSNull() as AnyObject))
        // NSNull Arrays
        XCTAssertTrue (JSONEquality.objectsEqual ([NSNull()] as AnyObject, [NSNull()] as AnyObject))
        XCTAssertTrue (JSONEquality.objectsEqual ([NSNull(), NSNull(), NSNull()] as AnyObject, [NSNull(), NSNull(), NSNull()] as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual ([NSNull()] as AnyObject, [] as AnyObject))
        // Different Values
        XCTAssertFalse (JSONEquality.objectsEqual("A" as AnyObject, 1 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual("A" as AnyObject, false as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual("A" as AnyObject, 1.0 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual("A" as AnyObject, NSNull() as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(1 as AnyObject, "A" as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(1 as AnyObject, false as AnyObject))
        XCTAssertTrue (JSONEquality.objectsEqual(1 as AnyObject, 1.0 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(1 as AnyObject, 1.01 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(1 as AnyObject, NSNull() as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(1.0 as AnyObject, "A" as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(1.0 as AnyObject, false as AnyObject))
        XCTAssertTrue (JSONEquality.objectsEqual(1.0 as AnyObject, 1 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(1.0 as AnyObject, 1.01 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(1.0 as AnyObject, NSNull() as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(NSNull() as AnyObject, "A" as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(NSNull() as AnyObject, false as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(NSNull() as AnyObject, 1 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(NSNull() as AnyObject, 1.0 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(NSNull() as AnyObject, 1.01 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(false as AnyObject, "A" as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(false as AnyObject, 1 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(false as AnyObject, 1.0 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(false as AnyObject, 1.01 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(false as AnyObject, NSNull() as AnyObject))
        // Mixed Arrays
        XCTAssertTrue (JSONEquality.objectsEqual(["A", 1, 1.0, 1.1, false, NSNull()] as AnyObject, ["A", 1, 1.0, 1.1, false, NSNull()]  as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(["B", 1, 1.0, 1.1, false, NSNull()] as AnyObject, ["A", 1, 1.0, 1.1, false, NSNull()]  as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(["A", 2, 1.0, 1.1, false, NSNull()] as AnyObject, ["A", 1, 1.0, 1.1, false, NSNull()]  as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(["A", 1, 2.0, 1.1, false, NSNull()] as AnyObject, ["A", 1, 1.0, 1.1, false, NSNull()]  as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(["A", 1, 1.0, 1.11, false, NSNull()] as AnyObject, ["A", 1, 1.0, 1.1, false, NSNull()]  as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(["A", 1, 1.0, 1.1, false, 1] as AnyObject, ["A", 1, 1.0, 1.1, false, NSNull()]  as AnyObject))
        // Dictionaries
        let dict_a1_1 = ["A":1]
        let dict_a1_2 = ["A":1]
        let dict_a2_1 = ["A":2]
        let dict_b1_1 = ["B":1]
        let dict_af_1 = ["A":false]
        let dict_an_1 = ["A":NSNull()]
        let dict_am1_1: [String:AnyObject] = ["A":1 as AnyObject,"B":false as AnyObject,"C":1.1 as AnyObject,"D":NSNull() as AnyObject,"E":"e" as AnyObject]
        let dict_am1_2: [String:AnyObject] = ["A":1 as AnyObject,"B":false as AnyObject,"C":1.1 as AnyObject,"D":NSNull() as AnyObject,"E":"e" as AnyObject]
        let dict_am1_3: [String:AnyObject] = ["E":"e" as AnyObject,"D":NSNull() as AnyObject,"C":1.1 as AnyObject,"B":false as AnyObject,"A":1 as AnyObject]
        let dict_am2_1: [String:AnyObject] = ["A":2 as AnyObject,"B":false as AnyObject,"C":1.1 as AnyObject,"D":NSNull() as AnyObject,"E":"e" as AnyObject]
        let dict_am3_1: [String:AnyObject] = ["A":1 as AnyObject,"B":true as AnyObject,"C":1.1 as AnyObject,"D":NSNull() as AnyObject,"E":"e" as AnyObject]
        let dict_am4_1: [String:AnyObject] = ["A":1 as AnyObject,"B":false as AnyObject,"C":1.11 as AnyObject,"D":NSNull() as AnyObject,"E":"e" as AnyObject]
        let dict_am5_1: [String:AnyObject] = ["A":1 as AnyObject,"B":false as AnyObject,"C":1.1 as AnyObject,"D":false as AnyObject,"E":"e" as AnyObject]
        let dict_am6_1: [String:AnyObject] = ["A":1 as AnyObject,"B":false as AnyObject,"C":1.1 as AnyObject,"D":NSNull() as AnyObject,"E":"F" as AnyObject]
        let dict_am7_1: [String:AnyObject] = ["A":1 as AnyObject,"B":false as AnyObject,"C":1.1 as AnyObject,"D":NSNull() as AnyObject,"F":"e" as AnyObject]
        let dict_am8_1: [String:AnyObject] = ["A":1 as AnyObject,"B":false as AnyObject,"C":1.1 as AnyObject,"D":NSNull() as AnyObject]
        let dict_ar1_1: [String:AnyObject] = ["XX":dict_am1_1 as AnyObject,"YY":dict_am2_1 as AnyObject,"ZZ":dict_am3_1 as AnyObject]
        let dict_ar1_2: [String:AnyObject] = ["XX":dict_am1_1 as AnyObject,"YY":dict_am2_1 as AnyObject,"ZZ":dict_am3_1 as AnyObject]
        let dict_ar1_3: [String:AnyObject] = ["ZZ":dict_am3_1 as AnyObject,"YY":dict_am2_1 as AnyObject,"XX":dict_am1_1 as AnyObject]
        let dict_ar2_1: [String:AnyObject] = ["XXX":dict_am1_1 as AnyObject,"YYY":dict_am2_1 as AnyObject,"ZZZ":dict_am3_1 as AnyObject]
        let dict_ar3_1: [String:AnyObject] = ["XX":dict_am1_1 as AnyObject,"YY":dict_am3_1 as AnyObject,"ZZ":dict_am4_1 as AnyObject]
        XCTAssertTrue (JSONEquality.objectsEqual(dict_a1_1 as AnyObject, dict_a1_2 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(dict_a1_1 as AnyObject, dict_a2_1 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(dict_a1_1 as AnyObject, dict_b1_1 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(dict_a1_1 as AnyObject, dict_af_1 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(dict_a1_1 as AnyObject, dict_an_1 as AnyObject))
        XCTAssertTrue (JSONEquality.objectsEqual(dict_am1_1 as AnyObject, dict_am1_2 as AnyObject))
        XCTAssertTrue (JSONEquality.objectsEqual(dict_am1_1 as AnyObject, dict_am1_3 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(dict_am1_1 as AnyObject, dict_am2_1 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(dict_am1_1 as AnyObject, dict_am3_1 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(dict_am1_1 as AnyObject, dict_am4_1 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(dict_am1_1 as AnyObject, dict_am5_1 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(dict_am1_1 as AnyObject, dict_am6_1 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(dict_am1_1 as AnyObject, dict_am7_1 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(dict_am1_1 as AnyObject, dict_am8_1 as AnyObject))
        XCTAssertTrue (JSONEquality.objectsEqual(dict_ar1_1 as AnyObject, dict_ar1_2 as AnyObject))
        XCTAssertTrue (JSONEquality.objectsEqual(dict_ar1_1 as AnyObject, dict_ar1_3 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(dict_ar1_1 as AnyObject, dict_ar2_1 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(dict_ar1_1 as AnyObject, dict_ar3_1 as AnyObject))
        // Dictionary Arrays
        let da1_1:[AnyObject] = [dict_a1_1 as AnyObject, dict_am1_1 as AnyObject, dict_am8_1 as AnyObject]
        let da1_2:[AnyObject] = [dict_a1_2 as AnyObject, dict_am1_2  as AnyObject, dict_am8_1 as AnyObject]
        let da2_1:[AnyObject] = [dict_am8_1 as AnyObject, dict_am1_2 as AnyObject, dict_a1_2 as AnyObject]
        let da3_1:[AnyObject] = [dict_am1_1 as AnyObject, dict_am8_1 as AnyObject]
        XCTAssertTrue (JSONEquality.objectsEqual(da1_1 as AnyObject, da1_2 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(da1_1 as AnyObject, da2_1 as AnyObject))
        XCTAssertFalse (JSONEquality.objectsEqual(da1_1 as AnyObject, da3_1 as AnyObject))
    }
    
    static var allTests = [
        ("testEqualsJsonStrings", testEqualsJsonStrings),
        ("testEqualsAnyObject", testEqualsAnyObject)
    ]
}
