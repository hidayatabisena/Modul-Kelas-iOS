//
//  LinksView.swift
//  AllWebView
//
//  Created by Hidayat Abisena on 07/12/23.
//

import SwiftUI
import SafariServices

struct LinksView: View {
    var body: some View {
        VStack(spacing: 20) {
            Link("Link Example", destination: URL(string: "https://www.moyahexagon.com")!)
            
            Text("Markdown link example: [Moya Hexagon](https://www.moyahexagon.com)")
        }
        .handleOpenURLInApp()
    }
}

#Preview {
    LinksView()
}

// MARK: - SFSafariView
struct SFSafariView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SFSafariView>) {
        // No need to do anything here
    }
}

// MARK: - REUSABLE OPENURL ViewModifier
private struct SafariViewControllerViewModifier: ViewModifier {
    @State private var urlToOpen: URL?
    
    func body(content: Content) -> some View {
        content
            .environment(\.openURL, OpenURLAction { url in
                urlToOpen = url
                return .handled
            })
            .sheet(isPresented: $urlToOpen.mappedToBool(), onDismiss: {
                urlToOpen = nil
            }, content: {
                SFSafariView(url: urlToOpen!)
            })
    }
}

extension Binding where Value == Bool {
    init(binding: Binding<(some Any)?>) {
        self.init(
            get: {
                binding.wrappedValue != nil
            },
            set: { newValue in
                guard newValue == false else { return }
                
                binding.wrappedValue = nil
            }
        )
    }
}

extension Binding {
    func mappedToBool<Wrapped>() -> Binding<Bool> where Value == Wrapped? {
        Binding<Bool>(binding: self)
    }
}

extension View {
    func handleOpenURLInApp() -> some View {
        modifier(SafariViewControllerViewModifier())
    }
}
