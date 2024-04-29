import { publicContainer } from "../components/PublicContainer";

@Entry
@Component
struct FlexPage {
	/**
	 * 私有化组件
	 * @params text：内容文本
	 * @param w：宽度
	 * @param h: 高度
	 * @param color: 颜色
	 */
	@Builder privateContainer(text: string | number,
							  w: string | number = 80,
							  h: string | number = 80,
							  color: Color | string | number = Color.White,
							  bgColor: Color | string | number = Color.Blue) {
		publicContainer({
			text,
			w,
			h,
			color,
			bgColor
		});
	}

	// 横向布局组件
	@Builder RowFlex() {
		Flex({
			direction: FlexDirection.Row,
			justifyContent: FlexAlign.Start, // 配置主轴
			wrap: FlexWrap.Wrap, //
			alignContent: FlexAlign.Center, // 配置纵轴 注意：只有在wrap的值为Wrap或者WrapReverse时才生效
			alignItems: ItemAlign.Center
		}) {
			// 私有组件调用
			this.privateContainer(1, 80, 40, Color.White, Color.Red);
			this.privateContainer(2, 120, 60, "#333", Color.Yellow);
			// 公用组件调用
			publicContainer({
				text: 3,
				w: 100,
				h: 50,
				color: Color.Black,
				bgColor: Color.Pink
			});
			publicContainer({ text: 4, bgColor: Color.Brown });
			publicContainer({ text: 5, h: 70, bgColor: Color.Green });
		}.width("100%").height(200).border({
			color: Color.Green,
			width: 4
		})
	}

	// 纵向布局组件
	@Builder ColumnFlex() {
		Flex({
			direction: FlexDirection.Column,
			justifyContent: FlexAlign.Start, // 配置主轴
			wrap: FlexWrap.Wrap, //
			alignContent: FlexAlign.Start, // 配置纵轴 注意：只有在wrap的值为Wrap或者WrapReverse时才生效
			alignItems: ItemAlign.Center
		}) {
			// 私有组件调用
			this.privateContainer(1, 80, 40, Color.White, Color.Red);
			this.privateContainer(2, 120, 60, "#333", Color.Yellow);
			// 公用组件调用
			publicContainer({
				text: 3,
				w: 100,
				h: 30,
				color: Color.Black,
				bgColor: Color.Pink
			});
			publicContainer({ text: 4, bgColor: Color.Brown });
			publicContainer({ text: 5, h: 50, bgColor: Color.Green });
		}.width("100%").height(200).border({
			color: Color.Green,
			width: 4
		})
	}

	// 弹性布局
	@Builder flexContainer() {
		Column({ space: 10 }) {
			// 上半部分
			publicContainer({ text: "up", w: "100%", h: "50%", bgColor: Color.Red })
			// 下半部分
			Flex({
				direction: FlexDirection.Row,
				justifyContent: FlexAlign.SpaceBetween
			}) {
				publicContainer({ text: "left", flexG: 3, h: "100%", bgColor: Color.Blue })
				Flex({
					direction: FlexDirection.Column,
					alignItems: ItemAlign.Stretch
				}) {
					publicContainer({ text: "rUp", fs: 20, bgColor: Color.Orange })
					publicContainer({ text: "rDown", fs: 20, bgColor: Color.Pink })
				}.flexGrow(1).margin({ left: 10 })
			}.height("50%")
		}.height(300)
	}

	build() {
		Column({ space: 10 }) {
			// // 横向布局
			this.RowFlex();
			// // 纵向布局
			this.ColumnFlex();
			// 弹性布局
			this.flexContainer();
		}
	}
}