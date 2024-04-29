@Entry
@Component
struct RelativeContainerPage {
	// 自定义组件
	@Builder boxText(text: string, id: string, color: Color, alignRules?: Object, offset?: Object) {
		Text(text)
			.width(100)
			.height(100)
			.fontSize(30)
			.textAlign(TextAlign.Center)
			.backgroundColor(color)
			.id(id)
			.alignRules(alignRules)
			.offset(offset)
	}

	build() {
		Column() {
			/**
			 * 相对布局组件
			 * 1、必须 包含 子元素2
			 * 2、子元素必须配置 id 属性 且 id属性值不能重复
			 * 3、RelativeContainer固定的id为 __container__
			 * 4、水平方向 left/middle/right 垂直方向 top/center/bottom
			 */
			RelativeContainer() {
				// 组件1
				this.boxText("1", "text_1", Color.Red, {
					middle: {
						anchor: "__container__",
						align: HorizontalAlign.Center
					}
				});
				// 组件2
				this.boxText("2", "text_2", Color.Pink, {
					right: {
						anchor: "__container__",
						align: HorizontalAlign.End
					},
					bottom: {
						anchor: "__container__",
						align: VerticalAlign.Bottom
					}
				});
				// 组件3
				this.boxText("3", "text_3", Color.Orange, {
					center: {
						anchor: "__container__",
						align: VerticalAlign.Center
					}
				});
				// 组件4
				this.boxText("4", "text_4", Color.Green, {
					bottom: {
						anchor: "text_1",
						align: VerticalAlign.Top
					},
					left: {
						anchor: "text_1",
						align: HorizontalAlign.Start
					}
				}, {
					x: -20,
					y: -20
				});
			}.width(300).height(300).border({
				width: 1,
				color: Color.Red
			}).margin({ top: 150 });

			RelativeContainer() {
				// 组件1
				this.boxText("1", "text_1", Color.Orange, {
					bottom: {
						anchor: "text_2",
						align: VerticalAlign.Top
					},
					left: {
						anchor: "text_2",
						align: HorizontalAlign.Start
					}
				});
				// 组件2
				this.boxText("2", "text_2", Color.Red, {
					middle: {
						anchor: "__container__",
						align: HorizontalAlign.Center
					},
					center: {
						anchor: "__container__",
						align: VerticalAlign.Center
					}
				});
				// 组件3
				this.boxText("3", "text_3", Color.Blue, {
					bottom: {
						anchor: "text_2",
						align: VerticalAlign.Bottom
					},
					right: {
						anchor: "text_2",
						align: HorizontalAlign.Start
					}
				});
				// 组件4
				this.boxText("4", "text_4", Color.Pink, {
					bottom: {
						anchor: "text_2",
						align: VerticalAlign.Bottom
					},
					left: {
						anchor: "text_2",
						align: HorizontalAlign.End
					}
				});
				// 组件5
				this.boxText("5", "text_5", Color.Green, {
					top: {
						anchor: "text_2",
						align: VerticalAlign.Bottom
					},
					left: {
						anchor: "text_2",
						align: HorizontalAlign.Start
					}
				});
			}.width(300).height(300).border({
				width: 1,
				color: Color.Red
			}).margin({ top: 15 });
		}.width('100%').height('100%')
	}
}