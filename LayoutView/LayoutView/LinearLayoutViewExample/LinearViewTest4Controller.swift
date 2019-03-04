

import UIKit

class LinearViewTest4Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = UIColor.white
        parpareView()
    }
}

extension LinearViewTest4Controller {
    
    private func parpareView() {
        let rootView = LinearLayoutView(direction: .vertical, contentGravity: .center, width: .fill, height: .fill)
        rootView.backgroundColor = UIColor.gray
        rootView.lv.marginTop = 10
        rootView.lv.marginLeft = 5
        rootView.lv.marginBottom = 10
        rootView.lv.marginRight = 5
        view.addSubview(rootView)
        
        let linearView2 = LinearLayoutView(direction: .vertical, width: .fill, height: .fill)
        linearView2.backgroundColor = UIColor.random
        linearView2.lv.weight = 1
        linearView2.lv.margin = 5
        rootView.addSubview(linearView2)
        
        let linearView3 = LinearLayoutView(direction: .horizontal, width: .fill, height: .fill)
        linearView3.backgroundColor = UIColor.random
        linearView3.lv.weight = 1
        linearView3.lv.margin = 5
        linearView2.addSubview(linearView3)
        
        let linearView4 = LinearLayoutView(direction: .horizontal, width: .fill, height: .fill)
        linearView4.backgroundColor = UIColor.random
        linearView4.lv.weight = 2
        linearView4.lv.margin = 5
        linearView3.addSubview(linearView4)
        
        for i in 0..<3{
            let label = UILabel()
            label.lv.height = .fill
            label.lv.margin = 5
            label.lv.weight = 1
            label.text = "label\(i)"
            label.textAlignment = .center
            label.backgroundColor = UIColor.random
            linearView4.addSubview(label)
        }
        
        let linearView5 = LinearLayoutView(direction: .vertical, width: .fill, height: .fill)
        linearView5.backgroundColor = UIColor.random
        linearView5.lv.weight = 1
        linearView5.lv.margin = 5
        linearView3.addSubview(linearView5)
        
        for i in 0..<3{
            let label = UILabel()
            label.lv.width = .fill
            label.lv.margin = 5
            label.lv.weight = 1
            label.text = "label\(i)"
            label.textAlignment = .center
            label.backgroundColor = UIColor.random
            linearView5.addSubview(label)
        }
    }
}
