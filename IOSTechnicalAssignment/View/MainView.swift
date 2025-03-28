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

    var body: some View {
        CanvasView()
            .onAppear {
                callApi()
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
