// Build Swift CLI with ArgumentParser framework
// Author: Han Sena

import ArgumentParser
import Foundation

struct GenerativeArt: ParsableCommand {

    @Argument(help: "Number of rows")
    var rows: Int

    @Argument(help: "Number of columns")
    var columns: Int

    func run() throws {
        draw(rows: rows, columns: columns)
    }

    func draw(rows: Int, columns: Int) {
        let chars = "</>"
        for _ in 0..<rows {
            let row = (0..<columns).map { _ in
                String(chars.randomElement() ?? Character(""))
            }.joined()
            print(row)
        }
    }
}

GenerativeArt.main()

