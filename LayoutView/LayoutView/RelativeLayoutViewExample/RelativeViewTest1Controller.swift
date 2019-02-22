

import UIKit

class RelativeViewTest1Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = UIColor.white
        parpareView()
    }
}

extension RelativeViewTest1Controller {
    
    private func parpareView() {
        let rootView = RelativeLayoutView(width: .fill, height: .fill)
        rootView.backgroundColor = UIColor.random
        rootView.lv.margin = 10
        view.addSubview(rootView)
        
        let label1 = UILabel()
        label1.lv.height = .px(100)
        label1.lv.width = .px(100)
        label1.lv.margin = 10
        label1.textAlignment = .center
        label1.lv.gravity = .centerVertical
        label1.text = "label1"
        label1.backgroundColor = UIColor.random
        rootView.addSubview(label1)
        
        let label2 = UILabel()
        label2.lv.height = .px(100)
        label2.lv.width = .px(100)
        label2.lv.margin = 10
        label2.textAlignment = .center
        label2.lv.gravity = .centerHorizontal
        label2.text = "label2"
        label2.backgroundColor = UIColor.random
        rootView.addSubview(label2)
        
        let label3 = UILabel()
        label3.lv.height = .px(100)
        label3.lv.width = .px(100)
        label3.lv.margin = 10
        label3.textAlignment = .center
        label3.lv.alignParent = [.right]
        label3.lv.gravity = .centerVertical
        label3.text = "label3"
        label3.backgroundColor = UIColor.random
        rootView.addSubview(label3)
        
        let label4 = UILabel()
        label4.lv.height = .px(100)
        label4.lv.width = .px(100)
        label4.lv.margin = 10
        label4.textAlignment = .center
        label4.lv.alignParent = [.bottom]
        label4.lv.gravity = .centerHorizontal
        label4.text = "label4"
        label4.backgroundColor = UIColor.random
        rootView.addSubview(label4)
    }

}
