# LayoutView(仿Android布局)
## 快速、简单、方便的UI布局框架
## 简书：https://www.jianshu.com/p/bc22145f4eaf
## oc版本：https://github.com/QiaokeZ/iOS_OC_LayoutView


### LinearLayoutView 使用

```swift
<!--上下布局-->
let rootView = LinearLayoutView(direction: .vertical, width: .fill, height: .fill)
rootView.backgroundColor = UIColor.gray
rootView.lv.margin = 10
view.addSubview(rootView)

let label0 = UILabel()
label0.lv.width = .fill
label0.lv.margin = 5
label0.lv.weight = 1
label0.textAlignment = .center
label0.text = "label\(0)"
label0.backgroundColor = UIColor.random
rootView.addSubview(label0)

let label1 = UILabel()
label1.lv.width = .fill
label1.lv.margin = 5
label1.lv.weight = 1
label1.textAlignment = .center
label1.text = "label\(1)"
label1.backgroundColor = UIColor.random
rootView.addSubview(label1)

let label2 = UILabel()
label2.lv.width = .pt(100)
label2.lv.margin = 5
label2.text = "label\(2)"
label2.lv.height = .pt(100)
label2.textAlignment = .center
label2.backgroundColor = UIColor.random
rootView.addSubview(label2)

let label3 = UILabel()
label3.lv.width = .pt(100)
label3.lv.margin = 5
label3.text = "label\(3)"
label3.lv.gravity = .center
label3.lv.height = .pt(100)
label3.textAlignment = .center
label3.backgroundColor = UIColor.random
rootView.addSubview(label3)

let label4 = UILabel()
label4.lv.width = .pt(100)
label4.lv.margin = 5
label4.text = "label\(4)"
label4.lv.height = .pt(100)
label4.lv.gravity = .right
label4.textAlignment = .center
label4.backgroundColor = UIColor.random
rootView.addSubview(label4)

```
<img src="https://ws3.sinaimg.cn/large/006tKfTcgy1g0acm5bdljj30n01dsdiu.jpg" width="30%" height="50%"/>

```swift
<!--左右布局-->
let rootView = LinearLayoutView(direction: .horizontal, width: .fill, height: .fill)
rootView.backgroundColor = UIColor.gray
rootView.lv.margin = 10
view.addSubview(rootView)

let label0 = UILabel()
label0.lv.height = .fill
label0.lv.margin = 5
label0.lv.weight = 1
label0.textAlignment = .center
label0.text = "label\(0)"
label0.backgroundColor = UIColor.random
rootView.addSubview(label0)

let label1 = UILabel()
label1.lv.height = .fill
label1.lv.margin = 5
label1.lv.weight = 1
label1.textAlignment = .center
label1.text = "label\(1)"
label1.backgroundColor = UIColor.random
rootView.addSubview(label1)

let label2 = UILabel()
label2.lv.width = .pt(50)
label2.lv.margin = 5
label2.text = "label\(2)"
label2.lv.height = .pt(50)
label2.textAlignment = .center
label2.backgroundColor = UIColor.random
rootView.addSubview(label2)

let label3 = UILabel()
label3.lv.width = .pt(50)
label3.lv.margin = 5
label3.text = "label\(3)"
label3.lv.gravity = .center
label3.lv.height = .pt(50)
label3.textAlignment = .center
label3.backgroundColor = UIColor.random
rootView.addSubview(label3)

let label4 = UILabel()
label4.lv.width = .pt(50)
label4.lv.margin = 5
label4.text = "label\(4)"
label4.lv.height = .pt(50)
label4.lv.gravity = .bottom
label4.textAlignment = .center
label4.backgroundColor = UIColor.random
rootView.addSubview(label4)
```
<img src="https://ws2.sinaimg.cn/large/006tKfTcgy1g0acmpwzx5j30n01ds41w.jpg" width="30%" height="50%"/>

