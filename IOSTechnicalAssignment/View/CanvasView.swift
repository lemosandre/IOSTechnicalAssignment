//
//  CanvasView.swift
//  IOSTechnicalAssignment
//
//  Created by Andre Lemos on 2025-03-27.
//
import SwiftUI

struct CanvasView: View {
    
    @Binding var shapesPhotos: [AnyView]
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black)
            ForEach(shapesPhotos.indices, id: \.self) { shape in
                shapesPhotos[shape]
                    .draggableAndScaleable()
            }
        }
        .contentShape(Rectangle())
    }
}
