//
//  LinearViewTest1Controller.swift
//  iOS_Swift_LayoutExample
//
//  Created by admin on 2019/1/18.
//  Copyright © 2019 zhouqiao. All rights reserved.
//

import UIKit
import WebKit

class LinearViewTest1Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = UIColor.white
        parpareView()
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }

    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .none
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension LinearViewTest1Controller {
    
    private func parpareView() {
        let rootView = LinearLayoutView(direction: .vertical, width: .fill, height: .fill)
        rootView.backgroundColor = UIColor.gray
        rootView.margin = 10
        view.addSubview(rootView)

        for _ in 0..<2{
            let label = UILabel()
            label.width = .fill
            label.margin = 10
            label.weight = 1
            label.backgroundColor = UIColor.random
            rootView.addSubview(label)
        }

        let linearView = LinearLayoutView(direction: .vertical, width: .fill, height: .wrap)
        linearView.backgroundColor = UIColor.random
        linearView.margin = 10
        rootView.addSubview(linearView)

        let linearView1 = LinearLayoutView(direction: .vertical, width: .fill, height: .wrap)
        linearView1.backgroundColor = UIColor.random
        linearView1.margin = 10
        linearView.addSubview(linearView1)

        for _ in 0..<2{
            let label = UILabel()
            label.width = .fill
            label.height = .px(30)
            label.margin = 10
            label.backgroundColor = UIColor.random
            linearView1.addSubview(label)
        }

        let label = UILabel()
        label.width = .fill
        label.margin = 10
        label.weight = 1
        label.backgroundColor = UIColor.random
        rootView.addSubview(label)
    }
}
