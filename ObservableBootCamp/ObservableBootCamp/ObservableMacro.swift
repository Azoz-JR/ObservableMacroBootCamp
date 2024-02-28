//
//  ObservableMacro.swift
//  ObservableBootCamp
//
//  Created by Azoz Salah on 28/02/2024.
//

import SwiftUI


@Observable class ObservableViewModel {
    var title = "Some title"
    
    @ObservationIgnored var unObservedProberty = "N/A"
}


struct ObservableMacro: View {
    
    @State var viewModel = ObservableViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            Button(viewModel.title) {
                viewModel.title = "New title"
            }
            
            SomeChildView(viewModel: viewModel)
            
            ThirdView()
        }.environment(viewModel)
        
    }
}


struct SomeChildView: View {
    
    @Bindable var viewModel: ObservableViewModel
    
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "Child New title"
        }
    }
}


struct ThirdView: View {
    
    @Environment(ObservableViewModel.self) var viewModel
    
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "Third New title"
        }
    }
}


#Preview {
    ObservableMacro()
}
