
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
        rootView.margin = 10
        view.addSubview(rootView)

        let label = UILabel()
        label.height = .px(220)
        label.width = .px(220)
        label.margin = 10
        label.gravity = .center
        label.text = "label"
        label.textAlignment = .center
        label.backgroundColor = UIColor.random
        rootView.addSubview(label)
        
        let label1 = UILabel()
        label1.height = .px(70)
        label1.width = .px(70)
        label1.toTopOf = label
        label1.alignLeft = label
        label1.text = "label1"
        label1.textAlignment = .center
        label1.backgroundColor = UIColor.random
        rootView.addSubview(label1)

        let label2 = UILabel()
        label2.height = .px(70)
        label2.width = .px(70)
        label2.toTopOf = label
        label2.alignRight = label
        label2.text = "label2"
        label2.textAlignment = .center
        label2.backgroundColor = UIColor.random
        rootView.addSubview(label2)

        let label3 = UILabel()
        label3.height = .px(70)
        label3.width = .px(70)
        label3.toBottomOf = label
        label3.alignLeft = label
        label3.text = "label3"
        label3.textAlignment = .center
        label3.backgroundColor = UIColor.random
        rootView.addSubview(label3)
        
        let label4 = UILabel()
        label4.height = .px(70)
        label4.width = .px(70)
        label4.toBottomOf = label
        label4.alignRight = label
        label4.text = "label4"
        label4.textAlignment = .center
        label4.backgroundColor = UIColor.random
        rootView.addSubview(label4)
        
        let label5 = UILabel()
        label5.height = .px(70)
        label5.width = .px(70)
        label5.margin = 10
        label5.alignLeft = label
        label5.alignTop = label
        label5.text = "label5"
        label5.textAlignment = .center
        label5.backgroundColor = UIColor.random
        rootView.addSubview(label5)
        
        let label6 = UILabel()
        label6.height = .px(70)
        label6.width = .px(70)
        label6.margin = 10
        label6.alignRight = label
        label6.alignTop = label
        label6.text = "label6"
        label6.textAlignment = .center
        label6.backgroundColor = UIColor.random
        rootView.addSubview(label6)
        
        let label7 = UILabel()
        label7.height = .px(70)
        label7.width = .px(70)
        label7.margin = 10
        label7.alignLeft = label
        label7.alignBottom = label
        label7.text = "label7"
        label7.textAlignment = .center
        label7.backgroundColor = UIColor.random
        rootView.addSubview(label7)
        
        let label8 = UILabel()
        label8.height = .px(70)
        label8.width = .px(70)
        label8.margin = 10
        label8.alignRight = label
        label8.alignBottom = label
        label8.text = "label8"
        label8.textAlignment = .center
        label8.backgroundColor = UIColor.random
        rootView.addSubview(label8)
    }
    
}
