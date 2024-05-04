interface numInterface {
	num: number,
	key: number
}

@Entry
@Component
struct TransitionPage {
	@State flag_1: boolean = false;
	@State flag_2: boolean = false;
	@State numberListArr: numInterface[] = [
		{ num: 1, key: 1 },
		{ num: 2, key: 2 },
		{ num: 3, key: 3 },
		{ num: 4, key: 4 },
	];

	build() {
		Stack({ alignContent: Alignment.BottomEnd }) {
			Scroll() {
				Column({ space: 20 }) {
					// 转场过度动画
					Column() {
						if (this.flag_1) {
							Row() {

							}
							.width(150)
							.height(150)
							.opacity(1)
							.backgroundColor(Color.Brown)
							.transition({
								type: TransitionType.Insert,
								opacity: 0.1,
								translate: {
									x: -300,
									y: 0
								},
								rotate: {
									z: 1,
									angle: 360
								}
							})
							.transition({
								type: TransitionType.Delete,
								opacity: 0,
								translate: {
									x: 300,
									y: 0
								},
								rotate: {
									z: 1,
									angle: 360
								}
							})
						}
					}
					.width("100%")
					.height(200)
					.justifyContent(FlexAlign.Center)
					.alignItems(HorizontalAlign.Center)
					.overlay("点击开启旋转位移动画", { align: Alignment.Center })
					.backgroundColor("#efefef")
					.onClick(() => {
						animateTo({
							duration: 2000,
							curve: Curve.EaseInOut
						}, () => {
							this.flag_1 = !this.flag_1;
						})
					})

					// 转场过度动画
					Column() {
						if (this.flag_2) {
							Row() {

							}
							.width(150)
							.height(150)
							.opacity(1)
							.backgroundColor(Color.Brown)
							.transition({
								type: TransitionType.All,
								opacity: 0.1,
								scale: {
									x: 0,
									y: 0,
									centerX: 75,
									centerY: 75
								},
								rotate: {
									z: 1,
									angle: 360
								}
							})
						}
					}
					.width("100%")
					.height(200)
					.justifyContent(FlexAlign.Center)
					.alignItems(HorizontalAlign.Center)
					.overlay("点击开启旋转缩放动画", { align: Alignment.Center })
					.backgroundColor("#efefef")
					.onClick(() => {
						animateTo({
							duration: 2000
						}, () => {
							this.flag_2 = !this.flag_2;
						})
					})

					// 列表转场动画
					List({ space: 10 }) {
						ForEach(this.numberListArr, (item: numInterface) => {
							ListItem() {
								Text(`${item.num}`)
									.textAlign(TextAlign.Center)
									.fontSize(30)
									.fontWeight(FontWeight.Bold)
									.fontColor(Color.White)
									.backgroundColor(Color.Red)
							}
							.id(item.num.toString())
							.key(item.num.toString())
							.width("100%")
							.height(40)
							.backgroundColor(Color.Orange)
							.transition({
								type: TransitionType.Insert,
								translate: {
									x: -300
								}
							})
							.transition({
								type: TransitionType.Delete,
								translate: {
									x: 300
								}
							})
							.onClick(() => {
								animateTo({
									duration: 1500
								}, () => {
									let defaultKey = -1;
									this.numberListArr.forEach((val: numInterface, i) => {
										if (val.num === item.num) {
											defaultKey = i;
										}
									});
									if (defaultKey !== -1) {
										this.numberListArr.splice(defaultKey, 1);
									} else {
										console.warn("--defaultKey--", defaultKey);
									}
								})
							})
						}, (item: numInterface) => {
							return item.num.toString();
						});
					}
				}
			}.scrollBar(BarState.Auto)
			.width("100%")
			.padding({ top: 20, bottom: 20 })

			Button() {
				Text("+")
					.fontSize(50)
					.fontWeight(FontWeight.Bold)
					.fontColor(Color.White)
					.textAlign(TextAlign.Center)
			}
			.width(60)
			.type(ButtonType.Circle)
			.position({
				x: "80%",
				y: "90%"
			})
			.onClick(() => {
				animateTo({
					duration: 1500
				}, () => {
					this.numberListArr.push(this.numberListArr.length !== 0 ?
						{
							num: (this.numberListArr[this.numberListArr.length - 1].num + 1),
							key: (this.numberListArr[this.numberListArr.length - 1].key + 1)
						} :
						{
							num: 1,
							key: 1
						});
				})
			})
		}
	}
}