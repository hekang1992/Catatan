//
//  SetView.swift
//  Catatan
//
//  Created by apple on 2024/3/28.
//

import UIKit
import MBProgressHUD_WJExtension

class SetView: UIView {
    
    var block: (() -> Void)?
    var block1: (() -> Void)?
    var block2: (() -> Void)?
    var block3: (() -> Void)?
    var block4: (() -> Void)?
    var block5: (() -> Void)?
    var block6: (() -> Void)?
    var block7: (() -> Void)?
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.backgroundColor = UIColor("#F4F8EE")
        return scrollView
    }()
    
    lazy var label1: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont(name: Futura_Bold, size: 22)!, textColor: .black, textAlignment: .left)
        let nameStr = USER_DEFAULTS.object(forKey: LOGIN_PHONE) as? String
        label1.text = "Hi,\(nameStr ?? "User")"
        return label1
    }()
    
    lazy var label2: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont(name: Futura_Medium, size: 16)!, textColor: .black, textAlignment: .left)
        label1.text = "How are you today?"
        label1.alpha = 0.5
        return label1
    }()
    
    lazy var label3: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont(name: Futura_Bold, size: 16)!, textColor: .black, textAlignment: .center)
        label1.text = "Line Chart"
        return label1
    }()
    
    lazy var label4: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont(name: Futura_Medium, size: 14)!, textColor: .black, textAlignment: .center)
        label1.text = "last six months"
        label1.alpha = 0.5
        return label1
    }()
    
    lazy var label5: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont(name: Futura_Bold, size: 16)!, textColor: .black, textAlignment: .left)
        label1.text = "Recycle Bin"
        return label1
    }()
    
    lazy var label6: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont(name: Futura_Medium, size: 14)!, textColor: .black, textAlignment: .left)
        label1.text = "last six months"
        label1.alpha = 0.5
        return label1
    }()
    
    lazy var label8: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont(name: Futura_Bold, size: 16)!, textColor: .black, textAlignment: .left)
        label1.text = "Clear Cache"
        return label1
    }()
    
    lazy var label7: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont(name: Futura_Medium, size: 14)!, textColor: .black, textAlignment: .left)
        let cacheDirectoryURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        let cacheSize = calculateCacheSize(forDirectory: cacheDirectoryURL)
        label1.text = cacheSize
        label1.alpha = 0.5
        return label1
    }()
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor("#DFEFFF")
        bgView.layer.cornerRadius = 26.pix()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        bgView.addGestureRecognizer(tapGesture)
        bgView.tag = 200
        return bgView
    }()
    
    lazy var bgView1: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor("#FFE8C4")
        bgView.layer.cornerRadius = 26.pix()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        bgView.addGestureRecognizer(tapGesture)
        bgView.tag = 201
        return bgView
    }()
    
    lazy var bgView2: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor("#E9FFC1")
        bgView.layer.cornerRadius = 26.pix()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        bgView.addGestureRecognizer(tapGesture)
        bgView.tag = 202
        return bgView
    }()
    
    lazy var icon1: UIImageView = {
        let icon1 = UIImageView()
        icon1.contentMode = .scaleAspectFill
        icon1.image = UIImage(named: "fffrrr")
        return icon1
    }()
    
    lazy var icon2: UIImageView = {
        let icon1 = UIImageView()
        icon1.image = UIImage(named: "huishouzhan-2")
        return icon1
    }()
    
    lazy var icon3: UIImageView = {
        let icon1 = UIImageView()
        icon1.image = UIImage(named: "a-home22")
        return icon1
    }()
    
    lazy var set1: SetCellView = {
        let set1 = SetCellView()
        set1.iconImageView.image = UIImage(named: "about us")
        set1.nameLable.text = "User Agreement"
        set1.block = { [weak self] in
            self?.block1!()
        }
        return set1
    }()
    
    lazy var set2: SetCellView = {
        let set1 = SetCellView()
        set1.iconImageView.image = UIImage(named: "about us1")
        set1.nameLable.text = "About Us"
        set1.block = { [weak self] in
            self?.block2!()
        }
        return set1
    }()
    
    lazy var set3: SetCellView = {
        let set1 = SetCellView()
        set1.iconImageView.image = UIImage(named: "feedback")
        set1.nameLable.text = "Feedback"
        set1.block = { [weak self] in
            self?.block3!()
        }
        return set1
    }()
    
    lazy var set4: SetCellView = {
        let set1 = SetCellView()
        set1.iconImageView.image = UIImage(named: "logout")
        set1.nameLable.text = "Logout"
        set1.block = { [weak self] in
            self?.block4!()
        }
        return set1
    }()
    
    lazy var set5: SetCellView = {
        let set1 = SetCellView()
        set1.iconImageView.image = UIImage(named: "delete account")
        set1.nameLable.text = "Delete account"
        set1.block = { [weak self] in
            self?.block5!()
        }
        return set1
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scrollView)
        scrollView.addSubview(label1)
        scrollView.addSubview(label2)
        scrollView.addSubview(bgView)
        bgView.addSubview(icon1)
        bgView.addSubview(label3)
        bgView.addSubview(label4)
        scrollView.addSubview(bgView1)
        bgView1.addSubview(icon2)
        bgView1.addSubview(label6)
        bgView1.addSubview(label5)
        scrollView.addSubview(bgView2)
        bgView2.addSubview(icon3)
        bgView2.addSubview(label8)
        bgView2.addSubview(label7)
        scrollView.addSubview(set1)
        scrollView.addSubview(set2)
        scrollView.addSubview(set3)
        scrollView.addSubview(set4)
        scrollView.addSubview(set5)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        label1.snp.makeConstraints { make in
            make.top.equalTo(scrollView).offset(10.pix())
            make.left.equalTo(scrollView).offset(20.pix())
            make.height.equalTo(29.pix())
        }
        label2.snp.makeConstraints { make in
            make.top.equalTo(label1.snp.bottom)
            make.left.equalTo(scrollView).offset(20.pix())
            make.height.equalTo(29.pix())
        }
        bgView.snp.makeConstraints { make in
            make.left.equalTo(scrollView).offset(20.pix())
            make.top.equalTo(label2.snp.bottom).offset(24.pix())
            make.size.equalTo(CGSize(width: 155.pix(), height: 236.pix()))
        }
        bgView1.snp.makeConstraints { make in
            make.right.equalTo(self).offset(-24.pix())
            make.top.equalTo(bgView.snp.top)
            make.size.equalTo(CGSize(width: 155.pix(), height: 110.pix()))
        }
        bgView2.snp.makeConstraints { make in
            make.right.equalTo(self).offset(-24.pix())
            make.top.equalTo(bgView1.snp.bottom).offset(16.pix())
            make.size.equalTo(CGSize(width: 155.pix(), height: 110.pix()))
        }
        icon1.snp.makeConstraints { make in
            make.centerX.equalTo(bgView)
            make.size.equalTo(CGSizeMake(106.pix(), 104.pix()))
            make.top.equalTo(bgView).offset(42.pix())
        }
        label3.snp.makeConstraints { make in
            make.centerX.equalTo(bgView)
            make.top.equalTo(icon1.snp.bottom).offset(14.pix())
            make.height.equalTo(25.pix())
        }
        label4.snp.makeConstraints { make in
            make.centerX.equalTo(bgView)
            make.top.equalTo(label3.snp.bottom)
            make.height.equalTo(19.pix())
        }
        icon2.snp.makeConstraints { make in
            make.left.equalTo(bgView1).offset(13.pix())
            make.top.equalTo(bgView1).offset(17.pix())
            make.size.equalTo(CGSizeMake(31, 29))
        }
        label6.snp.makeConstraints { make in
            make.left.equalTo(bgView1).offset(14.pix())
            make.top.equalTo(icon2.snp.bottom).offset(7.pix())
            make.height.equalTo(19.pix())
        }
        label5.snp.makeConstraints { make in
            make.left.equalTo(bgView1).offset(14.pix())
            make.top.equalTo(label6.snp.bottom)
            make.height.equalTo(25.pix())
        }
        icon3.snp.makeConstraints { make in
            make.left.equalTo(bgView2).offset(13.pix())
            make.top.equalTo(bgView2).offset(17.pix())
            make.size.equalTo(CGSizeMake(31, 29))
        }
        label7.snp.makeConstraints { make in
            make.left.equalTo(bgView2).offset(14.pix())
            make.top.equalTo(icon3.snp.bottom).offset(7.pix())
            make.height.equalTo(19.pix())
        }
        label8.snp.makeConstraints { make in
            make.left.equalTo(bgView2).offset(14.pix())
            make.top.equalTo(label7.snp.bottom)
            make.height.equalTo(25.pix())
        }
        set1.snp.makeConstraints { make in
            make.left.equalTo(scrollView).offset(22.pix())
            make.centerX.equalTo(scrollView)
            make.top.equalTo(bgView.snp.bottom).offset(24.pix())
            make.height.equalTo(54.pix())
        }
        set2.snp.makeConstraints { make in
            make.left.equalTo(scrollView).offset(22.pix())
            make.centerX.equalTo(scrollView)
            make.top.equalTo(set1.snp.bottom).offset(14.pix())
            make.height.equalTo(54.pix())
        }
        set3.snp.makeConstraints { make in
            make.left.equalTo(scrollView).offset(22.pix())
            make.centerX.equalTo(scrollView)
            make.top.equalTo(set2.snp.bottom).offset(14.pix())
            make.height.equalTo(54.pix())
        }
        set4.snp.makeConstraints { make in
            make.left.equalTo(scrollView).offset(22.pix())
            make.centerX.equalTo(scrollView)
            make.top.equalTo(set3.snp.bottom).offset(14.pix())
            make.height.equalTo(54.pix())
        }
        set5.snp.makeConstraints { make in
            make.left.equalTo(scrollView).offset(22.pix())
            make.centerX.equalTo(scrollView)
            make.top.equalTo(set4.snp.bottom).offset(14.pix())
            make.height.equalTo(54.pix())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.set5.setNeedsLayout()
        self.layoutIfNeeded()
        let maxY = self.set5.frame.maxY
        self.scrollView.contentSize = CGSize(width: 0, height: maxY + 40.pix())
    }
    
}


