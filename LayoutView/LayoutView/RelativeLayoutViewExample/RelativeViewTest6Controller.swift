//
//  RelativeViewTest6Controller.swift
//  iOS_Swift_LayoutExample
//
//  Created by admin on 2019/1/22.
//  Copyright © 2019 zhouqiao. All rights reserved.
//

import UIKit

class RelativeViewTest6Controller: UIViewController {

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

extension RelativeViewTest6Controller {
    
    private func parpareView() {
        let rootView = RelativeLayoutView(width: .fill, height: .fill)
        rootView.backgroundColor = UIColor.random
//        rootView.isAutorotateEnabled = true
        rootView.margin = 10
        view.addSubview(rootView)
        
        let linearView1 = LinearLayoutView(direction: .horizontal, width: .fill, height: .px(200))
        linearView1.backgroundColor = UIColor.random
        linearView1.margin = 10
        linearView1.gravity = .center
        rootView.addSubview(linearView1)
        
        for _ in 0..<3{
            let button = UIButton()
            button.height = .fill
            button.width = .fill
            button.weight = 1
            button.backgroundColor = UIColor.random
            linearView1.addSubview(button)
        }
    }
}
