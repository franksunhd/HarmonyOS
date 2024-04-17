import router from "@ohos.router";

@Entry
@Component
struct ListPage {
	@State listArr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9];

	// 纵向布局
	@Builder VerticalList() {
		List({ space: 30, initialIndex: 2 }) {
			ForEach(this.listArr, (item) => {
				ListItem() {
					// 注意：listItem中只能是单个组件
					Text(`${item}`)
						.width("100%")
						.textAlign(TextAlign.Center)
						.height(100)
						.fontSize(30)
						.fontWeight(FontWeight.Bold)
						.backgroundColor("#fff")
				}.width(item * 10)
			}, item => item);
		}
		.lanes(1) // 设置交叉轴方向 显示排列项 数量
		// .lanes({minLength: 100, maxLength: 200})
		.alignListItem(ListItemAlign.Center) // 设置交叉轴上对齐方式
		.height(300)
		// 增加间隔线
		.divider({
			strokeWidth: 10,
			color: Color.Red,
			startMargin: 10,
			endMargin: 10
		})
		.chainAnimation(true) // 是否启用链式联动动效
		.scrollBar(BarState.On) // BarState:On常开 Auto自动 Off常关
		.edgeEffect(EdgeEffect.Fade) // Spring:类似IOS风格 Fade:椭圆下拉风格 None:关闭效果
	}

	// 横向布局
	@Builder HorizontalList() {
		List({ space: 30, initialIndex: 0 }) {
			ForEach(this.listArr, (item) => {
				ListItem() {
					Text(`${item}`)
						.width(100)
						.textAlign(TextAlign.Center)
						.height("100%")
						.fontSize(30)
						.fontWeight(FontWeight.Bold)
						.backgroundColor("#fff")
				}.height(item * (item <= 4 ? 20 : 10))
			}, item => item);
		}
		.lanes(2) // 设置交叉轴方向 显示排列项 数量
		// .lanes({minLength: 100, maxLength: 200})
		.alignListItem(ListItemAlign.Center) // 设置交叉轴上对齐方式
		.height(300)
		// 增加间隔线
		.divider({
			strokeWidth: 10,
			color: Color.Red,
			startMargin: 10,
			endMargin: 10
		})
		.listDirection(Axis.Horizontal)
		.scrollBar(BarState.Auto) // BarState:On常开 Auto自动 Off常关
		.edgeEffect(EdgeEffect.Spring) // Spring:类似IOS风格 Fade:椭圆下拉风格 None:关闭效果
	}

	build() {
		Column({ space: 20 }) {
			// 纵向布局 initialIndex:设置的值当总的滚动高度不够时会导致设置位置不准,以实际滚动高度为准
			Column() {
				Text("纵向布局").fontSize(20);
				this.VerticalList();
			}

			// 水平方向布局
			Column() {
				Text("横向布局").fontSize(20);
				this.HorizontalList();
			}

			Row() {
				Button() {
					Text("微信实例").fontSize(20)
						.fontColor(Color.White)
						.padding({ top: 6, bottom: 6, left: 14, right: 14 })
						.onClick(() => {
							router.pushUrl({
								url: "pages/demo/WxListPage",
								params: {
									key: "username"
								}
							})
						})
				}

				Button() {
					Text("文章实例").fontSize(20)
						.fontColor(Color.White)
						.padding({ top: 6, bottom: 6, left: 14, right: 14 })
						.onClick(() => {
							router.pushUrl({
								url: "pages/demo/ArticleListPage",
								params: {
									key: "username"
								}
							})
						})
				}.backgroundColor(Color.Green)
			}.width("100%").justifyContent(FlexAlign.SpaceAround)
		}.width("100%").height("100%")
		.backgroundColor("#eee").padding(10)
	}
}