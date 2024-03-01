//
//  OldObservableProtocol.swift
//  ObservableBootCamp
//
//  Created by Azoz Salah on 29/02/2024.
//

import SwiftUI

class ObservableProtocolViewModel: ObservableObject {
    @Published var title = "Some title"
    
    var unObservedProberty = "N/A"
}


struct ObservableProtocol: View {
    
    @StateObject var viewModel = ObservableProtocolViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            Button(viewModel.title) {
                viewModel.title = "New title"
            }
            
            SomeChildView1(viewModel: viewModel)
            
            ThirdView1()
        }
        .environmentObject(viewModel)
        
    }
}


struct SomeChildView1: View {
    
    @ObservedObject var viewModel: ObservableProtocolViewModel
    
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "Child New title"
        }
    }
}


struct ThirdView1: View {
    
    @EnvironmentObject var viewModel: ObservableProtocolViewModel
    
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "Third New title"
        }
    }
}

#Preview {
    ObservableProtocol()
}
