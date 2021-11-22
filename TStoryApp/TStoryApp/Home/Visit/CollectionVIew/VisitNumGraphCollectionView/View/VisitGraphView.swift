//
//  VisitGraphView.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/12.
//

import UIKit

class VisitGraphView: UIView {
    
    let graphWidth: CGFloat = 310
    let graphHeight: CGFloat = 120
    var visitNumWeekLen: Int = 0
    var subVisitNumWeek: [VisitNumberWeek] = []
    var visitNumWeek: [VisitNumberWeek] = []
    
    func graphBottomLineDraw() {//그래프의 밑선
        let origin = CGPoint(x: 0.0, y: graphHeight)
        let path = UIBezierPath()
        let from = CGPoint(x: origin.x, y: origin.y)
        let to = CGPoint(x: origin.x + graphWidth, y: origin.y)
        path.move(to: from)
        path.addLine(to: to)
        
        let shapeLine = CAShapeLayer()
        shapeLine.path = path.cgPath
        shapeLine.strokeColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        shapeLine.lineWidth = 0.5
        self.layer.addSublayer(shapeLine)
        
        graphVerticalLineDraw()
    }
    
    func graphVerticalLineDraw() {//그래프의 세로선
        let origin = CGPoint(x: 0, y: 0)
        let dayArr: [String] = ["토", "일", "월", "화", "수", "목", "오늘"]
        
        for i in 0 ... 7 {
            let path = UIBezierPath()
            var distance = 310 / 7 * CGFloat(i)
            let from = CGPoint(x: origin.x + distance, y: origin.y)
            let to = CGPoint(x: origin.x + distance, y: origin.y + graphHeight)
            path.move(to: from)
            path.addLine(to: to)
            let shapeLine = CAShapeLayer()
            shapeLine.path = path.cgPath
            shapeLine.strokeColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
            shapeLine.lineWidth = 0.5
            self.layer.addSublayer(shapeLine)
            
            if i < 7  {
                let label = UILabel()
                label.textColor = .lightGray
                label.font = .systemFont(ofSize: 12, weight: .light)
                label.text = dayArr[i]
                label.sizeToFit()
                self.addSubview(label)
                distance = distance + ( 310 / 7 / 2 )
                label.center = CGPoint(x: origin.x + distance, y: origin.y + 5)
            }
        }
        graphLineDraw()
    }
    
