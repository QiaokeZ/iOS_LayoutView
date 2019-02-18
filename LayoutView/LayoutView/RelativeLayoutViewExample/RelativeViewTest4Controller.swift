
import UIKit

class RelativeViewTest4Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = UIColor.white
        parpareView()
    }
}

extension RelativeViewTest4Controller {
    
    private func parpareView() {
        let rootView = RelativeLayoutView(width: .fill, height: .fill)
        rootView.backgroundColor = UIColor.random
        rootView.margin = 10
        view.addSubview(rootView)

        let label = UILabel()
        label.height = .px(100)
        label.width = .px(100)
        label.margin = 10
        label.alignParent = [.top, .left]
        label.text = "label"
        label.textAlignment = .center
        label.backgroundColor = UIColor.random
        rootView.addSubview(label)

        let label1 = UILabel()
        label1.height = .px(100)
        label1.width = .px(100)
        label1.margin = 10
        label1.alignParent = [.top, .right]
        label1.text = "label1"
        label1.textAlignment = .center
        label1.backgroundColor = UIColor.random
        rootView.addSubview(label1)

        let label2 = UILabel()
        label2.height = .px(100)
        label2.width = .px(100)
        label2.margin = 10
        label2.alignParent = [.bottom, .left]
        label2.text = "label2"
        label2.textAlignment = .center
        label2.backgroundColor = UIColor.random
        rootView.addSubview(label2)

        let label3 = UILabel()
        label3.height = .px(100)
        label3.width = .px(100)
        label3.margin = 10
        label3.alignParent = [.bottom, .right]
        label3.text = "label3"
        label3.textAlignment = .center
        label3.backgroundColor = UIColor.random
        rootView.addSubview(label3)
    }
    
}
