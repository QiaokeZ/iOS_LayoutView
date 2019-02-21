

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
        rootView.margin = 10
        rootView.backgroundColor = UIColor.random
        view.addSubview(rootView)

        for i in 0..<33{
            let label = UILabel()
            label.marginLeft = 5
            label.marginTop = 5
            label.height = .px(100)
            label.width = .px(60)
            label.text = "label\(i)"
            label.textAlignment = .center
            label.backgroundColor = UIColor.random
            rootView.addSubview(label)
        }
    }

}
