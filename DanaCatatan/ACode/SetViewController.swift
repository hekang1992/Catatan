//
//  SetViewController.swift
//  Catatan
//
//  Created by apple on 2024/3/28.
//

import UIKit
import TYAlertController
import MBProgressHUD_WJExtension
import DGCharts
import HandyJSON

class SetViewController: BaseViewController {
    
    lazy var bgView1: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor("#F4F8EE")
        return bgView
    }()
    
    lazy var setView: SetView = {
        let setView = SetView()
        return setView
    }()
    
    var model: HoveredModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addNavView()
        navView.nameLabel.text = "Bank Wealth"
        navView.block = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        view.insertSubview(bgView1, belowSubview: navView)
        bgView1.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        bgView1.addSubview(setView)
        setView.snp.makeConstraints { make in
            make.edges.equalTo(bgView1).inset(UIEdgeInsets(top: CGFloat(NAV_HIGH), left: 0, bottom: 0, right: 0))
        }
        setView.block = { [weak self] in
            self?.imageAleet()
        }
        setView.block1 = { [weak self] in
            let abc = UserDefaults.standard.object(forKey: APIBAERURL) as? String ?? ""
            var url: String = ""
            if abc.isEmpty {
                url = BASE_HTML_URL + "/nkimaFetch"
            }else {
                url = String(abc.dropLast(5)) + "/nkimaFetch"
            }
            self?.pushWebVC(url, "")
        }
        setView.block2 = { [weak self] in
            let abc = UserDefaults.standard.object(forKey: APIBAERURL) as? String ?? ""
            var url: String = ""
            if abc.isEmpty {
                url = BASE_HTML_URL
            }else {
                url = String(abc.dropLast(5))
            }
            self?.pushWebVC(url, "")
        }
        setView.block3 = {
            let email = "shahphai@outlook.com"
            if let emailURL = URL(string: "mailto:\(email)"), UIApplication.shared.canOpenURL(emailURL) {
                UIApplication.shared.open(emailURL, options: [:], completionHandler: nil)
            }
        }
        setView.block4 = { [weak self] in
            if IS_LOGIN {
                self?.logout()
            }else{
                self?.pushLogin()
            }
        }
        setView.block5 = { [weak self] in
            if IS_LOGIN {
                self?.delAcc()
            }else{
                self?.pushLogin()
            }
        }
        setView.block6 = { [weak self] in
            if IS_LOGIN {
                let chartView = AlertChartView()
                chartView.frame = self?.view.bounds ?? .zero
                let alertVC = TYAlertController(alert: chartView, preferredStyle: .actionSheet, transitionAnimation: .scaleFade)
                self?.present(alertVC!, animated: true)
                chartView.block = {
                    self?.dismiss(animated: true)
                }
                self?.setChartData(chartView.lineChartView)
            }else{
                self?.pushLogin()
            }
        }
        setView.block7 = { [weak self] in
            if IS_LOGIN {
                let reVc = ReViewController()
                self?.navigationController?.pushViewController(reVc, animated: true)
            }else{
                self?.pushLogin()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addHudView()
        NetApiWork.shared.requestAPI(params: [:], pageUrl: belowBelow, method: .put) { [weak self] baseModel in
            let awess = baseModel.awareness
            if awess == 0 || awess == 00 {
                let dict = baseModel.hovered
                let inModel = JSONDeserializer<HoveredModel>.deserializeFrom(dict: dict)
                if let model = inModel {
                    self?.model = model
                }
            }
            self?.removeHudView()
        } errorBlock: { [weak self] error in
            self?.removeHudView()
        }
        
    }
    
    func imageAleet() {
        let tipsView = TipsView()
        tipsView.imageV.image = UIImage(named: "successclear")
        tipsView.block = { [weak self] in
            self?.dismiss(animated: true)
        }
        tipsView.frame = self.view.bounds
        let alertVC = TYAlertController(alert: tipsView, preferredStyle: .alert, transitionAnimation: .scaleFade)
        self.present(alertVC!, animated: true)
    }
    
    func logout() {
        let tipsView = LogFOutView()
        tipsView.label.text = "Are you sure to log out of the current account?"
        tipsView.imageV.image = UIImage(named: "logoutfff")
        tipsView.block1 = { [weak self] in
            self?.dismiss(animated: true)
        }
        tipsView.block2 = { [weak self] in
            self?.dismiss(animated: true, completion: {
                if IS_LOGIN {
                    self?.logoutInfo()
                }else{
                    self?.pushLogin()
                }
            })
        }
        tipsView.frame = self.view.bounds
        let alertVC = TYAlertController(alert: tipsView, preferredStyle: .alert, transitionAnimation: .scaleFade)
        self.present(alertVC!, animated: true)
    }
    
    func delAcc() {
        let tipsView = LogFOutView()
        tipsView.label.text = "This operation will completely delete all account information and cannot be restored! Whether to continue?"
        tipsView.imageV.image = UIImage(named: "logoutfff")
        tipsView.block1 = { [weak self] in
            self?.dismiss(animated: true)
        }
        tipsView.block2 = { [weak self] in
            self?.dismiss(animated: true, completion: {
                if IS_LOGIN {
                    self?.deleAcc()
                }else{
                    self?.pushLogin()
                }
            })
        }
        tipsView.frame = self.view.bounds
        let alertVC = TYAlertController(alert: tipsView, preferredStyle: .alert, transitionAnimation: .scaleFade)
        self.present(alertVC!, animated: true)
    }
    
    func logoutInfo() {
        addHudView()
        delay(0.25) {
            let dict: [String: Any] = [:]
            NetApiWork.shared.requestAPI(params: dict, pageUrl: obliteratedYears, method: .get) { [weak self] model in
                let awess = model.awareness
                let edges = model.edges
                if awess == 0 || awess == 00 {
                    SaveLoginInfo.removeLoginInfo()
                    let dict = ["cleaved":"aa"]
                    CNotificationCenter.post(name: NSNotification.Name(SET_ROOTVC), object: nil, userInfo: dict)
                }
                self?.removeHudView()
                MBProgressHUD.wj_showPlainText(edges ?? "", view: nil)
            } errorBlock: { [weak self] error in
                self?.removeHudView()
            }
        }
    }
    
    func deleAcc() {
        addHudView()
        delay(0.25) {
            let dict: [String: Any] = [:]
            NetApiWork.shared.requestAPI(params: dict, pageUrl: familiarHeadless, method: .get) { [weak self] model in
                let awess = model.awareness
                let edges = model.edges
                if awess == 0 || awess == 00 {
                    SaveLoginInfo.removeLoginInfo()
                    let dict = ["cleaved":"aa"]
                    CNotificationCenter.post(name: NSNotification.Name(SET_ROOTVC), object: nil, userInfo: dict)
                }
                self?.removeHudView()
                MBProgressHUD.wj_showPlainText(edges ?? "", view: nil)
            } errorBlock: { [weak self] error in
                self?.removeHudView()
            }
        }
    }
    
    func pushLogin() {
        let login = LoginFakeViewController()
        let nav = BaseNavViewController(rootViewController: login)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: true, completion: nil)
    }
    
    func setChartData(_ lineChartView: LineChartView) {
        
        var array1 = model?.investment
        array1?.insert(0, at: 0)
        var array2 = model?.liabilities
        array2?.insert(0, at: 0)
        var array3 = model?.current
        array3?.insert(0, at: 0)
        var array4 = model?.fixed
        array4?.insert(0, at: 0)
        
        let dataPoints1 = array1
        let dataPoints2 = array2
        let dataPoints3 = array3
        let dataPoints4 = array4
        
        
        var entries1: [ChartDataEntry] = []
        var entries2: [ChartDataEntry] = []
        var entries3: [ChartDataEntry] = []
        var entries4: [ChartDataEntry] = []
        
        for i in 0..<(dataPoints1?.count ?? 0) {
            if i > 0 {
                entries1.append(ChartDataEntry(x: Double(i), y: Double(dataPoints1?[i] ?? 0)))
                entries2.append(ChartDataEntry(x: Double(i), y: Double(dataPoints2?[i] ?? 0)))
                entries3.append(ChartDataEntry(x: Double(i), y: Double(dataPoints3?[i] ?? 0)))
                entries4.append(ChartDataEntry(x: Double(i), y: Double(dataPoints4?[i] ?? 0)))
            }
        }
        
        let dataSet1 = LineChartDataSet(entries: entries1, label: "")
        let dataSet2 = LineChartDataSet(entries: entries2, label: "")
        let dataSet3 = LineChartDataSet(entries: entries3, label: "")
        let dataSet4 = LineChartDataSet(entries: entries4, label: "")
        
        dataSet1.setColor(UIColor("#188DFF"))
        dataSet1.setCircleColor(UIColor("#188DFF"))
        dataSet1.lineWidth = 2.0
        dataSet1.circleRadius = 3.0
        dataSet1.fillAlpha = 65/255
        dataSet1.fillColor = UIColor("#188DFF")
        dataSet1.highlightColor = UIColor.white
        
        dataSet2.setColor(UIColor("#FB9A01"))
        dataSet2.setCircleColor(UIColor("#FB9A01"))
        dataSet2.lineWidth = 2.0
        dataSet2.circleRadius = 3.0
        dataSet2.fillAlpha = 65/255
        dataSet2.fillColor = UIColor("#FB9A01")
        dataSet2.highlightColor = UIColor.white
        
        dataSet3.setColor(UIColor("#B3EE4B"))
        dataSet3.setCircleColor(UIColor("#B3EE4B"))
        dataSet3.lineWidth = 2.0
        dataSet3.circleRadius = 3.0
        dataSet3.fillAlpha = 65/255
        dataSet3.fillColor = UIColor("#B3EE4B")
        dataSet3.highlightColor = UIColor.white
        
        dataSet4.setColor(UIColor("#364880"))
        dataSet4.setCircleColor(UIColor("#364880"))
        dataSet4.lineWidth = 2.0
        dataSet4.circleRadius = 3.0
        dataSet4.fillAlpha = 65/255
        dataSet4.fillColor = UIColor("#364880")
        dataSet4.highlightColor = UIColor.white
        
        let chartDataSet = LineChartData(dataSets: [dataSet1, dataSet2, dataSet3, dataSet4])
        
        var array = model?.monthss
        array?.insert("0", at: 0)
        guard let customXLabels = array else { return }
        let formatter = IndexAxisValueFormatter(values: customXLabels)
        lineChartView.xAxis.valueFormatter = formatter
        
        lineChartView.data = chartDataSet
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
