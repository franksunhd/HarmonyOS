import promptAction from '@ohos.promptAction';

@Entry
@Component
struct AppearPage {
	@State isShow: boolean = true;

	build() {
		Column({ space: 30 }) {
			Button() {
				Text("点击挂载/卸载内容")
					.textAlign(TextAlign.Center)
					.fontSize(20)
					.fontColor(Color.White)
					.padding({ top: 10, bottom: 10, left: 20, right: 20 })
			}.onClick(() => {
				this.isShow = !this.isShow;
			})

			if (this.isShow) {
				Text("文本内容").fontSize(40)
					.margin({ top: 20 })
					.onAppear(() => {
						promptAction.showToast({
							message: "文本内容已挂载",
							duration: 1000,
							bottom: 200
						})
					})
					.onDisAppear(() => {
						promptAction.showToast({
							message: "文本内容已卸载",
							duration: 1000,
							bottom: 200
						})
					})
			}
		}
		.justifyContent(FlexAlign.Start)
		.width('100%')
		.height('100%')
		.padding(20)
	}
}