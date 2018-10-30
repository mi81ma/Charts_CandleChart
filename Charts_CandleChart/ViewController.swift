//
//  ViewController.swift
//  Charts_CandleChart
//
//  Created by masato on 30/10/2018.
//  Copyright © 2018 masato. All rights reserved.
//

import UIKit
import Charts


class ViewController: UIViewController, ChartViewDelegate {

var ChartView: CandleStickChartView!


    override func viewDidLoad() {
        super.viewDidLoad()

//        var chart = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
//        view.addSubview(chart)

        setGraph()
    }




    func setGraph(){

        // Prepare Data Array
        var entries: [CandleChartDataEntry] = Array()

        // *************************************************************************
        // MARK: - Input Data Set

        entries.append(CandleChartDataEntry(x: 1, shadowH: 0.00010852, shadowL: 9.206e-5, open: 0.00010265, close: 0.00010201))
        entries.append(CandleChartDataEntry(x: 2, shadowH: 0.000104, shadowL: 9.75e-5, open: 0.0001020, close: 0.0001025))
        entries.append(CandleChartDataEntry(x: 3, shadowH: 0.0001051, shadowL: 0.0001005, open: 0.0001025, close: 0.0001047))
        entries.append(CandleChartDataEntry(x: 4, shadowH: 0.0001053, shadowL: 9.866e-5, open: 0.000104, close: 0.0001008))
        entries.append(CandleChartDataEntry(x: 5, shadowH: 0.0001026, shadowL: 9.88e-5, open: 0.0001009, close: 0.00010084))
        entries.append(CandleChartDataEntry(x: 6, shadowH: 0.0001012, shadowL: 9.7e-5, open: 0.0001008, close: 9.883e-5))
        entries.append(CandleChartDataEntry(x: 7, shadowH: 9.917e-5, shadowL: 9.746e-5, open: 9.906e-5, close: 9.776e-5))
        entries.append(CandleChartDataEntry(x: 8, shadowH: 0.0001053, shadowL: 9.866e-5, open: 0.000104, close: 0.0001008))
        entries.append(CandleChartDataEntry(x: 9, shadowH: 0.0001053, shadowL: 9.866e-5, open: 0.000104, close: 0.0001008))
        entries.append(CandleChartDataEntry(x: 10, shadowH: 0.0001053, shadowL: 9.866e-5, open: 0.000104, close: 0.0001008))
        entries.append(CandleChartDataEntry(x: 11, shadowH: 0.0001053, shadowL: 9.866e-5, open: 0.000104, close: 0.0001008))
        entries.append(CandleChartDataEntry(x: 12, shadowH: 0.00010852, shadowL: 9.206e-5, open: 0.00010265, close: 0.00010201))
        entries.append(CandleChartDataEntry(x: 13, shadowH: 0.0001053, shadowL: 9.866e-5, open: 0.000104, close: 0.0001008))

        // *************************************************************************


        //dataset & Label Name
        let dataSet = CandleChartDataSet(values: entries, label: "Label")

        // X軸のインスタンス
        //        let xasis = XAxis()
        //        let yasis = YAxis()


        // グリッド線の色、太さ
        ChartView.gridBackgroundColor = UIColor.red.withAlphaComponent(0.9)

        // データがないときに表示する
        ChartView.noDataText = "No chart data available."


        // Tap Zoom cancel
        ChartView.doubleTapToZoomEnabled = false

        // *************************************************************************
        // MARK: - Label

        // Label Font & Size
        ChartView.legend.font = UIFont(name: "Futura", size:25)!
        ChartView.chartDescription?.font = UIFont(name: "Futura", size: 12)!
        //ChartView.chartDescription?.xOffset = ChartView.frame.width + 30
        //ChartView.chartDescription?.yOffset = ChartView.frame.height + 30
        //ChartView.chartDescription?.textAlign = NSTextAlignment.right


        // X軸のラベルを下に配置
        ChartView.xAxis.labelPosition = .bottom

        // X軸の非表示
        ChartView.xAxis.enabled = false

        // 右Y軸の非表示
        ChartView.rightAxis.enabled = false


        // *************************************************************************
        // MARK: - Color and form edit
        // Animation
        ChartView.animate(xAxisDuration: 1, yAxisDuration: 1)

        ChartView.tintColor = UIColor.blue

        // Cancel Pinch Zoom
        ChartView.pinchZoomEnabled = false

        // Change Background Color Change
        ChartView.backgroundColor = UIColor.white



        // 枠線のカラー&太さ
        ChartView.drawBordersEnabled = false
        ChartView.borderLineWidth = 4
        ChartView.borderColor = UIColor.red


        //Candle Color Change
        //dataSet.colors = [UIColor.red]

        //CandleColor Filled in Increasing
        dataSet.increasingFilled = true

        //CandleColor Filled in Decreasing
        dataSet.decreasingFilled = true

        // Shadow Color is same as CandleColor
        dataSet.shadowColorSameAsCandle = true


        //Candle Color
        //dataSet.increasingColor = UIColor.green
        //dataSet.decreasingColor = UIColor.red

        // Candle Colors to joyful/colorful/vordiplom/liberty/material
        dataSet.colors = ChartColorTemplates.material()

        let chartData = CandleChartData(dataSet: dataSet)


        //Data set to CandleStickChartView instance
        ChartView.data = chartData


        // *************************************************************************
        // MARK: - HighLight

        //データの表示
        // タップでデータを選択できるか
        ChartView.highlightPerTapEnabled = true

        // Highlinghtの色を選択
        dataSet.highlightColor = UIColor.blue



        // HighLight; Color & Width, Highlightを非表示
        // Highlightカーソルの表示/非表示
        dataSet.setDrawHighlightIndicators(true)
        dataSet.drawVerticalHighlightIndicatorEnabled = true
        dataSet.drawHorizontalHighlightIndicatorEnabled = false
        //        dataSet.highlightLineWidth = 3.0


        // *************************************************************************
        // MARK: - Limit Lines

        let ll = ChartLimitLine(limit: 0.0001, label: "Target")
        ChartView.rightAxis.addLimitLine(ll)


        // *************************************************************************
        // TODO: - Test 途中。
        func chartValueSelected(chartView: ChartViewBase, entry: ChartDataEntry, dataSetIndex: Int, highlight: Highlight) {
            print("\(entries.count)")
        }


        // *************************************************************************

    }

}

