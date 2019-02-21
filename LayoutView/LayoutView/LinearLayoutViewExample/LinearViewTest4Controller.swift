

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
        let rootView = LinearLayoutView(direction: .vertical, gravity: .center, width: .fill, height: .fill)
        rootView.backgroundColor = UIColor.gray
        rootView.marginTop = 10
        rootView.marginLeft = 5
        rootView.marginBottom = 10
        rootView.marginRight = 5
        view.addSubview(rootView)
        
        let linearView2 = LinearLayoutView(direction: .vertical, width: .fill, height: .fill)
        linearView2.backgroundColor = UIColor.random
        linearView2.weight = 1
        linearView2.margin = 5
        rootView.addSubview(linearView2)
        
        let linearView3 = LinearLayoutView(direction: .horizontal, width: .fill, height: .fill)
        linearView3.backgroundColor = UIColor.random
        linearView3.weight = 1
        linearView3.margin = 5
        linearView2.addSubview(linearView3)
        
        let linearView4 = LinearLayoutView(direction: .horizontal, width: .fill, height: .fill)
        linearView4.backgroundColor = UIColor.random
        linearView4.weight = 2
        linearView4.margin = 5
        linearView3.addSubview(linearView4)
        
        for i in 0..<3{
            let label = UILabel()
            label.height = .fill
            label.margin = 5
            label.weight = 1
            label.text = "label\(i)"
            label.textAlignment = .center
            label.backgroundColor = UIColor.random
            linearView4.addSubview(label)
        }
        
        let linearView5 = LinearLayoutView(direction: .vertical, width: .fill, height: .fill)
        linearView5.backgroundColor = UIColor.random
        linearView5.weight = 1
        linearView5.margin = 5
        linearView3.addSubview(linearView5)
        
        for i in 0..<3{
            let label = UILabel()
            label.width = .fill
            label.margin = 5
            label.weight = 1
            label.text = "label\(i)"
            label.textAlignment = .center
            label.backgroundColor = UIColor.random
            linearView5.addSubview(label)
        }
    }
}
