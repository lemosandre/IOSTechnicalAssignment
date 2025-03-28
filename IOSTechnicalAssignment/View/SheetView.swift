//
//  SheetView.swift
//  IOSTechnicalAssignment
//
//  Created by Andre Lemos on 2025-03-28.
//
import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(.black)
    }
}
