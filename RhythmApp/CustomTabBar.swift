//
//  CustomTabBar.swift
//  RhythmApp
//
//  Created by Sophie Strausberg on 3/12/23.
//

import SwiftUI

// extending view to get safe area
extension View {
    func getSafeArea() -> UIEdgeInsets {
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: String
    
    //animation namespace for sliding effect
    @Namespace var animation
    
    var body: some View {
        HStack(spacing: 0) {
            TabBarButton(animation: animation, image: "line.horizontal.3", selectedTab: $selectedTab)
            
            ZStack {
                
//                Circle()
//                    .frame(width: 125, height: 125)
//                    .foregroundColor(Color("BrandBlue"))
                
                Circle()
                    .frame(width: 100)
                    .foregroundColor(Color("BrandPink"))

                Button {
                    withAnimation(.spring()) {
                        selectedTab = "play.fill"
                    }
                } label: {
                    Image(systemName: "play.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
//                        .background(Color("BrandGreen"))
//                        .clipShape(Circle())
//                        .frame(width: 75, height: 75)
                    //shadows...
                        
                }
            
            }
            .offset(y: -10)

            TabBarButton(animation: animation, image: "app.badge", selectedTab: $selectedTab)
            
        }
        .padding(.top)
        .padding(.vertical, 10)
        .padding(.bottom, getSafeArea().bottom == 0 ? 30 : getSafeArea().bottom)
//        .background(Color("BrandBlue"))
//        .cornerRadius(25)
//        .background(Image("Wave"))
        
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

struct TabBarButton: View {
    var animation: Namespace.ID
    var image: String
    @Binding var selectedTab: String
    
    var body: some View {
        VStack(spacing: 8) {
            Button(action: {
                withAnimation(.spring()) {
                    selectedTab = image
                }
            }) {
                Image(systemName: image)
                    .font(.largeTitle)
                    //.bold()
                    .frame(width: 28, height: 28)
                    .foregroundColor(selectedTab == image ? Color("BrandGrey") : Color.gray.opacity(0.5))
            }
            
            if selectedTab == image {
                Circle()
                    .fill(Color("BrandGrey"))
                //sliding effect
                    .matchedGeometryEffect(id: "TAB", in: animation)
                    .frame(width: 8, height: 8)
            }
        }
        .frame(maxWidth: .infinity)
        
    }
}
