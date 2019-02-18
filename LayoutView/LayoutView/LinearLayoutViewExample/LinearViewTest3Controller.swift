//
//  LinearViewTest3Controller.swift
//  iOS_Swift_LayoutExample
//
//  Created by admin on 2019/1/20.
//  Copyright © 2019年 zhouqiao. All rights reserved.
//

import UIKit

class LinearViewTest3Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = UIColor.white
        parpareView()
    }
}

extension LinearViewTest3Controller {
    
    private func parpareView() {
        let rootView = LinearLayoutView(direction: .vertical, width: .fill, height: .fill)
        rootView.backgroundColor = UIColor.gray
        rootView.margin = 10
        view.addSubview(rootView)
        
        let linearView1 = LinearLayoutView(direction: .horizontal, width: .fill, height: .fill)
        linearView1.backgroundColor = UIColor.random
        linearView1.weight = 1
        linearView1.margin = 10
        rootView.addSubview(linearView1)
  
        for _ in 0..<3{
            let button = UIButton()
            button.height = .fill
            button.margin = 10
            button.weight = 1
            button.backgroundColor = UIColor.random
            linearView1.addSubview(button)
        }
        
        let linearView2 = LinearLayoutView(direction: .vertical,  width: .fill, height: .fill)
        linearView2.backgroundColor = UIColor.random
        linearView2.margin = 10
        linearView2.weight = 1
        rootView.addSubview(linearView2)
        
        for _ in 0..<3{
            let button = UIButton()
            button.width = .fill
            button.margin = 10
            button.weight = 1
            button.backgroundColor = UIColor.random
            linearView2.addSubview(button)
        }
    }
}
