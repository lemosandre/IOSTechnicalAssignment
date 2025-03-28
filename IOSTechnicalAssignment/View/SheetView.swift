//
//  SheetView.swift
//  IOSTechnicalAssignment
//
//  Created by Andre Lemos on 2025-03-28.
//
import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isPresented = false
    @State var photos: [Photo]
    @Binding var shapesPhotos: [AnyView]

    var body: some View {
        VStack {
            Button("Press to dismiss") {
                dismiss()
            }
            .font(.subheadline)
            .padding()
            .background(.black)
            List {
                ForEach(photos, id: \.id) { photo in
                    AsyncImage(url: URL(string: photo.src?.original ?? API.DefaultValue.notFoundImageURL )) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                    } placeholder: {
                        ProgressView()
                    }
                    .onTapGesture {
                        shapesPhotos.append(
                            AnyView(
                                AsyncImage(url: URL(string: photo.src?.original ?? API.DefaultValue.notFoundImageURL)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                } placeholder: {
                                    Color.red
                                }
                                .frame(width: 100, height: 100)
                                .clipShape(.rect(cornerRadius: 25))
                            )
                        )
                        dismiss()
                    }
                }
            }
        }
        .padding(.vertical, 20)
    }
}
