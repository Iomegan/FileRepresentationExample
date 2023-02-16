//
//  ContentView.swift
//  FileRepresentationExample
//
//  Created by Daniel Witt on 16.02.23.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var exampleType = UTType(exportedAs: "com.example.FileRepresentationExample.example")
}

struct ExampleObject: Transferable {
    let exampleTextURL = Bundle.main.url(forResource: "example", withExtension: "txt")!

    static var transferRepresentation: some TransferRepresentation {
        FileRepresentation(exportedContentType: .exampleType) { item in
            SentTransferredFile(item.exampleTextURL)
        }
        // More transferring types here...
    }
}

struct ContentView: View {
    private let exampleObject = ExampleObject()
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "doc.text")
                Text("Try to drag me to\n Finder on macOS\nor the Files app on iOS")
                    .multilineTextAlignment(.center)
            }
            .font(.title)
            .foregroundColor(.accentColor)
            .padding()
            .draggable(exampleObject)
//            .draggable(exampleObject.exampleTextURL)
            Text("The drag will be rejected. Bug?")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
