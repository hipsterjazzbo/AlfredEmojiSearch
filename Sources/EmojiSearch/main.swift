import Foundation

class EmojiSearch {
    var index: [String: [String]] = [:]

    init?() {
        guard #available(OSX 10.11, *) else {
            return
        }

        // Initialize index
        self.index = getIndex()

        // Grab the input from Alfred
        let query: String = CommandLine.arguments[1]

        // Search the index
        let results = doSearch(query: query)

        //Format the results for Alfred
        let items = formatResults(results: results)

        // Output to Alfred
        print(self.jsonString(object: ["items": items]))
    }

    func doSearch(query: String) -> [String] { // Loop through and get the results
        var results: [String] = []

        if let emojiTerms = self.index[query] {
            results = emojiTerms
        } else {
            results = self.index
                    .filter {
                        $0.1.contains {
                            $0.range(of: query, options: .caseInsensitive) != nil

                        }
                    }
                    .map {
                        $0.0
                    }
        }

        return results
    }

    func formatResults(results: [String]) -> [[String: Any]] {
        var items: [[String: Any]] = []

        // Format results for Alfred
        for result in results {
            items.append([
                "uid": result,
                "title": result,
                "subtitle": "",
                "arg": result
            ])
        }

        return items
    }

    func getIndex() -> [String: [String]] {
        var index: [String: [String]] = [:]
        var url: URL?

        // Get a file handler for the index.json file containing all the emoji and terms
        let currentWorkingDirectory = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)

        if let path = URL(string: CommandLine.arguments[0], relativeTo: currentWorkingDirectory) {
            url = URL(string: "index.json", relativeTo: path)!

            // Read in the index
            do {
                let data = try Data(contentsOf: url!)

                index = try JSONDecoder().decode([String: [String]].self, from: data)
            } catch {
                print(error)
            }
        }

        return index
    }

    func jsonString(object: Any) -> String {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: .prettyPrinted) else {
            return ""
        }

        return String(data: data, encoding: String.Encoding.utf8) ?? ""
    }
}

let search = EmojiSearch()
