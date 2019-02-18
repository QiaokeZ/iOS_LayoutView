
import UIKit

class LinearLayoutViewController: UIViewController {

    let items = ["vertical", "horizontal", "vertical+horizontal", "addRelativeLayoutView"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "LinearLayoutView"
        
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "layout")
    }
    

}

extension LinearLayoutViewController:UITableViewDataSource,UITableViewDelegate{
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
            let vc = LinearViewTest1Controller()
            vc.title = items[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = LinearViewTest2Controller()
            vc.title = items[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = LinearViewTest3Controller()
            vc.title = items[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = LinearViewTest4Controller()
            vc.title = items[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}
