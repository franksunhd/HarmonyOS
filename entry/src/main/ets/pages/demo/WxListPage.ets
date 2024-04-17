import router from '@ohos.router';

interface WxListInterFace {
	title: string,
	img: string
}

@Entry
@Component
struct WxListPage {
	@State wxList: WxListInterFace[] = [
		{ title: "服务", img: "https://www.itying.com/images/listimg/icon/01.jpg" },
		{ title: "收藏", img: "https://www.itying.com/images/listimg/icon/02.jpg" },
		{ title: "朋友圈", img: "https://www.itying.com/images/listimg/icon/03.jpg" },
		{ title: "视频号", img: "https://www.itying.com/images/listimg/icon/04.jpg" },
		{ title: "卡包", img: "https://www.itying.com/images/listimg/icon/05.jpg" },
		{ title: "表情", img: "https://www.itying.com/images/listimg/icon/06.jpg" },
		{ title: "设置", img: "https://www.itying.com/images/listimg/icon/07.jpg" },
	]

	build() {
		Column() {
			List({ space: 10 }) {
				// 用户头像区域
				ListItem() {
					Text("头像区域")
						.fontSize(26)
						.width("100%")
						.height(160)
						.backgroundColor(Color.Orange)
						.textAlign(TextAlign.Center)
				}

				// 服务
				ListItem() {
					Row() {
						Row() {
							Image(this.wxList[0].img).width(28).height(28).objectFit(ImageFit.Cover)
							Text(this.wxList[0].title).fontSize(20).margin({ left: 10 })
						}

						Image("https://www.itying.com/images/listimg/icon/arrow_forward.jpg")
							.width(28)
							.height(28)
							.objectFit(ImageFit.Cover)
					}.width("100%").justifyContent(FlexAlign.SpaceBetween).padding(12)
				}.width("100%").backgroundColor("#fff")


				ListItem() {
					Column() {
						ForEach(this.wxList, (item: WxListInterFace, key) => {
							if (key > 0 && key < this.wxList.length - 1) {
								Row() {
									Row() {
										Image(item.img).width(28).height(28).objectFit(ImageFit.Cover)
										Text(item.title).fontSize(20).margin({ left: 10 })
									}

									Image("https://www.itying.com/images/listimg/icon/arrow_forward.jpg")
										.width(28)
										.height(28)
										.objectFit(ImageFit.Cover)
								}.width("100%").justifyContent(FlexAlign.SpaceBetween).padding(12)

								Divider().strokeWidth(1).color("#eee").margin({ left: 50 })
							}
						}, item => item);
					}
				}.width("100%").backgroundColor("#fff")

				// 设置
				ListItem() {
					Row() {
						Row() {
							Image(this.wxList[this.wxList.length - 1].img)
								.width(28)
								.height(28)
								.objectFit(ImageFit.Cover)
							Text(this.wxList[this.wxList.length - 1].title).fontSize(20).margin({ left: 10 })
						}

						Image("https://www.itying.com/images/listimg/icon/arrow_forward.jpg")
							.width(28)
							.height(28)
							.objectFit(ImageFit.Cover)
					}.width("100%").justifyContent(FlexAlign.SpaceBetween).padding(12)
				}.width("100%").backgroundColor("#fff")

			}

			Button() {
				Text("返回").fontSize(20)
					.fontColor(Color.White)
					.padding({ top: 6, bottom: 6, left: 14, right: 14 })
					.onClick(() => {
						router.back();
					})
			}.margin({ top: 20 })
		}.width('100%').height('100%').backgroundColor("#eee")
	}
}