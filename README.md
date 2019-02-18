# iOS_LayoutView
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
<img src="/Users/admin/Desktop/WechatIMG2.png" width="30%" height="50%"/>

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
<img src="/Users/admin/Desktop/WechatIMG3.png" width="30%" height="50%"/>

