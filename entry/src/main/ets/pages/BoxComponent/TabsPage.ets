@Entry
@Component
struct TabsPage {
	topBarArr: string[] = ["首页", "电视剧", "电影", "儿童"];
	@State currentIndex: number = 0;
	private tabsController: TabsController = new TabsController();

	@Builder tabsContainer(title: string, targetIndex: number) {
		Text(title)
			.fontSize(30)
			.fontColor(this.currentIndex === targetIndex ? "red" : Color.White)
			.onClick(() => {
				this.currentIndex = targetIndex;
				this.tabsController.changeIndex(targetIndex);
			})
	}

	build() {
		Column({ space: 20 }) {
			// 顶部导航
			Tabs({
				barPosition: BarPosition.Start, // 默认
				// barPosition: BarPosition.End, //
			}) {
				ForEach(this.topBarArr, (item) => {
					TabContent() {
						Text(item + "的内容").fontSize(30)
					}.tabBar(item)
				}, item => item);
			}.height(100)
			.backgroundColor(Color.Pink)
			.barMode(BarMode.Scrollable)
			.vertical(false)

			// 底部导航
			Tabs({
				barPosition: BarPosition.End, //
			}) {
				ForEach(this.topBarArr, (item) => {
					TabContent() {
						Text(item + "的内容").fontSize(30).fontColor(Color.White)
					}.tabBar(item)
				}, item => item);
			}.height(100)
			.backgroundColor(Color.Orange)

			// 侧边导航
			Tabs({
				// barPosition: BarPosition.Start, // 默认
				barPosition: BarPosition.End, //
			}) {
				ForEach(this.topBarArr, (item) => {
					TabContent() {
						Text(item + "的内容").fontSize(30)
					}.tabBar(item)
				}, item => item);
			}
			.height(200)
			.barWidth(100)
			.backgroundColor(Color.Gray)
			.vertical(true) // 垂直方向
			.scrollable(false) // 禁止滑动切换

			// 自定义导航
			Tabs({
				barPosition: BarPosition.Start, // 默认
				controller: this.tabsController
			}) {
				ForEach(this.topBarArr, (item, index) => {
					TabContent() {
						Text(item + "的内容").fontSize(30)
					}.tabBar(this.tabsContainer(item, index))
				}, item => item);
			}.height(200)
			.backgroundColor(Color.Green)
			.scrollable(false) // 禁止滑动切换
			.animationDuration(0) // 禁用动画切换效果
		}
		.width('100%')
		.height('100%')
	}
}