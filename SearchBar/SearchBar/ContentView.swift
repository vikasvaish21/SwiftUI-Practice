//
//  ContentView.swift
//  SearchBar
//
//  Created by vikas on 09/01/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var datas = ["hello","Hi","World","asdasd","uhuhu","Welcome"]
    @State var txt =  ""
    var body: some View {
        VStack{
            searchView(txt: $txt)
            
            List(datas.filter{ txt == "" ? true : $0.localizedCaseInsensitiveContains(txt)} , id: \.self){
                i in
                Text(i).fontWeight(.heavy)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct searchView: UIViewRepresentable{
    
    @Binding var txt : String
    
    func makeCoordinator() -> searchView.Coordinator {
        return searchView.Coordinator(parent1: self)
    }
    
    
    func makeUIView(context: UIViewRepresentableContext<searchView>) -> UISearchBar{
        
        let searchBar = UISearchBar()
        searchBar.barStyle = .default
        searchBar.autocapitalizationType = .none
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar,context: UIViewRepresentableContext<searchView>){
        
    }
    
    class Coordinator: NSObject,UISearchBarDelegate{
        var parent : searchView!
        
        init(parent1 : searchView){
            parent = parent1
        }
        
        func searchBar(_ searchBar: UISearchBar,textDidChange searchText:String){
            parent.txt = searchText
        }
    }
    
    
}
