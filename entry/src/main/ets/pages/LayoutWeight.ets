@Entry
@Component
struct LayoutWeight {
	/**
	 * layoutWeight：实现按照比例布局
	 * 横向布局时 子元素width 设置无效
	 * 纵向布局时 子元素height 设置无效
	 */

	build() {
		Column({ space: 20 }) {
			// 横向布局
			Text("横向布局").size({
				width: "100%",
				height: 30
			}).lineHeight(30).fontSize(20).textAlign(TextAlign.Center)
			Row({ space: 10 }) {
				Row() {
				}.layoutWeight(1).height(120).backgroundColor(Color.Red);
				Row() {
				}.layoutWeight(3).height(120).backgroundColor(Color.Gray);
				Row() {
				}.layoutWeight(2).height(120).backgroundColor(Color.Blue);
			}.size({
				width: "100%",
				height: 120
			}).justifyContent(FlexAlign.Center)

			// 纵向布局
			Text("纵向布局").size({
				width: "100%",
				height: 30
			}).lineHeight(30).fontSize(20).textAlign(TextAlign.Center)
			Column() {
				Row() {
				}.layoutWeight(1).width("100%").backgroundColor(Color.Orange);
				Row() {
				}.layoutWeight(3).width("100%").backgroundColor(Color.Brown);
				Row() {
				}.layoutWeight(2).width("100%").backgroundColor(Color.Pink);
			}.size({
				width: "100%",
				height: 120
			}).justifyContent(FlexAlign.Center)

			// 垂直弹性布局
			Text("垂直弹性布局").size({
				width: "100%",
				height: 30
			}).lineHeight(30).fontSize(20).textAlign(TextAlign.Center)

			Column({ space: 10 }) {
				// 上边布局
				Row() {
					Image("https://www.itying.com/images/flutter/1.png").objectFit(ImageFit.Cover)
				}.size({
					width: "100%"
				}).layoutWeight(1).backgroundColor(Color.Transparent)

				// 下边布局
				Row({space: 10}) {
					// 左边布局
					Row() {
						Image("https://www.itying.com/images/flutter/2.png").objectFit(ImageFit.Cover)
					}.size({
						width: "100%",
						height: "100%"
					}).layoutWeight(2).backgroundColor(Color.Transparent)

					// 右边布局
					Column({space: 10}) {
						// 右上布局
						Row(){
							Image("https://www.itying.com/images/flutter/3.png").objectFit(ImageFit.Cover)
						}.width("100%").backgroundColor(Color.Transparent).layoutWeight(1)
						// 右下布局
						Row(){
							Image("https://www.itying.com/images/flutter/4.png").objectFit(ImageFit.Cover)
						}.width("100%").backgroundColor(Color.Transparent).layoutWeight(1)
					}.size({
						width: "100%",
						height: "100%"
					}).layoutWeight(1).justifyContent(FlexAlign.Center)
				}.size({
					width: "100%"
				}).layoutWeight(1).alignItems(VerticalAlign.Center)
			}.size({
				width: "100%",
				height: 300
			})
		}
	}
}