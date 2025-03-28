//
//  MainViewModel.swift
//  IOSTechnicalAssignment
//
//  Created by Andre Lemos on 2025-03-27.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var photos: [Photo] = []
    
    func getPhotos(
        callBack: @escaping () -> Void,
        failure: @escaping (_ error: String) -> Void)
    {
        Network.requestObject(request: Router.curatedPhotos(page: "10"), type: Photos.self, completion: { result in
            switch result {
            case .success(let data):
                self.photos = data.photos
                callBack()
            case .failure(let error):
                failure(error.localizedDescription)
            }
        })
    }
}
