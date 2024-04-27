@Entry
@Component
struct SwiperPage {
	private listArr: number[] = [1, 2, 3, 4, 5, 6, 7];
	private colorArr: Color[] = [Color.Pink, Color.Yellow, Color.Blue, Color.Gray, Color.Orange, Color.Red, Color.Brown];
	private swiperController: SwiperController = new SwiperController();
	@State currentIndex: number = 0;

	build() {
		Column() {
			Swiper(this.swiperController) {
				ForEach(this.listArr, (item, index) => {
					Text(String(item))
						.width("100%")
						.height("100%")
						.fontSize(60)
						.fontColor(index === 0 ? Color.White : this.colorArr[index - 1])
						.textAlign(TextAlign.Center)
						.backgroundColor(this.colorArr[index])
				}, item => item);
			}
			.height(300)
			.autoPlay(true) // 自动轮播
			.loop(true) // 无限循环
			.interval(2000) // 间隔2s
			.duration(300) // 动画时间
			.indicatorStyle({
				// color: Color.Blue, // 正常颜色
				selectedColor: Color.Red, // 选中颜色
				size: 30, // 大小
				mask: true, // 是否显示导航点蒙层样式
			})
			.indicator(true) // 是否显示指示器
			.vertical(false) // 轮播方向 true:垂直方向 false:水平方向
			.displayCount(3) // 单屏幕显示的数量
			.itemSpace(20) // 子组件之间的间隙
			.displayMode(SwiperDisplayMode.AutoLinear)
			.effectMode(EdgeEffect.Fade)
			.onChange((index) => {
				this.currentIndex = index;
			});

			Row({ space: 20 }) {
				Button("上一张")
					.fontSize(20)
					.fontColor(Color.White)
					.onClick(() => {
						this.swiperController.showPrevious();
						this.swiperController.finishAnimation(() => {
							console.warn("--动画结束--", this.currentIndex);
						});
					})
				Button("下一张")
					.fontSize(20)
					.fontColor(Color.White)
					.onClick(() => {
						this.swiperController.showNext();
					})
			}.justifyContent(FlexAlign.Center)
			.margin({ top: 30 })

		}
		.width('100%')
		.height('100%')
	}
}