
import UIKit

class RelativeViewTest6Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = UIColor.white
        parpareView()
    }
}

extension RelativeViewTest6Controller {
    
    private func parpareView() {
        let rootView = RelativeLayoutView(width: .fill, height: .fill)
        rootView.backgroundColor = UIColor.random
        rootView.lv.margin = 10
        view.addSubview(rootView)
        
        let linearView1 = LinearLayoutView(direction: .horizontal, width: .fill, height: .wrap)
        linearView1.backgroundColor = UIColor.random
        linearView1.lv.margin = 10
        linearView1.lv.gravity = .center
        rootView.addSubview(linearView1)
        
        for _ in 0..<3{
            let button = UIButton()
            button.lv.height = .px(300)
            button.lv.width = .fill
            button.lv.weight = 1
            button.lv.margin = 10
            button.backgroundColor = UIColor.random
            linearView1.addSubview(button)
        }
    }
}
