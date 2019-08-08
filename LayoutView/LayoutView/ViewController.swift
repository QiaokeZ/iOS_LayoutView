//
//  ViewController.swift
//  iOS_Swift_LayoutExample
//
//  Created by admin on 2019/1/18.
//  Copyright © 2019 zhouqiao. All rights reserved.
//

import UIKit


class InvoicePopupView: UIView {
    
//    weak var delegate: InvoicePopupViewDelegate?
    
    private var rootView: LinearLayoutView!
    private var titleValue: UILabel!
    private var receiverValue: UILabel!
    private var addressValue: UILabel!
    private var priceValue: UILabel!
    
    private override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        prepare()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func update(title: String, receiver: String, address: String, price: String) {
        addressValue.text = address
        let addressValueSize = NSString(string: address).boundingRect(with: CGSize(width: addressValue.width, height: 1000),
                                                                      options: [.usesLineFragmentOrigin],
                                                                      attributes: [NSAttributedString.Key.font: addressValue.font],
                                                                      context: nil).size
        if addressValueSize.height > 25 {
    
            addressValue.lv.height = .pt(addressValueSize.height)
        }
        rootView.layout()
    }
    
    private func prepare() {
        frame = UIScreen.main.bounds
        backgroundColor = UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 0.5)
        
//        rootView = RelativeLayoutView(width: .fill, height: .fill)
//        addSubview(rootView)
        
        rootView = LinearLayoutView(direction: .vertical, width: .pt(width * 0.7), height: .wrap)
        rootView.backgroundColor = UIColor.red
        rootView.lv.marginTop = 100
        rootView.layer.cornerRadius = 5
        rootView.lv.gravity = .center
        addSubview(rootView)
        
        let addressView = LinearLayoutView(direction: .horizontal, width: .fill, height: .wrap)
        addressView.lv.margin = 5
        addressView.backgroundColor = UIColor.white
        rootView.addSubview(addressView)
        
        let address = UILabel()
        address.backgroundColor = UIColor.random
        address.lv.weight = 1
        address.lv.margin = 5
        address.lv.height = .pt(25)
        address.text = "收件地址:"
        address.textAlignment = .right
        address.font =  UIFont.systemFont(ofSize: 15)
        address.textColor = UIColor.rgbaHex(rgb: 0x8e8e93)
        addressView.addSubview(address)
        
        addressValue = UILabel()
        addressValue.backgroundColor = UIColor.random
        addressValue.lv.margin = 5
        addressValue.numberOfLines = 0
        addressValue.lv.weight = 1.7
        addressValue.lv.height = .pt(50)
        addressValue.text = "广东省, 深圳市, 福田区, 农轩路, 55号"
        addressValue.font =  UIFont.systemFont(ofSize: 15)
        addressView.addSubview(addressValue)

        rootView.layout()
    }
    
    @objc private func buttonClicked(button: UIButton) {
//        delegate?.invoicePopupView(self, clickedButton: button)
    }
}



class ViewController: UIViewController {

    let items = ["LinearLayoutView", "RelativeLayoutView", "FlowLayoutView"]
   private var popupView: InvoicePopupView!
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        popupView.isHidden = false
        popupView.update(title: "123", receiver: "123", address:  "Swift is a powerful and intuitive programming language for iOS, macOS, tvOS, and watchOS. Writing Swift code is interactive and fun, the syntax is", price: "123")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "LayoutView"

  
        popupView = InvoicePopupView()
//        popupView.delegate = self
//        popupView.isHidden = true
        view.addSubview(popupView)


//        let addressView = LinearLayoutView(direction: .horizontal, width: .fill, height: .wrap)
//        addressView.lv.marginRight = 5
//        view.addSubview(addressView)
//
//        let address = UILabel()
//        address.lv.weight = 1
//        address.lv.height = .wrap
//        address.text = "收件地址:"
//        address.backgroundColor = UIColor.random
//        address.textAlignment = .right
////        address.font = title.font
////        address.textColor = title.textColor
//        addressView.addSubview(address)

//        let addressValue = UILabel()
//        addressValue.lv.marginLeft = 5
//        addressValue.numberOfLines = 0
//        addressValue.lv.weight = 1.7
//        addressValue.backgroundColor = UIColor.random
//        addressValue.lv.height = .pt(25)
//        addressValue.text = "广东省, 深圳市, 福田区, 农轩路, 55号"
////        addressValue.font = title.font
//        addressView.addSubview(addressValue)

//        addressView.layout()

        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "layout")

        
//        let rootView1 = RelativeLayoutView(width: .fill, height: .wrap)
//        rootView1.backgroundColor = UIColor.random
//        rootView1.lv.marginTop = 100
//        view.addSubview(rootView1)
////
////
//        let rootView = LinearLayoutView(direction: .horizontal, width: .fill, height: .wrap)
////        rootView.backgroundColor = UIColor.random
//        rootView1.addSubview(rootView)
//
//        let titleLabel = UILabel()
//        titleLabel.backgroundColor = UIColor.random
//        titleLabel.lv.weight = 1
//        titleLabel.lv.height = .pt(45)
//        titleLabel.lv.gravity = .center
//        titleLabel.text = "驳回理由"
//        titleLabel.textColor = UIColor.black
//        titleLabel.font = UIFont.systemFont(ofSize: 15)
//        rootView.addSubview(titleLabel)
//
//        let contentLabel = UILabel()
//        contentLabel.numberOfLines = 0
//        contentLabel.backgroundColor = UIColor.random
//        contentLabel.lv.weight = 3
//        contentLabel.lv.margin = 10
//        contentLabel.text = "Swift is a powerful and intuitive programming language for iOS, macOS, tvOS, and watchOS. Writing Swift code is interactive and fun, the syntax is"
//        contentLabel.textAlignment = .right
//        contentLabel.font = titleLabel.font
//        rootView.addSubview(contentLabel)
//        rootView1.layout()
//
//        let contentLabelHeight = contentLabel.sizeThatFits(contentLabel.frame.size).height
//        if contentLabelHeight > 40 {
//            contentLabel.lv.height = .pt(contentLabelHeight + 5)
//        }
//        rootView1.layout()


    
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "layout", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(LinearLayoutViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(RelativeLayoutViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(FlowLayoutViewController(), animated: true)
        default:
            break
        }
    }
}

