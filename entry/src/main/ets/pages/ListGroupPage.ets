interface CarInterface {
	code: string,
	children: CarItemInterface[]
}

interface CarItemInterface {
	title: string
}

@Entry
@Component
struct ListGroupPage {
	@State list: CarInterface[] = [
		{
			code: "A",
			children: [
				{ title: "奥拓" },
				{ title: "奥迪" },
				{ title: "奥巴马" },
				{ title: "爱媛" },
			]
		},
		{
			code: "B",
			children: [
				{ title: "巴拉姆" },
				{ title: "巴拿马" },
				{ title: "不知道" },
				{ title: "布加迪" },
				{ title: "宝马" },
				{ title: "保时捷" },
				{ title: "北京" },
			]
		},
		{
			code: "C",
			children: [
				{ title: "次要的" },
				{ title: "城市" },
				{ title: "词组" },
				{ title: "此事" },
			]
		},
		{
			code: "D",
			children: [
				{ title: "董玉飞" },
				{ title: "董宇辉" },
				{ title: "董事的" },
				{ title: "东大街" },
			]
		},
	]
	@State codeList: string[] = ["A", "B", "C", "D", "E", "F"];
	scroller: Scroller = new Scroller();
	@State selectIndex: number = 0;

	@Builder headerGroup(cate: string) {
		Text(cate)
			.width("100%")
			.height(30)
			.backgroundColor(Color.Gray)
			.fontSize(20)
			.fontColor(Color.Orange)
			.padding({ left: 10 })
	}

	build() {
		Column() {
			Stack({ alignContent: Alignment.End }) {
				List({ space: 10, scroller: this.scroller }) {
					ForEach(this.list, (item: CarInterface) => {
						ListItemGroup({
							header: this.headerGroup(item.code)
							// footer: this.headerGroup(item.code)
						}) {
							ForEach(item.children, (val: CarItemInterface) => {
								ListItem() {
									Text(val.title)
										.width("100%")
										.height(100)
										.backgroundColor(Color.Pink)
										.fontSize(20)
										.fontColor(Color.Orange)
										.padding(10)
								}
							}, (val: CarItemInterface) => val.title);
						}.divider({
							strokeWidth: 1,
							color: Color.Red
						})
					}, (item: CarInterface) => item.code);
				}
				.sticky(StickyStyle.Header) // 吸顶
				// .sticky(StickyStyle.Footer) // 吸底
				.onScrollIndex((index: number) => {
					this.selectIndex = index;
				})

				AlphabetIndexer({
					arrayValue: this.codeList,
					selected: 0
				})
					.font({
						size: 16
					})
					.width(30)
					.height(200)
					.selected(this.selectIndex)
					.onSelect((index: number) => {
						this.scroller.scrollToIndex(index);
					})
			}
		}
		.width('100%')
		.height('100%')
		.backgroundColor("#eee")
	}
}