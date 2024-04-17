@Entry
@Component
struct ListScrollerPage {
	@State list: string[] = [];
	scroller: Scroller = new Scroller();

	onPageShow() {
		for (let index = 0; index < 20; index++) {
			this.list.push("新闻" + (index + 1));
		}
	}

	@Builder ActionItem(index: number) {
		Button({ type: ButtonType.Circle }) {
			Image("https://www.itying.com/images/listimg/icon/delete.png")
				.width(30)
				.height(30)
				.objectFit(ImageFit.Cover)
		}
		.backgroundColor(Color.Red)
		.margin({ left: 20 })
		.width(50)
		.height(50)
		.onClick(() => {
			this.list.splice(index, 1);
		})
	}

	build() {
		Column() {
			Stack({ alignContent: Alignment.BottomEnd }) {
				List({ space: 10, scroller: this.scroller }) {
					ForEach(this.list, (item, key) => {
						ListItem() {
							Text(item).width("100%").fontSize(20)
								.textAlign(TextAlign.Center)
						}
						.width("100%")
						.height(100)
						.borderRadius(10)
						.backgroundColor(Color.White)
						.swipeAction({
							end: this.ActionItem(key)
						})

					}, item => item);
				}.padding(10)

				Button() {
					Image("https://www.itying.com/images/listimg/icon/arrow_top.png")
						.width(30)
						.height(30)
						.objectFit(ImageFit.Cover)
				}
				.type(ButtonType.Circle)
				.backgroundColor("#ddd")
				.width(60)
				.height(60)
				.margin({ right: 20 })
				.onClick(() => {
					// 1、按下标滚动
					// this.scroller.scrollToIndex(0);

					// 2、按照水平和垂直距离滚动,可以添加动画时长(滑动指定位置)
					// this.scroller.scrollTo({
					// 	xOffset: 0,
					// 	yOffset: 300,
					// 	animation: {
					// 		duration: 3000,
					// 		curve: Curve.EaseInOut
					// 	}
					// });

					// 3、滚动到末尾
					// this.scroller.scrollEdge(Edge.Bottom);

					// 4、横向和纵向的滚动距离(滑动指定的距离)
					this.scroller.scrollBy(0, 100);
				})
			}
		}
		.width('100%')
		.height('100%')
		.backgroundColor("#eee")
	}
}