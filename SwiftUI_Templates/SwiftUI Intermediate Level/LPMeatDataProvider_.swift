//
//  LPMeatDataProvider_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 12.03.23.
//

import SwiftUI
import LinkPresentation

class CustomLinkView: LPLinkView {
    override var intrinsicContentSize: CGSize {
        CGSize(width: 200,
               height: super.intrinsicContentSize.height)
    }
}

struct URLPreviewContainer: UIViewRepresentable {
    
    var previewURL: URL
    
    func makeUIView(context: Context) -> CustomLinkView {
        
        let view = CustomLinkView(url: previewURL)
        let provider = LPMetadataProvider()
        provider.startFetchingMetadata(for: previewURL) { metadata, error in
            if error == nil, let metadata = metadata {
                DispatchQueue.main.async {
                    /**
                     to collapse with image presentation use nextr code:
                     ` metadata.imageProvider = NSItemProvider() `
                     */
                    view.metadata = metadata
                }
            }
        }
        return view
    }
    
    func updateUIView(_ uiView: CustomLinkView, context: Context) {}
}

struct LPMeatDataProvider_: View {
    
    @StateObject var vm = LPMeatDataProvider_VM()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(vm.URLs, id: \.self) { _url in
                    URLPreviewContainer(previewURL: _url)
                        .padding()
                        .padding(.horizontal)
                }
            }
        }
    }
}

class LPMeatDataProvider_VM: ObservableObject {
    
    private let stringURLs: [String] = [
        "https://medium.com", "https://apple.com",
        "https://yahoo.com", "https://stackoverflow.com"
    ]
    
    @Published var URLs: [URL] = []
    
    init() { getURLs() }
    
    func getURLs() {
        stringURLs.forEach { string in
            guard let url = URL(string: string) else { return }
            URLs.append(url)
        }
    }
}

#if DEBUG
struct LPMeatDataProvider__Previews: PreviewProvider {
    static var previews: some View {
        LPMeatDataProvider_()
    }
}
#endif