extension SetView {
    func calculateCacheSize(forDirectory directory: URL) -> String {
        let fileManager = FileManager.default
        var totalSize: Int64 = 0
        guard let enumerator = fileManager.enumerator(at: directory, includingPropertiesForKeys: nil) else {
            return "0 MB"
        }
        for case let fileURL as URL in enumerator {
            do {
                let attributes = try fileManager.attributesOfItem(atPath: fileURL.path)
                if let fileSize = attributes[.size] as? Int64 {
                    totalSize += fileSize
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
        let totalSizeInMB = Double(totalSize) / (1024 * 1024)
        let formattedSize = String(format: "%.2f MB", totalSizeInMB)
        return formattedSize
    }
    
    func deleteCache(forDirectory directory: URL) {
        let fileManager = FileManager.default
        guard let enumerator = fileManager.enumerator(at: directory, includingPropertiesForKeys: nil) else {
            return
        }
        for case let fileURL as URL in enumerator {
            do {
                try fileManager.removeItem(at: fileURL)
                print("Deleted file: \(fileURL.lastPathComponent)")
            } catch {
                print("Error deleting file: \(error.localizedDescription)")
            }
        }
        print("Cache cleared.")
    }
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        guard let tappedView = sender.view else { return }
        switch tappedView.tag {
        case 200:
            self.block6?()
            break
        case 201:
            self.block7?()
            break
        case 202:
            let cacheDirectoryURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
            deleteCache(forDirectory: cacheDirectoryURL)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                self.label7.text = "0.00 MB"
                self.block!()
            }
            break
        default:
            break
        }
    }
    
}
