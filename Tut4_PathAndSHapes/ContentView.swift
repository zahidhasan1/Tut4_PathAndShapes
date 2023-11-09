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
            ArcsAndPieCharts()
           // RectangleView()
            DomeView()
        }
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
        Path(){ path in
            path.move(to: CGPoint(x: 200, y: 200))
            path.addArc(center: .init(x: 200, y: 200), radius: 100, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: true)
        }
        .fill(.green)
    }
}