```swift
<!--混合布局-->
let rootView = LinearLayoutView(direction: .vertical, width: .fill, height: .fill)
rootView.backgroundColor = UIColor.gray
rootView.lv.margin = 5
view.addSubview(rootView)

let linearView1 = LinearLayoutView(direction: .horizontal, width: .fill, height: .fill)
linearView1.backgroundColor = UIColor.random
linearView1.lv.weight = 1
linearView1.lv.margin = 5
rootView.addSubview(linearView1)

for i in 0..<3{
    let label = UILabel()
    label.lv.height = .fill
    label.lv.margin = 5
    label.lv.weight = 1
    label.text = "label\(i)"
    label.textAlignment = .center
    label.backgroundColor = UIColor.random
    linearView1.addSubview(label)
}

let linearView2 = LinearLayoutView(direction: .vertical,  width: .fill, height: .fill)
linearView2.backgroundColor = UIColor.random
linearView2.lv.margin = 5
linearView2.lv.weight = 1
rootView.addSubview(linearView2)

for i in 0..<3{
    let label = UILabel()
    label.lv.width = .fill
    label.lv.margin = 5
    label.lv.weight = 1
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
rootView.lv.marginTop = 10
rootView.lv.marginLeft = 5
rootView.lv.marginBottom = 10
rootView.lv.marginRight = 5
view.addSubview(rootView)

let linearView2 = LinearLayoutView(direction: .vertical, width: .fill, height: .fill)
linearView2.backgroundColor = UIColor.random
linearView2.lv.weight = 1
linearView2.lv.margin = 5
rootView.addSubview(linearView2)

let linearView3 = LinearLayoutView(direction: .horizontal, width: .fill, height: .fill)
linearView3.backgroundColor = UIColor.random
linearView3.lv.weight = 1
linearView3.lv.margin = 5
linearView2.addSubview(linearView3)

let linearView4 = LinearLayoutView(direction: .horizontal, width: .fill, height: .fill)
linearView4.backgroundColor = UIColor.random
linearView4.lv.weight = 2
linearView4.lv.margin = 5
linearView3.addSubview(linearView4)

for i in 0..<3{
    let label = UILabel()
    label.lv.height = .fill
    label.lv.margin = 5
    label.lv.weight = 1
    label.text = "label\(i)"
    label.textAlignment = .center
    label.backgroundColor = UIColor.random
    linearView4.addSubview(label)
}

let linearView5 = LinearLayoutView(direction: .vertical, width: .fill, height: .fill)
linearView5.backgroundColor = UIColor.random
linearView5.lv.weight = 1
linearView5.lv.margin = 5
linearView3.addSubview(linearView5)

for i in 0..<3{
    let label = UILabel()
    label.lv.width = .fill
    label.lv.margin = 5
    label.lv.weight = 1
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
rootView.lv.margin = 10
view.addSubview(rootView)

let label1 = UILabel()
label1.lv.height = .pt(100)
label1.lv.width = .pt(100)
label1.lv.margin = 10
label1.textAlignment = .center
label1.lv.gravity = .centerVertical
label1.text = "label1"
label1.backgroundColor = UIColor.random
rootView.addSubview(label1)

let label2 = UILabel()
label2.lv.height = .pt(100)
label2.lv.width = .pt(100)
label2.lv.margin = 10
label2.textAlignment = .center
label2.lv.gravity = .centerHorizontal
label2.text = "label2"
label2.backgroundColor = UIColor.random
rootView.addSubview(label2)

let label3 = UILabel()
label3.lv.height = .pt(100)
label3.lv.width = .pt(100)
label3.lv.margin = 10
label3.textAlignment = .center
label3.lv.alignParent = [.right]
label3.lv.gravity = .centerVertical
label3.text = "label3"
label3.backgroundColor = UIColor.random
rootView.addSubview(label3)

let label4 = UILabel()
label4.lv.height = .pt(100)
label4.lv.width = .pt(100)
label4.lv.margin = 10
label4.textAlignment = .center
label4.lv.alignParent = [.bottom]
label4.lv.gravity = .centerHorizontal
label4.text = "label4"
label4.backgroundColor = UIColor.random
rootView.addSubview(label4)
```
<img src="https://ws4.sinaimg.cn/large/006tKfTcgy1g0ak1wl34dj30n01dswhb.jpg" width="30%" height="50%"/>

