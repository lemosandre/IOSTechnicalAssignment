//
//  CanvasView.swift
//  IOSTechnicalAssignment
//
//  Created by Andre Lemos on 2025-03-27.
//
import SwiftUI

struct CanvasView: View {
    
    @State private var shapes: [AnyView] = []
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black)
            ForEach(shapes.indices, id: \.self) { shape in
                shapes[shape]
                    .draggable()
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            shapes.append(AnyView(
                Circle()
                    .fill(Color.red)
                    .frame(width: 50, height: 50)
                ))
        }
    }
}

#Preview {
    CanvasView()
}
