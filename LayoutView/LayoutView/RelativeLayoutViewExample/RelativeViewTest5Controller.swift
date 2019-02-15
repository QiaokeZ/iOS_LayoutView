//
//  RelativeViewTest5Controller.swift
//  iOS_Swift_LayoutExample
//
//  Created by admin on 2019/1/22.
//  Copyright © 2019 zhouqiao. All rights reserved.
//

import UIKit

class RelativeViewTest5Controller: UIViewController {

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

extension RelativeViewTest5Controller {
    
    private func parpareView() {
        let rootView = RelativeLayoutView(width: .fill, height: .fill)
        rootView.backgroundColor = UIColor.random
//        rootView.isAutorotateEnabled = true
        rootView.margin = 10
        view.addSubview(rootView)

        let label = UILabel()
        label.height = .px(200)
        label.width = .px(200)
        label.margin = 10
        label.gravity = .center
        label.text = "label"
        label.textAlignment = .center
        label.backgroundColor = UIColor.random
        rootView.addSubview(label)
        
        let label1 = UILabel()
        label1.height = .px(50)
        label1.width = .px(50)
        label1.toTopOf = label
        label1.alignLeft = label
        label1.text = "label1"
        label1.backgroundColor = UIColor.random
        rootView.addSubview(label1)

        let label2 = UILabel()
        label2.height = .px(50)
        label2.width = .px(50)
        label2.toTopOf = label
        label2.alignRight = label
        label2.text = "label2"
        label2.backgroundColor = UIColor.random
        rootView.addSubview(label2)

        let label3 = UILabel()
        label3.height = .px(50)
        label3.width = .px(50)
        label3.toBottomOf = label
        label3.alignLeft = label
        label3.text = "label3"
        label3.backgroundColor = UIColor.random
        rootView.addSubview(label3)
        
        let label4 = UILabel()
        label4.height = .px(50)
        label4.width = .px(50)
        label4.toBottomOf = label
        label4.alignRight = label
        label4.text = "label4"
        label4.backgroundColor = UIColor.random
        rootView.addSubview(label4)
        
        let label5 = UILabel()
        label5.height = .px(50)
        label5.width = .px(50)
        label5.margin = 10
        label5.alignLeft = label
        label5.alignTop = label
        label5.text = "label5"
        label5.backgroundColor = UIColor.random
        rootView.addSubview(label5)
        
        let label6 = UILabel()
        label6.height = .px(50)
        label6.width = .px(50)
        label6.margin = 10
        label6.alignRight = label
        label6.alignTop = label
        label6.text = "label6"
        label6.backgroundColor = UIColor.random
        rootView.addSubview(label6)
        
        let label7 = UILabel()
        label7.height = .px(50)
        label7.width = .px(50)
        label7.margin = 10
        label7.alignLeft = label
        label7.alignBottom = label
        label7.text = "label7"
        label7.backgroundColor = UIColor.random
        rootView.addSubview(label7)
        
        let label8 = UILabel()
        label8.height = .px(50)
        label8.width = .px(50)
        label8.margin = 10
        label8.alignRight = label
        label8.alignBottom = label
        label8.text = "label8"
        label8.backgroundColor = UIColor.random
        rootView.addSubview(label8)
    }
    
}