```swift
let rootView = RelativeLayoutView(width: .fill, height: .fill)
rootView.backgroundColor = UIColor.random
rootView.lv.margin = 10
view.addSubview(rootView)

let label = UILabel()
label.lv.height = .pt(100)
label.lv.width = .pt(100)
label.lv.margin = 10
label.textAlignment = .center
label.lv.gravity = .center
label.text = "label"
label.backgroundColor = UIColor.random
rootView.addSubview(label)

let label1 = UILabel()
label1.lv.height = .pt(100)
label1.lv.width = .pt(100)
label1.lv.margin = 10
label1.textAlignment = .center
label1.lv.toTopOf = label
label1.text = "label1"
label1.backgroundColor = UIColor.random
rootView.addSubview(label1)

let label2 = UILabel()
label2.lv.height = .pt(100)
label2.lv.width = .pt(100)
label2.lv.margin = 10
label2.textAlignment = .center
label2.lv.toLeftOf = label
label2.text = "label2"
label2.backgroundColor = UIColor.random
rootView.addSubview(label2)

let label3 = UILabel()
label3.lv.height = .pt(100)
label3.lv.width = .pt(100)
label3.lv.margin = 10
label3.textAlignment = .center
label3.lv.toBottomOf = label
label3.text = "label3"
label3.backgroundColor = UIColor.random
rootView.addSubview(label3)

let label4 = UILabel()
label4.lv.height = .pt(100)
label4.lv.width = .pt(100)
label4.lv.margin = 10
label4.textAlignment = .center
label4.lv.toRightOf = label
label4.text = "label4"
label4.backgroundColor = UIColor.random
rootView.addSubview(label4)
```
<img src="https://ws3.sinaimg.cn/large/006tKfTcgy1g0ak5uvz7wj30n01dsjud.jpg" width="30%" height="50%"/>

```swift
let rootView = RelativeLayoutView(width: .fill, height: .fill)
rootView.backgroundColor = UIColor.random
rootView.lv.margin = 10
view.addSubview(rootView)

let label = UILabel()
label.lv.height = .pt(200)
label.lv.width = .pt(200)
label.textAlignment = .center
label.lv.gravity = .center
label.text = "label"
label.backgroundColor = UIColor.random
rootView.addSubview(label)

let label1 = UILabel()
label1.lv.height = .pt(50)
label1.lv.width = .pt(50)
label1.textAlignment = .center
label1.lv.alignTop = label
label1.text = "label1"
label1.backgroundColor = UIColor.random
rootView.addSubview(label1)

let label2 = UILabel()
label2.lv.height = .pt(50)
label2.lv.width = .pt(50)
label2.textAlignment = .center
label2.lv.alignLeft = label
label2.text = "label2"
label2.backgroundColor = UIColor.random
rootView.addSubview(label2)

let label3 = UILabel()
label3.lv.height = .pt(50)
label3.lv.width = .pt(50)
label3.lv.alignBottom = label
label3.textAlignment = .center
label3.text = "label3"
label3.backgroundColor = UIColor.random
rootView.addSubview(label3)

let label4 = UILabel()
label4.lv.height = .pt(50)
label4.lv.width = .pt(50)
label4.textAlignment = .center
label4.lv.alignRight = label
label4.text = "label4"
label4.backgroundColor = UIColor.random
rootView.addSubview(label4)
```
<img src="https://ws3.sinaimg.cn/large/006tKfTcgy1g0akefmawdj30n01dsdiu.jpg" width="30%" height="50%"/>

