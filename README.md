# LayoutView
## 快速、简单、方便的UI布局框架

### LinearLayoutView 使用

```swift
let rootView = LinearLayoutView(direction: .vertical, width: .fill, height: .fill)
rootView.backgroundColor = UIColor.gray
rootView.margin = 10
view.addSubview(rootView)

let label0 = UILabel()
label0.width = .fill
label0.margin = 5
label0.weight = 1
label0.textAlignment = .center
label0.text = "label\(0)"
label0.backgroundColor = UIColor.random
rootView.addSubview(label0)

let label1 = UILabel()
label1.width = .fill
label1.margin = 5
label1.weight = 1
label1.textAlignment = .center
label1.text = "label\(1)"
label1.backgroundColor = UIColor.random
rootView.addSubview(label1)

let label2 = UILabel()
label2.width = .px(100)
label2.margin = 5
label2.text = "label\(2)"
label2.height = .px(100)
label2.textAlignment = .center
label2.backgroundColor = UIColor.random
rootView.addSubview(label2)

let label3 = UILabel()
label3.width = .px(100)
label3.margin = 5
label3.text = "label\(3)"
label3.gravity = .center
label3.height = .px(100)
label3.textAlignment = .center
label3.backgroundColor = UIColor.random
rootView.addSubview(label3)

let label4 = UILabel()
label4.width = .px(100)
label4.margin = 5
label4.text = "label\(4)"
label4.height = .px(100)
label4.gravity = .right
label4.textAlignment = .center
label4.backgroundColor = UIColor.random
rootView.addSubview(label4)
```
<img src="https://ws3.sinaimg.cn/large/006tKfTcgy1g0acm5bdljj30n01dsdiu.jpg" width="30%" height="50%"/>

```swift
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
```
<img src="https://ws2.sinaimg.cn/large/006tKfTcgy1g0acmpwzx5j30n01ds41w.jpg" width="30%" height="50%"/>

```swift
let rootView = LinearLayoutView(direction: .vertical, width: .fill, height: .fill)
rootView.backgroundColor = UIColor.gray
rootView.margin = 10
view.addSubview(rootView)

let linearView1 = LinearLayoutView(direction: .horizontal, width: .fill, height: .fill)
linearView1.backgroundColor = UIColor.random
linearView1.weight = 1
linearView1.margin = 10
rootView.addSubview(linearView1)

for i in 0..<3{
    let label = UILabel()
    label.height = .fill
    label.margin = 5
    label.weight = 1
    label.text = "label\(i)"
    label.textAlignment = .center
    label.backgroundColor = UIColor.random
    linearView1.addSubview(label)
}

let linearView2 = LinearLayoutView(direction: .vertical,  width: .fill, height: .fill)
linearView2.backgroundColor = UIColor.random
linearView2.margin = 10
linearView2.weight = 1
rootView.addSubview(linearView2)

for i in 0..<3{
    let label = UILabel()
    label.width = .fill
    label.margin = 5
    label.weight = 1
    label.text = "label\(i)"
    label.textAlignment = .center
    label.backgroundColor = UIColor.random
    linearView2.addSubview(label)
}
```
<img src="https://ws4.sinaimg.cn/large/006tKfTcgy1g0acsoiruwj30n01dsgpj.jpg" width="30%" height="50%"/>
