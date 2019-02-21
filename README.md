# LayoutView
## 快速、简单、方便的UI布局框架

### LinearLayoutView 使用

```swift
<!--上下布局-->
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
<!--左右布局-->
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
<!--混合布局-->
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

```swift
<!--多层嵌套布局-->
let rootView = LinearLayoutView(direction: .vertical, gravity: .center, width: .fill, height: .fill)
rootView.backgroundColor = UIColor.gray
rootView.marginTop = 10
rootView.marginLeft = 5
rootView.marginBottom = 10
rootView.marginRight = 5
view.addSubview(rootView)

let linearView2 = LinearLayoutView(direction: .vertical, width: .fill, height: .fill)
linearView2.backgroundColor = UIColor.random
linearView2.weight = 1
linearView2.margin = 5
rootView.addSubview(linearView2)

let linearView3 = LinearLayoutView(direction: .horizontal, width: .fill, height: .fill)
linearView3.backgroundColor = UIColor.random
linearView3.weight = 1
linearView3.margin = 5
linearView2.addSubview(linearView3)

let linearView4 = LinearLayoutView(direction: .horizontal, width: .fill, height: .fill)
linearView4.backgroundColor = UIColor.random
linearView4.weight = 2
linearView4.margin = 5
linearView3.addSubview(linearView4)

for i in 0..<3{
    let label = UILabel()
    label.height = .fill
    label.margin = 5
    label.weight = 1
    label.text = "label\(i)"
    label.textAlignment = .center
    label.backgroundColor = UIColor.random
    linearView4.addSubview(label)
}

let linearView5 = LinearLayoutView(direction: .vertical, width: .fill, height: .fill)
linearView5.backgroundColor = UIColor.random
linearView5.weight = 1
linearView5.margin = 5
linearView3.addSubview(linearView5)

for i in 0..<3{
    let label = UILabel()
    label.width = .fill
    label.margin = 5
    label.weight = 1
    label.text = "label\(i)"
    label.textAlignment = .center
    label.backgroundColor = UIColor.random
    linearView5.addSubview(label)
}
```
<img src="https://ws4.sinaimg.cn/large/006tKfTcgy1g0e35xr46wj30n01ds424.jpg" width="30%" height="50%"/>


### RelativeLayoutView 使用
```swift
let rootView = RelativeLayoutView(width: .fill, height: .fill)
rootView.backgroundColor = UIColor.random
rootView.margin = 10
view.addSubview(rootView)

let label1 = UILabel()
label1.height = .px(100)
label1.width = .px(100)
label1.margin = 10
label1.textAlignment = .center
label1.gravity = .centerVertical
label1.text = "label1"
label1.backgroundColor = UIColor.random
rootView.addSubview(label1)

let label2 = UILabel()
label2.height = .px(100)
label2.width = .px(100)
label2.margin = 10
label2.textAlignment = .center
label2.gravity = .centerHorizontal
label2.text = "label2"
label2.backgroundColor = UIColor.random
rootView.addSubview(label2)

let label3 = UILabel()
label3.height = .px(100)
label3.width = .px(100)
label3.margin = 10
label3.textAlignment = .center
label3.alignParent = [.right]
label3.gravity = .centerVertical
label3.text = "label3"
label3.backgroundColor = UIColor.random
rootView.addSubview(label3)

let label4 = UILabel()
label4.height = .px(100)
label4.width = .px(100)
label4.margin = 10
label4.textAlignment = .center
label4.alignParent = [.bottom]
label4.gravity = .centerHorizontal
label4.text = "label4"
label4.backgroundColor = UIColor.random
rootView.addSubview(label4)
```
<img src="https://ws4.sinaimg.cn/large/006tKfTcgy1g0ak1wl34dj30n01dswhb.jpg" width="30%" height="50%"/>

```swift
let rootView = RelativeLayoutView(width: .fill, height: .fill)
rootView.backgroundColor = UIColor.random
rootView.margin = 10
view.addSubview(rootView)

let label = UILabel()
label.height = .px(100)
label.width = .px(100)
label.margin = 10
label.textAlignment = .center
label.gravity = .center
label.text = "label"
label.backgroundColor = UIColor.random
rootView.addSubview(label)