```swift
let rootView = RelativeLayoutView(width: .fill, height: .fill)
rootView.backgroundColor = UIColor.random
rootView.lv.margin = 10
view.addSubview(rootView)

let label = UILabel()
label.lv.height = .pt(100)
label.lv.width = .pt(100)
label.lv.margin = 10
label.lv.alignParent = [.top, .left]
label.text = "label"
label.textAlignment = .center
label.backgroundColor = UIColor.random
rootView.addSubview(label)

let label1 = UILabel()
label1.lv.height = .pt(100)
label1.lv.width = .pt(100)
label1.lv.margin = 10
label1.lv.alignParent = [.top, .right]
label1.text = "label1"
label1.textAlignment = .center
label1.backgroundColor = UIColor.random
rootView.addSubview(label1)

let label2 = UILabel()
label2.lv.height = .pt(100)
label2.lv.width = .pt(100)
label2.lv.margin = 10
label2.lv.alignParent = [.bottom, .left]
label2.text = "label2"
label2.textAlignment = .center
label2.backgroundColor = UIColor.random
rootView.addSubview(label2)

let label3 = UILabel()
label3.lv.height = .pt(100)
label3.lv.width = .pt(100)
label3.lv.margin = 10
label3.lv.alignParent = [.bottom, .right]
label3.text = "label3"
label3.textAlignment = .center
label3.backgroundColor = UIColor.random
rootView.addSubview(label3)
```
<img src="https://ws3.sinaimg.cn/large/006tKfTcgy1g0akhjueg7j30n01dswh8.jpg" width="30%" height="50%"/>

```swift
let rootView = RelativeLayoutView(width: .fill, height: .fill)
rootView.backgroundColor = UIColor.random
rootView.lv.margin = 10
view.addSubview(rootView)

let label = UILabel()
label.lv.height = .pt(220)
label.lv.width = .pt(220)
label.lv.margin = 10
label.lv.gravity = .center
label.text = "label"
label.textAlignment = .center
label.backgroundColor = UIColor.random
rootView.addSubview(label)

let label1 = UILabel()
label1.lv.height = .pt(70)
label1.lv.width = .pt(70)
label1.lv.toTopOf = label
label1.lv.alignLeft = label
label1.text = "label1"
label1.textAlignment = .center
label1.backgroundColor = UIColor.random
rootView.addSubview(label1)

let label2 = UILabel()
label2.lv.height = .pt(70)
label2.lv.width = .pt(70)
label2.lv.toTopOf = label
label2.lv.alignRight = label
label2.text = "label2"
label2.textAlignment = .center
label2.backgroundColor = UIColor.random
rootView.addSubview(label2)

let label3 = UILabel()
label3.lv.height = .pt(70)
label3.lv.width = .pt(70)
label3.lv.toBottomOf = label
label3.lv.alignLeft = label
label3.text = "label3"
label3.textAlignment = .center
label3.backgroundColor = UIColor.random
rootView.addSubview(label3)

let label4 = UILabel()
label4.lv.height = .pt(70)
label4.lv.width = .pt(70)
label4.lv.toBottomOf = label
label4.lv.alignRight = label
label4.text = "label4"
label4.textAlignment = .center
label4.backgroundColor = UIColor.random
rootView.addSubview(label4)

let label5 = UILabel()
label5.lv.height = .pt(70)
label5.lv.width = .pt(70)
label5.lv.margin = 10
label5.lv.alignLeft = label
label5.lv.alignTop = label
label5.text = "label5"
label5.textAlignment = .center
label5.backgroundColor = UIColor.random
rootView.addSubview(label5)

let label6 = UILabel()
label6.lv.height = .pt(70)
label6.lv.width = .pt(70)
label6.lv.margin = 10
label6.lv.alignRight = label
label6.lv.alignTop = label
label6.text = "label6"
label6.textAlignment = .center
label6.backgroundColor = UIColor.random
rootView.addSubview(label6)

let label7 = UILabel()
label7.lv.height = .pt(70)
label7.lv.width = .pt(70)
label7.lv.margin = 10
label7.lv.alignLeft = label
label7.lv.alignBottom = label
label7.text = "label7"
label7.textAlignment = .center
label7.backgroundColor = UIColor.random
rootView.addSubview(label7)

let label8 = UILabel()
label8.lv.height = .pt(70)
label8.lv.width = .pt(70)
label8.lv.margin = 10
label8.lv.alignRight = label
label8.lv.alignBottom = label
label8.text = "label8"
label8.textAlignment = .center
label8.backgroundColor = UIColor.random
rootView.addSubview(label8)
```
<img src="https://ws3.sinaimg.cn/large/006tKfTcgy1g0akl1r3s6j30n01dsn0o.jpg" width="30%" height="50%"/>
