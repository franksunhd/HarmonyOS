@Entry
@Component
struct StackPage {
	@State listNum: number[] = [1, 2, 3, 4];

	// 头部导航自定义组件
	@Builder headerNav() {
		Text("HarmonyOS").fontSize(30)
			.size({
				width: "100%",
				height: 50
			})
			.lineHeight(50)
			.textAlign(TextAlign.Center)
			.backgroundColor(Color.Orange)
	}

	// 列表自定义组件
	@Builder contentList() {
		Column() {
			List({ space: 10 }) {
				ForEach(this.listNum, (item) => {
					ListItem() {
						Text(`${item}`)
							.width("100%")
							.fontSize(25)
							.height(40)
							.lineHeight(40)
							.fontColor("#333")
							.textAlign(TextAlign.Center)
							.backgroundColor("#eee")
							.borderRadius(10)
					}
				}, item => item)
			}
		}.height("100%")
	}

	// 按钮自定义组件
	@Builder btnList() {
		Button("+").fontSize(40).size({
			width: 80,
			height: 80
		}).margin({ right: 10, bottom: 10 }).onClick(() => {
			this.doAdd();
		})

		Button("-").fontSize(40).size({
			width: 80,
			height: 80
		}).margin({ right: 100, bottom: 10 }).onClick(() => {
			this.doDel();
		})
	}

	// 盒子堆叠自定义组件
	@Builder boxStruck() {
		Stack({ alignContent: Alignment.TopEnd }) {
			Row() {
			}.size({ width: 300, height: 300 }).backgroundColor(Color.Blue)

			Row() {
			}.size({ width: 200, height: 200 }).backgroundColor(Color.Green)

			Row() {
			}.size({ width: 100, height: 100 }).backgroundColor(Color.Red)
		}.margin({ top: 60 })
	}

	build() {
		// build 中不能包含多个组件
		Column({ space: 20 }) {
			// Stack：实现组件的堆叠
			Stack({ alignContent: Alignment.Top }) {
				// 导航
				this.headerNav();
				// 盒子堆叠
				this.boxStruck();
			}
			// 定位列表
			Column() {
				Stack({ alignContent: Alignment.BottomEnd }) {
					// 列表
					this.contentList();
					// 按钮
					this.btnList();
				}
			}.layoutWeight(1).width("100%")
		}.size({ width: "100%", height: "100%" }).alignItems(HorizontalAlign.Start)
	}

	// 获取数组最后一个元素+1并push
	doAdd() {
		let num = this.listNum.length !== 0 ? this.listNum[this.listNum.length - 1] : 0
		this.listNum.push(num + 1);
	}

	// 删除数组最后一个元素
	doDel() {
		if (this.listNum.length !== 0) {
			this.listNum.splice(-1);
		}
	}
}