import router from '@ohos.router';

@Entry
@Component
struct RouterPage {
	@State message: string = "路由页面";
	private len: number;
	private iIndex: number;
	private name: string;
	private path: string;
	@StorageLink("idNo") idNo:number = 0;

	// 生命周期函数
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
				.fontSize(30)
				.fontWeight(FontWeight.Bold)
				.margin({ top: 20 })

			Text(`路由页面长度${this.len}`)
				.fontSize(30)
				.fontWeight(FontWeight.Bold)
				.margin({ top: 20 })

			Text(`路由页面状态参数index=${this.iIndex},name=${this.name},path=${this.path}`)
				.fontSize(20)
				.fontWeight(FontWeight.Bold)
				.margin({ top: 20 })

			Button() {
				Text("点击跳转微信")
					.fontColor("#fff")
					.fontSize(20)
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
			}.margin({ top: 20 })

			Divider().margin({ top: 50, bottom: 50 })

			Text(`@StorageLink idNo=${this.idNo}`)
				.fontSize(30)
				.fontWeight(FontWeight.Bold)
				.margin({ top: 20 })

			Button() {
				Text("设置count的值+1")
					.fontSize(20)
					.fontColor(Color.White)
			}.padding({ top: 10, bottom: 10, left: 20, right: 20 })
			.margin({ top: 20 })
			.onClick(() => {
				this.idNo++;
				PersistentStorage.PersistProp<number>("idNo", this.idNo);
			})
		}
		.width('100%')
		.height('100%')
		.padding(20)
	}
}