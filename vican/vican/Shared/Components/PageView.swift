//
//  PageView.swift
//  vican
//
//  Created by m00nbek on 1/19/24.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    
    var body: some View {
        TabView {
            ForEach(pages.indices) { index in
                pages[index]
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
    }
}
