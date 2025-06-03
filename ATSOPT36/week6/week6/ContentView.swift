//
//  ContentView.swift
//  week6
//
//  Created by 권석기 on 5/24/25.
//

import SwiftUI

struct ContentView: View {
    //    @State private var isSheetPresented: Bool = false
    //
    //    var body: some View {
    //        VStack(spacing: 20) {
    //            Text("메인 화면")
    //
    //            Button(action: {
    //                isSheetPresented = true
    //
    //            }, label: {
    //                Text("Sheet 열기")
    //            })
    //        }
    //        .sheet(isPresented: $isSheetPresented) {
    //            SheetDetailView(isSheetPresented: $isSheetPresented)
    //                .presentationDragIndicator(.visible)
    //        }
    
//    var body: some View {
//        let columns = [GridItem(.flexible()), GridItem(.flexible())]
//        VStack {
//            ScrollView {
//                LazyVGrid(columns: columns, spacing: 20) {
//                    ForEach(1...20, id: \.self) { _ in
//                        ItemCell()
//                    }
//                }
//                .padding(.horizontal, 20)
//            }
//        }
//    }
//    var body: some View {
//        let rows = [GridItem(.flexible(minimum: 10, maximum: 100)),
//                    GridItem(.flexible(minimum: 120, maximum: 120))]
//        ScrollView(.horizontal) {
//            LazyHGrid(rows: rows, alignment: .top) {
//                ForEach(1...100, id: \.self) { _ in
//                    ItemCell2()
//                }
//            }
//            
//        }
//    }
    var body: some View {
        VStack {
            List(1...10, id: \.self) { _ in
                ItemCell3()
            }
            .navigationDestination(for: Int.self) { _ in
                
            }
        }
    }
}

struct UserDetailView: View {
    var body: some View {
        VStack {}
    }
}

struct ItemCell3: View {
    var body: some View {
        HStack {
        Image("")
            .resizable()
            .frame(width: 50, height: 50)
            .background(.gray)
            .clipShape(Circle())
            VStack(alignment: .leading) {
                Text("김가현")
                Text("나이 26")
            }
        }
    }
}

struct ItemCell: View {
    var body: some View {
        VStack {
            Image("")
                .resizable()
                .frame(maxWidth: .infinity, minHeight: 100)
                .background(.orange)
                .cornerRadius(12)
            
            Text("아이템")
        }
        .padding(10)
        .background(.white)
        .cornerRadius(12)
        .shadow(
            color: .gray,
            radius: CGFloat(3),
            x: CGFloat(1), y: CGFloat(1))
    }
}

struct ItemCell2: View {
    var body: some View {
        Rectangle()
            .frame(width: 120, height: 120)
            .foregroundStyle(.orange)
            .cornerRadius(12)
    }
}

struct SheetDetailView: View {
    @Binding var isSheetPresented: Bool
    var body: some View {
        ZStack {
            Color.yellow.opacity(0.2)
                .ignoresSafeArea()
            
            VStack {
                Text("SheetView")
                    .font(.largeTitle)
                
                Button(action: {
                    isSheetPresented = false
                }, label: {
                    Text("닫기")
                })
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
