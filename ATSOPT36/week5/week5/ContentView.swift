//
//  ContentView.swift
//  week5
//
//  Created by 권석기 on 5/17/25.
//

import SwiftUI

struct ContentView: View {
    @State var name = "현수"
    
    var body: some View {
        //        ZStack(alignment: .bottom) {
        //            Image(.rabit)
        //                .resizable()
        //
        //            HStack {
        //                VStack(alignment: .leading) {
        //                    Text("Real 허거덩허거덩스")
        //                        .font(.largeTitle)
        //                    Text("이거참허거덩허거덩스한상황인데요")
        //                }
        //                Spacer()
        //            }
        //            .foregroundColor(.primary)
        //            .padding(20)
        //            .background(Color.primary
        //                .colorInvert()
        //                .opacity(0.75))
        //
        //        }
        //        .ignoresSafeArea(.all)
//        ChatListView()
        VStack {
            Text(name)
            
            Button(action: {
                name = "나연"
            }, label: {
                Text("이름 바꾸기")
            })
            VScrollView()
            HScrollView()
        }
    }
}

struct CarrotMarketCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(.rabit)
                .resizable()
                .frame(width: 120, height: 120)
                .aspectRatio(contentMode: .fit)
                .background(.gray)
                .cornerRadius(8)
                .overlay(alignment: .bottomTrailing) {
                    Image(systemName: "heart")
                        .foregroundStyle(.red)
                        .offset(x: -4, y: -4)
                }
            HStack {
                Text("아이폰 13ddddz")
                    .lineLimit(1)
                Spacer()
                Text("군자 1동")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .fixedSize()
            }
            Text("1,000,000원")
                .fontWeight(.bold)
                .foregroundStyle(.orange)
        }
        .frame(maxWidth: 120)
    }
}

struct SmaplListView: View {
    let items = ["사과", "바나나", "오렌지", "포도", "수박", "망고", "어쩌고", "저쩌고", "졸려요"]
    var body: some View {
        List(items, id: \.self) { item in
            Text(item)
        }
    }
}

struct ChatModel: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let message: String
    let profileImageName: String
    let thumbnailImageName: String
}




struct ChatListView: View {
    let chatDummy: [ChatModel] = [
        ChatModel(name: "바보", location: "문정동", message: "확인했습니다! 감사합니다 :)", profileImageName: "Image", thumbnailImageName: "Image"),
        ChatModel(name: "김가현", location: "구의동", message: "넵 수고하세용", profileImageName: "Image", thumbnailImageName: "Image"),
        ChatModel(name: "이은지", location: "보문동2가", message: "안녕하세요 답장이 너무 늦었네요 죄송…", profileImageName: "Image", thumbnailImageName: "Image"),
        ChatModel(name: "최주리", location: "면목동", message: "부리님이 이모티콘을 보냈어요.", profileImageName: "Image", thumbnailImageName: "Image"),
        ChatModel(name: "임재현", location: "자양제4동", message: "네.임재현씨", profileImageName: "Image", thumbnailImageName: "Image"),
        ChatModel(name: "이수용", location: "옥수동", message: "이수용이 이모티콘을 보냈어요.", profileImageName: "Image", thumbnailImageName: "Image"),
        ChatModel(name: "조영서", location: "면목동", message: "조영서가 이모티콘을 보냈어요.", profileImageName: "Image", thumbnailImageName: "thumb4"),
        ChatModel(name: "선영주", location: "면목동", message: "선영주가 이모티콘을 보냈어요.", profileImageName: "Image", thumbnailImageName: "thumb4"),
        ChatModel(name: "정정욱", location: "면목동", message: "ㅈㅇ정주우기 이모티콘을 보냈어요.", profileImageName: "Image", thumbnailImageName: "thumb4"),
        ChatModel(name: "진소은", location: "면목동", message: "진소으니 이모티콘을 보냈어요.", profileImageName: "Image", thumbnailImageName: "thumb4")
    ]
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(chatDummy) { chat in
                    ChatCell(model: chat)
                    Divider()
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

struct ChatCell: View {
    let model: ChatModel
    var body: some View {
        
        HStack {
            // profile
            Image(.rabit)
                .resizable()
                .frame(width: 50, height: 50)
                .background(.gray)
                .clipShape(Circle())
            
            // info
            VStack(alignment: .leading) {
                HStack {
                    Text(model.name)
                        .fontWeight(.semibold)
                    Text(model.location)
                        .foregroundStyle(.gray)
                        .font(.caption)
                }
                Text(model.message)
            }
            Spacer()
            Image(.macbook)
                .resizable()
                .frame(width: 50, height: 50)
                .background(.gray)
                .cornerRadius(4)
        }
        .padding(10)
    }
}

struct VScrollView: View {
    var body: some View {
        ScrollView {
            VStack {
                           ForEach(1..<100) {
                               Text("Item \($0)")
                                   .font(.title)
                           }
                       }

                       .frame(maxWidth: .infinity)
        }
    }
}

struct HScrollView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                       ForEach(0..<10) {
                            Text("숫자 \($0)")
                                .foregroundColor(.black)
                                .font(.largeTitle)
                                .background(Color.yellow)
                        }
                    }
                    .frame(maxHeight: .infinity)
        }
    }
}

#Preview {
    ContentView()
}
