@Entry
@Component
struct RelativePosition {
	@State flag: boolean = false;

	// 自定义组件
	@Builder boxText(text: string, bgColor: Color, alignRules?: Object, offset?: Object, onClickFun?: Function) {
		Button() {
			Text(`${text}`)
				.fontSize(36)
				.width(60)
				.height(60)
				.textAlign(TextAlign.Center)
				.fontColor(Color.White)
		}
		.id(`btn_${text}`)
		.backgroundColor(bgColor)
		.alignRules(alignRules)
		.offset(offset)
		.onClick(() => {
			onClickFun()
		})
	}

	build() {
		Column() {
			Stack({ alignContent: Alignment.BottomEnd }) {
				List({ space: 10 }) {
					ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], (item) => {
						ListItem() {
							Text(`${item}`)
								.fontSize(16)
								.width("100%")
								.height(60)
								.backgroundColor("#ddd")
								.borderRadius(10)
								.textAlign(TextAlign.Center)
						}
					}, item => item);
				}.height("100%")

				RelativeContainer() {
					this.boxText("+", Color.Blue, {
						bottom: {
							anchor: "__container__",
							align: VerticalAlign.Bottom
						},
						right: {
							anchor: "__container__",
							align: HorizontalAlign.End
						}
					}, {}, () => {
						this.flag = !this.flag;
					});

					if (this.flag) {
						this.boxText("A", Color.Orange, {
							bottom: {
								anchor: "btn_+",
								align: VerticalAlign.Top
							},
							left: {
								anchor: "btn_+",
								align: HorizontalAlign.Start
							}
						}, { y: -30 });

						this.boxText("B", Color.Green, {
							bottom: {
								anchor: "btn_+",
								align: VerticalAlign.Bottom
							},
							right: {
								anchor: "btn_+",
								align: HorizontalAlign.Start
							}
						}, { x: -30 });

						this.boxText("C", Color.Red, {
							bottom: {
								anchor: "btn_+",
								align: VerticalAlign.Top
							},
							right: {
								anchor: "btn_+",
								align: HorizontalAlign.Start
							}
						}, { x: -10, y: -10 });
					}

				}.width(160).height(160).offset({ x: -10, y: -10 })
			}

		}.width('100%').height('100%')
	}
}