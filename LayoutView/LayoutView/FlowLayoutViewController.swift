
import UIKit

class FlowLayoutViewController: UIViewController {

    let items = ["上下布局", "左右布局"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FlowLayoutView"
        
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "layout")
    }
}

extension FlowLayoutViewController:UITableViewDataSource,UITableViewDelegate{
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
            let vc = FlowViewTest1Controller()
            vc.title = items[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = FlowViewTest2Controller()
            vc.title = items[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}
