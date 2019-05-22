# JSONEquality
A Swift library for comparing JSON.

## Installation

Add the following to your project's Package.swift package description:

```
.package(url: "https://github.com/neallester/JSONEquality.git", .branch("master")),
```
## Usage

See [JSONEquality.swift](https://github.com/neallester/JSONEquality/blob/master/Sources/JSONEquality/JSONEquality.swift).

## Known Limitations

* Some swift Dictionary objects are serialized as an array of String values. Unfortunately the equality semantics
for the the serialized representation and the Dictionary are different. That is, order of elements in a [String] is
strictly meaningful. However, when deserialized to a Dictionary, the order of key/value pairs in the array is
not meaningful. JSONEquality currently compares the serialized output as [String] and may therefore report
that two representations are not equal when in fact they would deserialize to semantically equivalent
Dictionaries.

  **Workaround:** To use JSONEquality on objects which include Dictionaries that are serialized in this manner,
ensure all such Dictionaries are empty or contain only one key/value pair. 

* Does not detect duplicate attribute values within a JSON object. The value used for comparison is not
defined (it depends on the order in which the attributes happen to be deserialized) and may
differ run to run or from platform to platform.