

import UIKit

class FlowViewTest2Controller: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = UIColor.white
        parpareView()
    }
}

extension FlowViewTest2Controller{
    
    private func parpareView() {
        
        let rootView = FlowLayoutView(direction: .horizontal, width: .fill, height: .fill)
        rootView.margin = 10
        rootView.backgroundColor = UIColor.random
        view.addSubview(rootView)

        for i in 0..<40{
            let label = UILabel()
            label.marginLeft = 5
            label.marginTop = 5
            label.width = .px(80)
            label.height = .px(50)
            label.text = "label\(i)"
            label.textAlignment = .center
            label.backgroundColor = UIColor.random
            rootView.addSubview(label)
        }
    }
}
