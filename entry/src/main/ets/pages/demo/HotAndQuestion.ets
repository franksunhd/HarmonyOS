// 自定义接口
interface HelpInterFace {
	title: string,
	icon: Resource
}

@Entry
@Component
struct HotAndQuestion {
	@State listArr: string[] = ["军大衣", "羽绒服", "夹克衫", "棒球服", "T恤", "Android", "HarmonyOS"];
	@State listData: HelpInterFace[] = [
		{ title: "常见问题", icon: $r("app.media.ic_files_7z") },
		{ title: "客服电话", icon: $r("app.media.app_icon") },
		{ title: "在线咨询", icon: $r("app.media.ic_files_wav") },
		{ title: "我的订阅", icon: $r("app.media.ic_files_contacts") },
		{ title: "意见反馈", icon: $r("app.media.icon") },
		{ title: "会员中心", icon: $r("app.media.ic_files_wav") },
	]

	// 热搜推荐
	@Builder hotComponent() {
		Column() {
			Text("热搜推荐")
				.fontSize(26)
				.fontColor("#666")
				.fontWeight(FontWeight.Bold)
				.width("100%")
				.padding(10)
			Flex({
				direction: FlexDirection.Row,
				wrap: FlexWrap.Wrap
			}) {
				ForEach(this.listArr, (item: string) => {
					Text(`${item}`)
						.padding({
							top: 6,
							bottom: 6,
							left: 14,
							right: 14
						})
						.fontSize(16)
						.backgroundColor("#ddd")
						.margin(5)
						.borderRadius(10)
				})
			}
		}.size({
			width: "100%"
		})
	}

	// 常见问题
	@Builder helpComponent() {
		Column() {
			Text("常见问题")
				.fontSize(26)
				.fontColor("#666")
				.fontWeight(FontWeight.Bold)
				.width("100%")
				.padding(10)
			Flex({
				direction: FlexDirection.Row,
				wrap: FlexWrap.Wrap
			}) {
				ForEach(this.listData, (item: HelpInterFace) => {
					Column() {
						Image(item.icon).size({
							width: 48, height: 48
						})
						Text(item.title).fontSize(14).margin({ top: 5 })
					}.width("25%").margin({ bottom: 20 })
				}, (item: HelpInterFace) => {
					return item.title;
				});
			}.backgroundColor("#ddd").padding({
				top: 10,
				left: 10,
				right: 10,
				bottom: 0
			}).margin({
				top: 0,
				left: 10,
				right: 10
			}).borderRadius(10)
		}.size({
			width: "100%"
		})
	}

	build() {
		Column({ space: 20 }) {
			// 热搜推荐
			this.hotComponent();

			// 常见问题
			this.helpComponent();
		}.size({
			width: "100%",
			height: "100%"
		})
	}
}