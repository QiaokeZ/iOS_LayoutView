

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
  
        for i in 0..<3{
            let label = UILabel()
            label.height = .fill
            label.margin = 5
            label.weight = 1
            label.text = "label\(i)"
            label.textAlignment = .center
            label.backgroundColor = UIColor.random
            linearView1.addSubview(label)
        }
        
        let linearView2 = LinearLayoutView(direction: .vertical,  width: .fill, height: .fill)
        linearView2.backgroundColor = UIColor.random
        linearView2.margin = 10
        linearView2.weight = 1
        rootView.addSubview(linearView2)
        
        for i in 0..<3{
            let label = UILabel()
            label.width = .fill
            label.margin = 5
            label.weight = 1
            label.text = "label\(i)"
            label.textAlignment = .center
            label.backgroundColor = UIColor.random
            linearView2.addSubview(label)
        }
    }
}
