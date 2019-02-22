

import UIKit

class FlowViewTest1Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = UIColor.white
        parpareView()
    }
}

extension FlowViewTest1Controller{
    
    private func parpareView() {
        let rootView = FlowLayoutView(direction: .vertical, width: .fill, height: .fill)
        rootView.lv.margin = 10
        rootView.backgroundColor = UIColor.random
        view.addSubview(rootView)

        for i in 0..<33{
            let label = UILabel()
            label.lv.marginLeft = 5
            label.lv.marginTop = 5
            label.lv.height = .px(100)
            label.lv.width = .px(60)
            label.text = "label\(i)"
            label.textAlignment = .center
            label.backgroundColor = UIColor.random
            rootView.addSubview(label)
        }
    }

}
