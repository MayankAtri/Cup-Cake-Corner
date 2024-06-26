//
//  CheckoutVIew.swift
//  Cup Cake Corner
//
//  Created by Mayank Atri on 27/03/24.
//

import SwiftUI

struct CheckoutView: View {
    //MARK: Varible declarations
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    var order : Order
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3){ image in
                        image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }.frame(height: 233)
                
                Text("Your Total is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place Order"){
                    task{
                        await placeOrder()
                    }
                }
                    .padding()
            }
        }.navigationTitle("Check out")
            .navigationBarTitleDisplayMode(.inline)
            .scrollBounceBehavior(.basedOnSize)
            .alert("Thank you!", isPresented: $showingConfirmation) {
                Button("OK") { }
            } message: {
                Text(confirmationMessage)
            }
    }
    func placeOrder() async{
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order ")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do{
            let (data,_) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.quantity) \(Order.types[decodedOrder.type].lowercased()) cupcakes on its way!!"
            showingConfirmation = true
            
        } catch {
            print("Checkout Failed: \(error.localizedDescription)")
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
