interface likeInterFace {
	name: string,
	key: string
}

@Entry
@Component
struct FormPage {
	@State message: string = "";
	@State radio: number = 0;
	@State likeArr: likeInterFace[] = [
		{ name: "吃饭", key: "eat" },
		{ name: "睡觉", key: "sleep" },
		{ name: "运动", key: "run" }
	];
	@State selectBox: string = "sleep"; // 默认选中睡觉

	build() {
		Scroll() {
			Column({ space: 20 }) {
				// 单选按钮
				Row() {
					Text("男").fontSize(20)
					Radio({
						value: "0", // 必填 当前单选框的值
						group: "sex" // 必填 当前单选框所属群组名
					}).checked(true) // 是否默认选中
						.onChange((value) => {
							if (value) {
								this.radio = 0;
							}
						})
					Text("女").fontSize(20).margin({ left: 20 })
					Radio({
						value: "1",
						group: "sex"
					}).onChange((value) => {
						if (value) {
							this.radio = 1;
						}
					})

					Text(`当前选中的是--${this.radio === 0 ? '男' : '女'}`)
				}.width("100%")
				.justifyContent(FlexAlign.Start)


				// 多选按钮
				Row() {
					Text("爱好：").fontSize(20).fontWeight(FontWeight.Bold)

					ForEach(this.likeArr, (item: likeInterFace) => {
						Checkbox({
							name: item.key,
							group: "like"
						}).select(item.key === this.selectBox)
							.selectedColor(Color.Orange)
							.onChange((value: boolean) => {
								console.warn(value.toString())
							})
						Text(item.name).fontSize(16)
					}, (item: likeInterFace) => {
						return item.key;
					});
				}.width("100%")
				.justifyContent(FlexAlign.Start)

				// 多选按钮组
				Column() {
					Row() {
						CheckboxGroup({ group: "likeAll" })
							.selectAll(true) // 是否全选
							.selectedColor(Color.Brown) // 选中颜色
							.onChange((itemName: CheckboxGroupResult) => {
								console.warn(`name=${itemName.name},status=${itemName.status}},json=${JSON.stringify(itemName)}}`);
							})
						Text("全选").fontSize(20).fontWeight(FontWeight.Bold)
					}.width("100%")
					.justifyContent(FlexAlign.Start)

					ForEach(this.likeArr, (item: likeInterFace) => {
						Row() {
							Checkbox({ group: "likeAll", name: item.key })
							Text(item.name).fontSize(18).fontWeight(FontWeight.Bold)
						}.width("100%")
						.padding({ left: 10 })
						.justifyContent(FlexAlign.Start)
					}, (item: likeInterFace) => {
						return item.key;
					})
				}.width("100%")

			}.width('100%')
			.padding(20)
		}.scrollBar(BarState.Off)
	}
}