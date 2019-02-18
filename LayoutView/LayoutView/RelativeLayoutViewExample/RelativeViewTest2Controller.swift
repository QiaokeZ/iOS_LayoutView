
import UIKit

class RelativeViewTest2Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = UIColor.white
        parpareView()
    }
}

extension RelativeViewTest2Controller {

    private func parpareView() {
        let rootView = RelativeLayoutView(width: .fill, height: .fill)
        rootView.backgroundColor = UIColor.random
        rootView.margin = 10
        view.addSubview(rootView)

        let label = UILabel()
        label.height = .px(100)
        label.width = .px(100)
        label.margin = 10
        label.textAlignment = .center
        label.gravity = .center
        label.text = "label"
        label.backgroundColor = UIColor.random
        rootView.addSubview(label)

        let label1 = UILabel()
        label1.height = .px(100)
        label1.width = .px(100)
        label1.margin = 10
        label1.textAlignment = .center
        label1.toTopOf = label
        label1.text = "label1"
        label1.backgroundColor = UIColor.random
        rootView.addSubview(label1)

        let label2 = UILabel()
        label2.height = .px(100)
        label2.width = .px(100)
        label2.margin = 10
        label2.textAlignment = .center
        label2.toLeftOf = label
        label2.text = "label2"
        label2.backgroundColor = UIColor.random
        rootView.addSubview(label2)

        let label3 = UILabel()
        label3.height = .px(100)
        label3.width = .px(100)
        label3.margin = 10
        label3.textAlignment = .center
        label3.toBottomOf = label
        label3.text = "label3"
        label3.backgroundColor = UIColor.random
        rootView.addSubview(label3)

        let label4 = UILabel()
        label4.height = .px(100)
        label4.width = .px(100)
        label4.margin = 10
        label4.textAlignment = .center
        label4.toRightOf = label
        label4.text = "label4"
        label4.backgroundColor = UIColor.random
        rootView.addSubview(label4)
    }

}
