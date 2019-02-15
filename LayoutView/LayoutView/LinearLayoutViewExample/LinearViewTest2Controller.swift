//
//  LinearViewTest2Controller.swift
//  iOS_Swift_LayoutExample
//
//  Created by admin on 2019/1/18.
//  Copyright © 2019 zhouqiao. All rights reserved.
//

import UIKit

class LinearViewTest2Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = UIColor.white
        parpareView()
    }
    
    override var prefersStatusBarHidden: Bool{
        return false
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation{
        return .none
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}

extension LinearViewTest2Controller {
    
    private func parpareView() {
        let rootView = LinearLayoutView(direction: .horizontal, width: .fill, height: .fill)
        rootView.backgroundColor = UIColor.gray
        rootView.margin = 10
        view.addSubview(rootView)
        
        let linearView1 = LinearLayoutView(direction: .horizontal, width: .fill, height: .fill)
        linearView1.backgroundColor = UIColor.random
        linearView1.margin = 10
        linearView1.weight = 1
        rootView.addSubview(linearView1)
        
        for _ in 0..<3{
            let button = UIButton()
            button.height = .fill
            button.width = .fill
            button.margin = 10
            button.weight = 1
            button.backgroundColor = UIColor.random
            linearView1.addSubview(button)
        }
        
        let button1 = UIButton()
        button1.height = .px(50)
        button1.width = .px(50)
        button1.margin = 10
        button1.backgroundColor = UIColor.random
        rootView.addSubview(button1)
//
        let button2 = UIButton()
        button2.height = .px(50)
        button2.width = .px(50)
        button2.margin = 10
        button2.gravity = .center
        button2.backgroundColor = UIColor.random
        rootView.addSubview(button2)
//
        let button3 = UIButton()
        button3.height = .px(50)
        button3.width = .px(50)
        button3.margin = 10
        button3.gravity = .bottom
        button3.backgroundColor = UIColor.random
        rootView.addSubview(button3)
    }
}
