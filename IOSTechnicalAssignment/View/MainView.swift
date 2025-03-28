//
//  MainView.swift
//  IOSTechnicalAssignment
//
//  Created by Andre Lemos on 2025-03-27.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainViewModel()
    @State var isShowAlert = false
    @State var errorMessage = ""
    @State private var showingSheet = false
    @State private var shapesPhotos: [AnyView] = []

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView {
                    Text("loading")
                        .foregroundColor(.pink)
                        .bold()
                        .accessibilityIdentifier("loading")
                }
            } else {
                CanvasView(shapesPhotos: $shapesPhotos)
                HStack {
                    Button(action: {
                        shapesPhotos = []
                    }) {
                        Image(systemName: "trash.square.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.green)
                    }
                    .padding(.all, 5)
                    Spacer()
                    Button(action: {
                        showingSheet.toggle()
                    }) {
                        Image(systemName: "plus.app.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.green)
                    }
                    .padding(.all, 5)
                }
                .padding(.horizontal, 20)
            }
        }
        .onAppear {
            callApi()
        }
        .sheet(isPresented: $showingSheet) {
            SheetView(photos: viewModel.photos, shapesPhotos: $shapesPhotos)
        }
        .alert(isPresented: $isShowAlert, content: {
            Alert(
                title: Text("warning.network.connection"),
                message: Text(errorMessage),
                dismissButton: .destructive(Text("button.try.again"), action: {
                    callApi()
                }))
        })
    }
    
    func callApi() {
        viewModel.isLoading = true
        viewModel.getPhotos(
            callBack: {
                viewModel.isLoading = false
            }, failure: { error in
                self.isShowAlert = true
                self.errorMessage = error
            })
    }
}

#Preview {
    MainView()
}
