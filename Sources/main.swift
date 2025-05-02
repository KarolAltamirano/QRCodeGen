import Foundation
import QRCode

let args = CommandLine.arguments

guard args.count > 1 else {
    print("Usage: qrgen <text>")
    exit(1)
}

let content = args[1]

let doc = try QRCode.Document(utf8String: content)
let data = try doc.svgData(dimension: 600)

let file = FileManager.default
    .urls(for: .desktopDirectory, in: .userDomainMask)
    .first!
    .appending(path: "qr.svg")

try data.write(to: file)
