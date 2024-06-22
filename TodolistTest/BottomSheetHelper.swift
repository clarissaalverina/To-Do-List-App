//
//  BottomSheetHelper.swift
//  TodolistTest
//
//  Created by Clarissa Alverina on 19/06/24.
//

import SwiftUI

extension View {
    @ViewBuilder
    
    func bottomMaskForSheet(_ height: CGFloat = 60) -> some View {
        self
            .background(SheetRootViewFinder(height: height))
    }
}

fileprivate struct SheetRootViewFinder: UIViewRepresentable {
    var height: CGFloat
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    func makeUIView(context: Context) -> UIView {
        return.init()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if let rootView = uiView.viewBeforeWindow {
                rootView.frame = .init(
                    origin: .zero,
                    size: .init(width: rootView.frame.width, height: rootView.frame.height - (height))
                )
            }
        }
    }
    
    class Coordinator: NSObject {
        var isMasked: Bool = false
    }
    
}

fileprivate extension UIView {
    var viewBeforeWindow: UIView? {
        if let superview, superview is UIWindow {
            return self
        }
        return superview?.viewBeforeWindow
    }
}


#Preview {
    SheetView()
}
