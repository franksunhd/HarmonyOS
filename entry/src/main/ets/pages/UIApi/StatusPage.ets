@Entry
@Component
struct StatusPage {
	@State count: number = 1;
	@Provide("count") count_1:number = this.count + 0;

	build() {
		Stack({ alignContent: Alignment.BottomEnd }) {
			Column() {
				Text(this.count.toString())
					.fontSize(50)
					.textAlign(TextAlign.Center)
					.fontColor(Color.White)
					.width(130)
					.height(130)
					.backgroundColor(Color.Green)
					.margin({ top: 10 })
					.overlay("page", {
						align: Alignment.Center,
						offset: { x: -100, y: 0 }
					})

				Box_1({ num: this.count, color: Color.Brown })
					.overlay("private", {
						align: Alignment.Center,
						offset: { x: -100, y: 0 }
					})

				Box_2({ num: this.count, color: Color.Orange })
					.overlay("@Prop", {
						align: Alignment.Center,
						offset: { x: -100, y: 0 }
					})

				// 子组件 使用 @Link 装饰器时 父组件使用$传值
				Box_3({ num: $count, color: Color.Pink })
					.overlay("@Link", {
						align: Alignment.Center,
						offset: { x: -100, y: 0 }
					})

				Box_4({color: Color.Gray})
					.overlay("@Provide和@Consume", {
						align: Alignment.Center,
						offset: { x: -110, y: 0 }
					})
			}
			.width('100%')
			.height('100%')

			Button({ type: ButtonType.Circle }) {
				Text("+")
					.width(60)
					.fontSize(40)
					.fontColor(Color.White)
					.textAlign(TextAlign.Center)
					.height(60)
					.onClick(() => {
						this.count++;
						this.count_1++;
					})

			}.position({
				x: "80%",
				y: "90%"
			})
		}
	}
}

@Component
struct Box_1 {
	private num: number;
	private color: Color;

	build() {
		Column() {
			Text(this.num.toString())
				.fontSize(50)
				.textAlign(TextAlign.Center)
				.fontColor(Color.White)
				.width(130)
				.height(130)
				.backgroundColor(this.color)
				.margin({ top: 10 })
				.onClick(() => {
					this.num++;
				})
		}
	}
}

@Component
struct Box_2 {
	@Prop num: number;
	private color: Color;

	build() {
		Column() {
			Text(this.num.toString())
				.fontSize(50)
				.textAlign(TextAlign.Center)
				.fontColor(Color.White)
				.width(130)
				.height(130)
				.backgroundColor(this.color)
				.margin({ top: 10 })
				.onClick(() => {
					this.num++;
				})
		}
	}
}

@Component
struct Box_3 {
	@Link num: number;
	private color: Color;

	build() {
		Column() {
			Text(this.num.toString())
				.fontSize(50)
				.textAlign(TextAlign.Center)
				.fontColor(Color.White)
				.width(130)
				.height(130)
				.backgroundColor(this.color)
				.margin({ top: 10 })
				.onClick(() => {
					this.num++;
				})
		}
	}
}

@Component
struct Box_4 {
	private color: Color;

	build() {
		Column() {
			StatusText();
		}.width(130)
		.height(130)
		.backgroundColor(this.color)
		.margin({ top: 10 })
	}
}

@Component
struct StatusText {
	@Consume("count") num:number;
	build(){
		Text(this.num.toString())
			.fontSize(50)
			.textAlign(TextAlign.Center)
			.fontColor(Color.White)
			.width(130)
			.height(130)
			.onClick(() => {
				this.num++;
			})
	}
}