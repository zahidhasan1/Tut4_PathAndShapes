//
//  ContentView.swift
//  Tut4_PathAndSHapes
//
//  Created by ZEUS on 9/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
           // ArcsAndPieCharts()
           // RectangleView()
//            DomeView()

            CircleLoaderView()
                .padding(.bottom, 20.0)
            DonutChartView()
                .padding()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RectangleView: View {
    var body: some View {
        Path(){ path in
            path.move(to: CGPoint(x: 20, y: 20))
            path.addLine(to: CGPoint(x: 200, y: 20))
            path.addLine(to: CGPoint(x: 200, y: 200))
            path.addLine(to: CGPoint(x: 20, y: 200))
            path.closeSubpath()
        }
        .stroke(.green, lineWidth: 5)
    }
}

struct DomeView: View {
    var body: some View {
        ZStack {
            Path(){ path in
                path.move(to: CGPoint(x: 20, y: 200))
                path.addLine(to: CGPoint(x: 40, y: 200))
                path.addQuadCurve(to: CGPoint(x: 260, y: 200), control: CGPoint(x: 145, y: 50))
                path.addLine(to: CGPoint(x: 280, y: 200))
                path.addLine(to: CGPoint(x: 280, y: 250))
                path.addLine(to: CGPoint(x: 20, y: 250))
            }
            .fill(.purple)
            
            Path(){ path in
                path.move(to: CGPoint(x: 20, y: 200))
                path.addLine(to: CGPoint(x: 40, y: 200))
                path.addQuadCurve(to: CGPoint(x: 260, y: 200), control: CGPoint(x: 145, y: 50))
                path.addLine(to: CGPoint(x: 280, y: 200))
                path.addLine(to: CGPoint(x: 280, y: 250))
                path.addLine(to: CGPoint(x: 20, y: 250))
                path.closeSubpath()
            }
            .stroke(Color.green, lineWidth: 5)
        }
    }
}


struct ArcsAndPieCharts: View {
    var body: some View{
        ZStack {
            Path(){ path in
                path.move(to: CGPoint(x: 200, y: 200))
                path.addArc(center: .init(x: 200, y: 200), radius: 100, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: true)
            }
            .fill(.green)
            
            Path(){ path in
                path.move(to: CGPoint(x: 200, y: 200))
                path.addArc(center: .init(x: 200, y: 200), radius: 100, startAngle: .degrees(190), endAngle: .degrees(90), clockwise: true)
            }
            .fill(.yellow)
            
            Path(){ path in
                path.move(to: CGPoint(x: 200, y: 200))
                path.addArc(center: .init(x: 200, y: 200), radius: 100, startAngle: .degrees(190), endAngle: .degrees(110), clockwise: true)
            }
            .fill(.red)
            
            Path(){ path in
                path.move(to: CGPoint(x: 200, y: 200))
                path.addArc(center: .init(x: 200, y: 200), radius: 100, startAngle: .degrees(90), endAngle: .degrees(0), clockwise: true)
            }
            .fill(.purple)
            .offset(x: 15, y: 10)
            .overlay(
                Text("25%")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .offset(x:60, y: 60)
            )
        }
    }
}

struct CircleLoaderView: View{
    private var purpleGradient = LinearGradient(gradient: Gradient(colors: [ Color(red: 207/255, green: 150/255, blue: 207/255), Color(red: 107/255, green: 116/255,blue: 179/255) ]), startPoint: .trailing, endPoint: .leading)
    var body: some View{
        ZStack{
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 20)
                .frame(width: 300, height: 300)
            
            Circle()
                .trim(from: 0, to: 0.85)
                .stroke(purpleGradient, lineWidth: 20)
                .frame(width: 300, height: 300)
                .overlay(){
                    VStack{
                        Text("85%")
                            .font(.system(size: 60, weight: .semibold, design: .rounded))
                            .foregroundColor(.gray)
                        Text("Complete")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .foregroundColor(.gray)
                    }
                }
        }
        
        
    }
}

struct DonutChartView: View{
    var body: some View{
        ZStack {
            Circle()
                .trim(from: 0, to: 0.3)
            .stroke(Color.green, lineWidth: 60)
            Circle()
                .trim(from: 0.3, to: 0.5)
                .stroke(Color(.systemTeal), lineWidth: 60)
            Circle()
                .trim(from: 0.5, to: 0.7)
                .stroke(Color(.purple), lineWidth: 60)
            Circle()
                .trim(from: 0.7, to: 1)
                .stroke(Color(.systemYellow), lineWidth: 60)
                .overlay(){
                    Text("25%")
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                        .foregroundColor(.white)
                        .offset(x: 120, y: -110)
                }
        }

    }
}
