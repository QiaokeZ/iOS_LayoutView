
import UIKit

class LinearViewTest2Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = UIColor.white
        parpareView()
    }
}

extension LinearViewTest2Controller {
    
    private func parpareView() {
        let rootView = LinearLayoutView(direction: .horizontal, width: .fill, height: .fill)
        rootView.backgroundColor = UIColor.gray
        rootView.margin = 10
        view.addSubview(rootView)
        
        let label0 = UILabel()
        label0.height = .fill
        label0.margin = 5
        label0.weight = 1
        label0.textAlignment = .center
        label0.text = "label\(0)"
        label0.backgroundColor = UIColor.random
        rootView.addSubview(label0)
        
        let label1 = UILabel()
        label1.height = .fill
        label1.margin = 5
        label1.weight = 1
        label1.textAlignment = .center
        label1.text = "label\(1)"
        label1.backgroundColor = UIColor.random
        rootView.addSubview(label1)
        
        let label2 = UILabel()
        label2.width = .px(50)
        label2.margin = 5
        label2.text = "label\(2)"
        label2.height = .px(50)
        label2.textAlignment = .center
        label2.backgroundColor = UIColor.random
        rootView.addSubview(label2)
        
        let label3 = UILabel()
        label3.width = .px(50)
        label3.margin = 5
        label3.text = "label\(3)"
        label3.gravity = .center
        label3.height = .px(50)
        label3.textAlignment = .center
        label3.backgroundColor = UIColor.random
        rootView.addSubview(label3)
        
        let label4 = UILabel()
        label4.width = .px(50)
        label4.margin = 5
        label4.text = "label\(4)"
        label4.height = .px(50)
        label4.gravity = .bottom
        label4.textAlignment = .center
        label4.backgroundColor = UIColor.random
        rootView.addSubview(label4)
    }
}
