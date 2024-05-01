@Entry
@Component
struct WatchPage {
	@State res: number = 1;
	@State @Watch("changeVal") count: number = 1;
	@State @Watch("changeVal") pow: number = 2;

	// watch监听的函数
	changeVal() {
		this.res = Math.pow(this.count, this.pow);
	}

	build() {
		Column({ space: 20 }) {
			Row() {
				Text("基数：")
					.fontSize(20)
					.fontWeight(FontWeight.Bold)
				TextInput({
					placeholder: "请输入数字",
					text: this.count.toString()
				})
					.type(InputType.PhoneNumber)
					.borderRadius(0)
					.layoutWeight(1)
					.onChange((value) => {
						if (!value) {
							this.count = 0;
						} else {
							this.count = parseInt(value);
						}
					})
			}

			Row() {
				Text("幂值：")
					.fontSize(20)
					.fontWeight(FontWeight.Bold)
				TextInput({
					placeholder: "请输入数字",
					text: this.pow.toString()
				})
					.type(InputType.PhoneNumber)
					.borderRadius(0)
					.layoutWeight(1)
					.onChange((value) => {
						if (!value) {
							this.pow = 0;
						} else {
							this.pow = parseInt(value);
						}
					})
			}

			Row() {
				Text("结果为：" + this.res)
					.fontSize(20)
					.fontWeight(FontWeight.Bold)
			}.width("100%")
			.justifyContent(FlexAlign.Center)

		}
		.width('100%')
		.height('100%')
		.padding(20)
	}
}