    func graphLineDraw() {//그래프의 꺾은선
//        let origin = CGPoint(x: 0, y: 0)
//        let lineDistance = 310 / 7
//        let path = UIBezierPath()
//        let from = CGPoint(x: origin.x, y: origin.y + CGFloat(120 - (subVisitNumWeek[0].todayVisitCount * 5)))
//
//        let toFirst = CGPoint(x: origin.x + CGFloat((lineDistance / 2)), y: origin.y + 110)
//        let toSecond = CGPoint(x: toFirst.x + CGFloat(lineDistance), y: toFirst.y - 10)
//        let toThird = CGPoint(x: toSecond.x + CGFloat(lineDistance), y: toSecond.y + 10)
//        let toFourth = CGPoint(x: toThird.x + CGFloat(lineDistance), y: toThird.y + 10)
//        let toFifth = CGPoint(x: toFourth.x + CGFloat(lineDistance), y: toFourth.y - 10)
//        let toSixth = CGPoint(x: toFifth.x + CGFloat(lineDistance), y: toFifth.y)
//        let toLast = CGPoint(x: toSixth.x + CGFloat(lineDistance), y: toSixth.y + 10)
//        path.move(to: from)
//        path.addLine(to: toFirst)
//        path.addLine(to: toSecond)
//        path.addLine(to: toThird)
//        path.addLine(to: toFourth)
//        path.addLine(to: toFifth)
//        path.addLine(to: toSixth)
//        path.addLine(to: toLast)
//
//        let shapeLine = CAShapeLayer()
//        shapeLine.path = path.cgPath
//        shapeLine.strokeColor = UIColor.systemRed.cgColor
//        shapeLine.fillColor = .none
//        shapeLine.lineWidth = 2
//        self.layer.addSublayer(shapeLine)
//
//        graphDotsDraw(firstPos: toFirst, secondPos: toSecond, thirdPos: toThird, fourthPos: toFourth, fifthPos: toFifth, sixthPos: toSixth, lastPos: toLast)
        
        
        var origin = CGPoint(x: 0, y: 0)
        let linePath = UIBezierPath()
        var linePos = CGPoint()
        var dotPosArr: [CGPoint] = []
        var linesDistance: Int = 0
        for i in 0 ..< subVisitNumWeek.count {
            let weekData: Int = subVisitNumWeek[i].todayVisitCount
            if i == 0 {
                let from = CGPoint(x: origin.x, y: origin.y + CGFloat(120 - (subVisitNumWeek[0].todayVisitCount * 10)))
                origin.y = origin.y + CGFloat(120 - (weekData * 10))
                linePath.move(to: from)
            }
            else if i == 1 {
                origin.y = 120
                linesDistance = 310 / 7 / 2
                origin.x = origin.x + CGFloat(linesDistance)
                origin.y = origin.y - CGFloat(weekData * 10)
                linePos = CGPoint(x: origin.x, y: origin.y)
                linePath.addLine(to: linePos)
                dotPosArr.append(linePos)
            }
            else {
                origin.y = 120
                linesDistance = 310 / 7
                origin.x = origin.x + CGFloat(linesDistance)
                origin.y = origin.y - CGFloat(weekData * 10)
                linePos = CGPoint(x: origin.x, y: origin.y)
                linePath.addLine(to: linePos)
                dotPosArr.append(linePos)
            }
        }
        let shapeLine = CAShapeLayer()
        shapeLine.path = linePath.cgPath
        shapeLine.strokeColor = UIColor.systemRed.cgColor
        shapeLine.fillColor = .none
        shapeLine.lineWidth = 2
        self.layer.addSublayer(shapeLine)
        graphDotsDraw(dots: dotPosArr)
    }

    func graphDotsDraw(dots: [CGPoint]) {//그래프의 점

//        let dotPositionArr: [CGPoint] = [firstPos, secondPos, thirdPos, fourthPos, fifthPos, sixthPos, lastPos]
        for i in 0 ..< dots.count {
            let dotStrokePath = UIBezierPath(
                arcCenter: dots[i],
                radius: 4,
                startAngle: 0 * CGFloat.pi / 180,
                endAngle: 360 * CGFloat.pi / 180,
                clockwise: true
            )
            let dotStrokeShape = CAShapeLayer()
            dotStrokeShape.path = dotStrokePath.cgPath
            dotStrokeShape.fillColor = UIColor.systemRed.cgColor
            self.layer.addSublayer(dotStrokeShape)

            if i < 6 {
                let dotPath = UIBezierPath(
                    arcCenter: dots[i],
                    radius: 2,
                    startAngle: 0 * CGFloat.pi / 180,
                    endAngle: 360 * CGFloat.pi / 180,
                    clockwise: true
                )
                let dotShape = CAShapeLayer()
                dotShape.path = dotPath.cgPath
                dotShape.fillColor = UIColor.white.cgColor
                self.layer.addSublayer(dotShape)
            }
            else {
                let lastPath = UIBezierPath(
                    arcCenter: dots[i],
                    radius: 8,
                    startAngle: 0 * CGFloat.pi / 180,
                    endAngle: 360 * CGFloat.pi / 180,
                    clockwise: true
                )
                let lastShape = CAShapeLayer()
                lastShape.path = lastPath.cgPath
                lastShape.fillColor = UIColor.systemRed.withAlphaComponent(0.5).cgColor
                self.layer.addSublayer(lastShape)
            }
        }
        
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraints() {
        self.backgroundColor = .white
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: graphWidth),
            self.heightAnchor.constraint(equalToConstant: graphHeight)
        ])
    }
    
    func setSubVisitNumWeek(arr: [VisitNumberWeek]) {
        self.visitNumWeek = arr
        self.visitNumWeekLen = self.visitNumWeek.count
        self.subVisitNumWeek = Array(visitNumWeek[visitNumWeekLen - 8 ... visitNumWeekLen - 1])
    }
}
