
import UIKit

class RelativeViewTest6Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = UIColor.white

        let rootView = RelativeLayoutView(width: .fill, height: .fill)
        rootView.backgroundColor = UIColor.random
        rootView.lv.margin = 10
        view.addSubview(rootView)
        
        let linearView1 = LinearLayoutView(direction: .horizontal, width: .fill, height: .wrap)
        linearView1.backgroundColor = UIColor.random
        linearView1.lv.margin = 10
        linearView1.lv.gravity = .center
        rootView.addSubview(linearView1)
        
        for i in 0..<3{
            let label = UILabel()
            label.lv.height = .pt(300)
            label.lv.width = .fill
            label.lv.weight = 1
            label.lv.margin = 10
            label.text = "label\(i)"
            label.textAlignment = .center
            label.backgroundColor = UIColor.random
            linearView1.addSubview(label)
        }
    }
}