let label1 = UILabel()
label1.height = .px(100)
label1.width = .px(100)
label1.margin = 10
label1.textAlignment = .center
label1.toTopOf = label
label1.text = "label1"
label1.backgroundColor = UIColor.random
rootView.addSubview(label1)

let label2 = UILabel()
label2.height = .px(100)
label2.width = .px(100)
label2.margin = 10
label2.textAlignment = .center
label2.toLeftOf = label
label2.text = "label2"
label2.backgroundColor = UIColor.random
rootView.addSubview(label2)

let label3 = UILabel()
label3.height = .px(100)
label3.width = .px(100)
label3.margin = 10
label3.textAlignment = .center
label3.toBottomOf = label
label3.text = "label3"
label3.backgroundColor = UIColor.random
rootView.addSubview(label3)

let label4 = UILabel()
label4.height = .px(100)
label4.width = .px(100)
label4.margin = 10
label4.textAlignment = .center
label4.toRightOf = label
label4.text = "label4"
label4.backgroundColor = UIColor.random
rootView.addSubview(label4)
```
<img src="https://ws3.sinaimg.cn/large/006tKfTcgy1g0ak5uvz7wj30n01dsjud.jpg" width="30%" height="50%"/>

```swift
let rootView = RelativeLayoutView(width: .fill, height: .fill)
rootView.backgroundColor = UIColor.random
rootView.margin = 10
view.addSubview(rootView)

let label = UILabel()
label.height = .px(200)
label.width = .px(200)
label.textAlignment = .center
label.gravity = .center
label.text = "label"
label.backgroundColor = UIColor.random
rootView.addSubview(label)

let label1 = UILabel()
label1.height = .px(50)
label1.width = .px(50)
label1.textAlignment = .center
label1.alignTop = label
label1.text = "label1"
label1.backgroundColor = UIColor.random
rootView.addSubview(label1)

let label2 = UILabel()
label2.height = .px(50)
label2.width = .px(50)
label2.textAlignment = .center
label2.alignLeft = label
label2.text = "label2"
label2.backgroundColor = UIColor.random
rootView.addSubview(label2)

let label3 = UILabel()
label3.height = .px(50)
label3.width = .px(50)
label3.alignBottom = label
label3.textAlignment = .center
label3.text = "label3"
label3.backgroundColor = UIColor.random
rootView.addSubview(label3)

let label4 = UILabel()
label4.height = .px(50)
label4.width = .px(50)
label4.textAlignment = .center
label4.alignRight = label
label4.text = "label4"
label4.backgroundColor = UIColor.random
rootView.addSubview(label4)
```
<img src="https://ws3.sinaimg.cn/large/006tKfTcgy1g0akefmawdj30n01dsdiu.jpg" width="30%" height="50%"/>

```swift
let rootView = RelativeLayoutView(width: .fill, height: .fill)
rootView.backgroundColor = UIColor.random
rootView.margin = 10
view.addSubview(rootView)

let label = UILabel()
label.height = .px(100)
label.width = .px(100)
label.margin = 10
label.alignParent = [.top, .left]
label.text = "label"
label.textAlignment = .center
label.backgroundColor = UIColor.random
rootView.addSubview(label)

let label1 = UILabel()
label1.height = .px(100)
label1.width = .px(100)
label1.margin = 10
label1.alignParent = [.top, .right]
label1.text = "label1"
label1.textAlignment = .center
label1.backgroundColor = UIColor.random
rootView.addSubview(label1)

let label2 = UILabel()
label2.height = .px(100)
label2.width = .px(100)
label2.margin = 10
label2.alignParent = [.bottom, .left]
label2.text = "label2"
label2.textAlignment = .center
label2.backgroundColor = UIColor.random
rootView.addSubview(label2)

let label3 = UILabel()
label3.height = .px(100)
label3.width = .px(100)
label3.margin = 10
label3.alignParent = [.bottom, .right]
label3.text = "label3"
label3.textAlignment = .center
label3.backgroundColor = UIColor.random
rootView.addSubview(label3)
```
<img src="https://ws3.sinaimg.cn/large/006tKfTcgy1g0akhjueg7j30n01dswh8.jpg" width="30%" height="50%"/>

```swift
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
```
<img src="https://ws3.sinaimg.cn/large/006tKfTcgy1g0akl1r3s6j30n01dsn0o.jpg" width="30%" height="50%"/>