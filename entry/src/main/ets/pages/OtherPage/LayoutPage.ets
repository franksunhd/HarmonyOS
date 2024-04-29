@Entry
@Component
struct Layout {
	build() {
		Column({ space: 10 }) {
			List() {
				ListItem() {
					// 注意：listItem中对象只能是单个对象,多个对象需要进行包裹
					Column({ space: 10 }) {
						// 容器
						layoutRow();

						Text("this is text this is text this is text this is text this is text this is text")
							.fontSize(20)
							.margin({ top: 20 })

						// 自定义组件传值
						Container({ w: 100, h: 100, iconStr: $r("app.media.ic_files_7z") })
						Container({ color: Color.Blue, iconStr: $r("app.media.ic_files_wav") })
						Container({
							w: 150,
							h: 150,
							color: Color.Green,
							sizeNum: 0.7,
							iconStr: $r("app.media.ic_files_contacts")
						})

						// 热门组件
						hotContainer();
					}
				}
			}
		}.width('100%').height('100%')
	}
}

// 自定义组件
@Component
struct layoutRow {
	build() {
		Row() {
			Row() {
				Row() {
				}.size({
					width: "100%",
					height: "100%"
				}).backgroundColor(Color.Blue)
			}
			.width(200)
			.height(200)
			.backgroundColor(Color.Red)
			.padding(20)
			.margin(40)
		}.backgroundColor(Color.Yellow)
	}
}

// 自定义组件 --- 传值
@Component
struct Container {
	w: number = 200;
	h: number = 200;
	color: Color = Color.Red;
	sizeNum: number = 0.5;
	iconStr: Resource = $r("app.media.icon");

	build() {
		Row() {
			Image(this.iconStr)
				.width(this.w * this.sizeNum)
				.height(this.h * this.sizeNum)
		}.size({
			width: this.w,
			height: this.h
		}).backgroundColor(this.color)
		.justifyContent(FlexAlign.Center) // 水平方向
		.alignItems(VerticalAlign.Center) // 垂直方向
	}
}

// 自定义组件 --- 热门推荐
@Component
struct hotContainer {
	build() {
		Row() {
			Text("热门推荐").fontSize(30).padding({ left: 10 })
			Text("更多>").fontSize(20).padding({ right: 10 })
		}.size({
			width: "100%",
			height: 60
		}).backgroundColor(Color.Orange)
		.justifyContent(FlexAlign.SpaceBetween)
		.alignItems(VerticalAlign.Center)
	}
}