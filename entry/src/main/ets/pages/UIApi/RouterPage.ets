import router from '@ohos.router';

@Entry
@Component
struct RouterPage {
	@State message: string = "路由页面";
	private len: number;
	private iIndex: number;
	private name: string;
	private path: string;

	aboutToAppear() {
		let len = router.getLength();
		this.len = Number(len);

		let state = router.getState();
		this.iIndex = Number(state.index);
		this.name = state.name;
		this.path = state.path;
	}

	build() {
		Column() {
			Text(this.message)
				.fontSize(50)
				.fontWeight(FontWeight.Bold)

			Text(`路由页面长度${this.len}`)
				.fontSize(50)
				.fontWeight(FontWeight.Bold)

			Text(`路由页面状态参数index=${this.iIndex},name=${this.name},path=${this.path}`)
				.fontSize(30)
				.fontWeight(FontWeight.Bold)

			Button() {
				Text("点击跳转微信")
					.fontColor("#fff")
					.fontSize(30)
					.padding({ top: 5, bottom: 5, left: 20, right: 20 })
					.onClick(() => {
						router.pushUrl({
							url: "pages/demo/WxListPage",
							params: {
								title: "我是标题",
								age: 18
							}
						})
					});
			}
		}
		.width('100%')
		.height('100%')
	}
}