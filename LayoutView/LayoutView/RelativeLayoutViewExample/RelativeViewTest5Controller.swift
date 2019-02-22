
import UIKit

class RelativeViewTest5Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = UIColor.white
        parpareView()
    }
}

extension RelativeViewTest5Controller {
    
    private func parpareView() {
        let rootView = RelativeLayoutView(width: .fill, height: .fill)
        rootView.backgroundColor = UIColor.random
        rootView.lv.margin = 10
        view.addSubview(rootView)

        let label = UILabel()
        label.lv.height = .px(220)
        label.lv.width = .px(220)
        label.lv.margin = 10
        label.lv.gravity = .center
        label.text = "label"
        label.textAlignment = .center
        label.backgroundColor = UIColor.random
        rootView.addSubview(label)
        
        let label1 = UILabel()
        label1.lv.height = .px(70)
        label1.lv.width = .px(70)
        label1.lv.toTopOf = label
        label1.lv.alignLeft = label
        label1.text = "label1"
        label1.textAlignment = .center
        label1.backgroundColor = UIColor.random
        rootView.addSubview(label1)

        let label2 = UILabel()
        label2.lv.height = .px(70)
        label2.lv.width = .px(70)
        label2.lv.toTopOf = label
        label2.lv.alignRight = label
        label2.text = "label2"
        label2.textAlignment = .center
        label2.backgroundColor = UIColor.random
        rootView.addSubview(label2)

        let label3 = UILabel()
        label3.lv.height = .px(70)
        label3.lv.width = .px(70)
        label3.lv.toBottomOf = label
        label3.lv.alignLeft = label
        label3.text = "label3"
        label3.textAlignment = .center
        label3.backgroundColor = UIColor.random
        rootView.addSubview(label3)
        
        let label4 = UILabel()
        label4.lv.height = .px(70)
        label4.lv.width = .px(70)
        label4.lv.toBottomOf = label
        label4.lv.alignRight = label
        label4.text = "label4"
        label4.textAlignment = .center
        label4.backgroundColor = UIColor.random
        rootView.addSubview(label4)
        
        let label5 = UILabel()
        label5.lv.height = .px(70)
        label5.lv.width = .px(70)
        label5.lv.margin = 10
        label5.lv.alignLeft = label
        label5.lv.alignTop = label
        label5.text = "label5"
        label5.textAlignment = .center
        label5.backgroundColor = UIColor.random
        rootView.addSubview(label5)
        
        let label6 = UILabel()
        label6.lv.height = .px(70)
        label6.lv.width = .px(70)
        label6.lv.margin = 10
        label6.lv.alignRight = label
        label6.lv.alignTop = label
        label6.text = "label6"
        label6.textAlignment = .center
        label6.backgroundColor = UIColor.random
        rootView.addSubview(label6)
        
        let label7 = UILabel()
        label7.lv.height = .px(70)
        label7.lv.width = .px(70)
        label7.lv.margin = 10
        label7.lv.alignLeft = label
        label7.lv.alignBottom = label
        label7.text = "label7"
        label7.textAlignment = .center
        label7.backgroundColor = UIColor.random
        rootView.addSubview(label7)
        
        let label8 = UILabel()
        label8.lv.height = .px(70)
        label8.lv.width = .px(70)
        label8.lv.margin = 10
        label8.lv.alignRight = label
        label8.lv.alignBottom = label
        label8.text = "label8"
        label8.textAlignment = .center
        label8.backgroundColor = UIColor.random
        rootView.addSubview(label8)
    }
    
}
