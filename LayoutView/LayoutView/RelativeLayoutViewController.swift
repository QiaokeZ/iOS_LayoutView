

import UIKit

class RelativeLayoutViewController: UIViewController {

    let items = ["gravity", "toOf", "align", "alignParent", "gravity+toOf+align", "addLinearLayoutView"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "RelativeLayoutView"
        
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "layout")
    }

}

extension RelativeLayoutViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "layout", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            let vc = RelativeViewTest1Controller()
            vc.title = items[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = RelativeViewTest2Controller()
            vc.title = items[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = RelativeViewTest3Controller()
            vc.title = items[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = RelativeViewTest4Controller()
            vc.title = items[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = RelativeViewTest5Controller()
            vc.title = items[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        case 5:
            let vc = RelativeViewTest6Controller()
            vc.title = items[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}
