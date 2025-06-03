//
//  InstargramView.swift
//  week5
//
//  Created by 권석기 on 5/17/25.
//

import SwiftUI

struct InstargramView: View {
    var body: some View {
        VStack {
            HorizontalChatList()
                .padding(.leading, 20)
            VerticalChatList()
                .padding(.top, 10)
        }
        
    }
}

struct HorizontalChatList: View {
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                
                ForEach(1...10, id: \.self) { _ in
                    Image("")
                        .frame(width: 50, height: 50)
                        .background(.blue)
                        .clipShape(Circle())
                        .overlay(alignment: .bottomTrailing) {
                            Circle()
                                .frame(width: 15, height: 15)
                                .foregroundStyle(.green)
                                .offset(x: 0.5, y: 0.5)
                        }
                }
            }
            .frame(maxHeight: 80)
        }
    }
}


struct VerticalChatList: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(1...10, id: \.self) { _ in
                    InstaChatCell()
                    Divider()
                }
            }
        }
    }
}

struct InstaChatCell: View {
    var body: some View {
        HStack {
            Image("")
                .frame(width: 50, height: 50)
                .background(.gray)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text("가현")
                Text("안녕하세요!")
            }
            
            Spacer()
            VStack {
                Text("오전 09:41")
                    .foregroundStyle(.gray)
                    .font(.caption)
                Spacer()
            }
        }
        .padding(20)
    }
}


#Preview {
    InstargramView()
}
