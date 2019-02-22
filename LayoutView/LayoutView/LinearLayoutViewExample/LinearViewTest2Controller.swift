
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
        rootView.lv.margin = 10
        view.addSubview(rootView)
        
        let label0 = UILabel()
        label0.lv.height = .fill
        label0.lv.margin = 5
        label0.lv.weight = 1
        label0.textAlignment = .center
        label0.text = "label\(0)"
        label0.backgroundColor = UIColor.random
        rootView.addSubview(label0)
        
        let label1 = UILabel()
        label1.lv.height = .fill
        label1.lv.margin = 5
        label1.lv.weight = 1
        label1.textAlignment = .center
        label1.text = "label\(1)"
        label1.backgroundColor = UIColor.random
        rootView.addSubview(label1)
        
        let label2 = UILabel()
        label2.lv.width = .px(50)
        label2.lv.margin = 5
        label2.text = "label\(2)"
        label2.lv.height = .px(50)
        label2.textAlignment = .center
        label2.backgroundColor = UIColor.random
        rootView.addSubview(label2)
        
        let label3 = UILabel()
        label3.lv.width = .px(50)
        label3.lv.margin = 5
        label3.text = "label\(3)"
        label3.lv.gravity = .center
        label3.lv.height = .px(50)
        label3.textAlignment = .center
        label3.backgroundColor = UIColor.random
        rootView.addSubview(label3)
        
        let label4 = UILabel()
        label4.lv.width = .px(50)
        label4.lv.margin = 5
        label4.text = "label\(4)"
        label4.lv.height = .px(50)
        label4.lv.gravity = .bottom
        label4.textAlignment = .center
        label4.backgroundColor = UIColor.random
        rootView.addSubview(label4)
    }
}
