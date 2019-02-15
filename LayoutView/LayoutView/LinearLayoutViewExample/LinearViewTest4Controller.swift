//
//  LinearViewTest4Controller.swift
//  iOS_Swift_LayoutExample
//
//  Created by admin on 2019/1/22.
//  Copyright © 2019 zhouqiao. All rights reserved.
//

import UIKit

class LinearViewTest4Controller: UIViewController {

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

extension LinearViewTest4Controller {
    
    private func parpareView() {
        let rootView = LinearLayoutView(direction: .vertical, width: .fill, height: .fill)
        rootView.backgroundColor = UIColor.gray
//        rootView.isAutorotateEnabled = true
        rootView.marginTop = 10
        rootView.marginLeft = 5
        rootView.marginBottom = 10
        rootView.marginRight = 5
        view.addSubview(rootView)

        let relativeView = RelativeLayoutView(width: .fill, height: .px(100))
        relativeView.backgroundColor = UIColor.random
        relativeView.margin = 10
        rootView.addSubview(relativeView)
        
        let relative1View = RelativeLayoutView(width: .fill, height: .fill)
        relative1View.backgroundColor = UIColor.random
        relative1View.margin = 10
        rootView.addSubview(relative1View)
    }

}
