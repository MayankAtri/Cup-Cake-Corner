//
//  AdderssView.swift
//  Cup Cake Corner
//
//  Created by Mayank Atri on 27/03/24.
//

import SwiftUI

struct AdderssView: View {
    //MARK: Varible
    @Bindable var order: Order
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Name" , text: $order.name)
                    TextField("Street Address" , text: $order.streetAddress)
                    TextField("City " , text: $order.city)
                    TextField("Zip" , text: $order.zip)
                }
                Section{
                    NavigationLink("Check out"){
                        CheckoutView(order: order)
                    }
                    .disabled(order.hasValidAddress == false)
                }
            }.navigationTitle("Delivery details")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AdderssView(order: Order())
}
