
import UIKit

class RelativeViewTest3Controller: UIViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = UIColor.white
        parpareView()
    }
}

extension RelativeViewTest3Controller {
    
    private func parpareView() {
        let rootView = RelativeLayoutView(width: .fill, height: .fill)
        rootView.backgroundColor = UIColor.random
        rootView.lv.margin = 10
        view.addSubview(rootView)
        
        let label = UILabel()
        label.lv.height = .px(200)
        label.lv.width = .px(200)
        label.textAlignment = .center
        label.lv.gravity = .center
        label.text = "label"
        label.backgroundColor = UIColor.random
        rootView.addSubview(label)
        
        let label1 = UILabel()
        label1.lv.height = .px(50)
        label1.lv.width = .px(50)
        label1.textAlignment = .center
        label1.lv.alignTop = label
        label1.text = "label1"
        label1.backgroundColor = UIColor.random
        rootView.addSubview(label1)
        
        let label2 = UILabel()
        label2.lv.height = .px(50)
        label2.lv.width = .px(50)
        label2.textAlignment = .center
        label2.lv.alignLeft = label
        label2.text = "label2"
        label2.backgroundColor = UIColor.random
        rootView.addSubview(label2)

        let label3 = UILabel()
        label3.lv.height = .px(50)
        label3.lv.width = .px(50)
        label3.lv.alignBottom = label
        label3.textAlignment = .center
        label3.text = "label3"
        label3.backgroundColor = UIColor.random
        rootView.addSubview(label3)

        let label4 = UILabel()
        label4.lv.height = .px(50)
        label4.lv.width = .px(50)
        label4.textAlignment = .center
        label4.lv.alignRight = label
        label4.text = "label4"
        label4.backgroundColor = UIColor.random
        rootView.addSubview(label4)
    }
    
}
