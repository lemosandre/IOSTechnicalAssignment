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

    var body: some View {
        VStack {
            CanvasView()
                .onAppear {
                    callApi()
                }
            HStack {
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
        .sheet(isPresented: $showingSheet) {
            SheetView()
        }
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
