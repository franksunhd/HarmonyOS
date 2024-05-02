@Entry
@Component
struct AnimationPage {
	@State flag_2: boolean = false; // 侧边栏动画
	@State flag_3: boolean = false; // 旋转缩放动画

	build() {
		Stack({ alignContent: Alignment.Start }) {
			Column() {
				// 属性动画
				attrAnimation();

				Divider().margin({ top: 20, bottom: 20 })

				// 显示动画
				showAnimation();

				Divider().margin({ top: 20, bottom: 20 })

				// 旋转缩放动画
				Column() {
					Row() {

					}
					.width(150)
					.height(150)
					.backgroundColor(Color.Brown)
					.overlay("旋转缩放动画", { align: Alignment.Center })
					.rotate({
						z: 1,
						angle: this.flag_3 ? 360 : 0
					})
					.scale({
						x: !this.flag_3 ? 1 : 0.5,
						y: !this.flag_3 ? 1 : 0.5,
						centerX: 75,
						centerY: 75
					})
					.onClick(() => {
						animateTo({
							duration: 3000, // 动画时间
							tempo: 1, // 动画播放速度,数值越大,动画越快
							curve: Curve.EaseInOut, // 动画曲线
							delay: 100, // 动画延迟时长
							iterations: 4, // 播放次数 取值范围[-1, +∞], -1时无限次
							playMode: PlayMode.Alternate, // 动画播放模式
							onFinish: () => {
								// 动画播放完成 状态回调
							}
						}, () => {
							this.flag_3 = !this.flag_3;
						});
					})
				}
				.width("100%")
				.height(150)
				.backgroundColor("#eee")
				.justifyContent(FlexAlign.Center)
				.alignItems(HorizontalAlign.Center)

				Divider().margin({ top: 20, bottom: 20 })

				// 按钮
				Row() {
					Button() {
						Text(`${!this.flag_2 ? '打开' : '关闭'}侧边栏`)
							.padding({ top: 10, bottom: 10, left: 20, right: 20 })
							.fontSize(20)
							.fontColor(Color.White)
							.onClick(() => {
								this.flag_2 = !this.flag_2;
							})
					}
				}.width("100%")
				.justifyContent(FlexAlign.Center)
			}.width('100%')
			.height('100%')

			// 侧边栏
			sideAnimation({ flag: this.flag_2 });
		}
	}
}

@Component
struct attrAnimation {
	@State flag: boolean = false; // 属性动画

	build() {
		Column() {
			Row() {

			}
			.width(!this.flag ? 100 : 200)
			.height(!this.flag ? 100 : 140)
			.backgroundColor(!this.flag ? Color.Red : Color.Brown)
			.overlay("属性动画", { align: Alignment.Center })
			.animation({
				duration: 3000, // 动画时间
				tempo: 1, // 动画播放速度,数值越大,动画越快
				delay: 100, // 动画延迟时长
				iterations: 3, // 播放次数 取值范围[-1, +∞], -1时无限次
				playMode: PlayMode.Alternate, // 动画播放模式
				curve: Curve.EaseInOut,
				onFinish: () => {
					// 动画播放完成 状态回调
				}
			})
			.onClick(() => {
				this.flag = !this.flag;
			})
		}
		.width("100%")
		.height(150)
		.backgroundColor("#eee")
		.justifyContent(FlexAlign.Center)
		.alignItems(HorizontalAlign.Center)
	}
}

@Component
struct showAnimation {
	@State flag_1: boolean = false; // 显示动画
	build() {
		Column() {
			Row() {

			}
			.width(!this.flag_1 ? 100 : 200)
			.height(!this.flag_1 ? 100 : 140)
			.backgroundColor(!this.flag_1 ? Color.Red : Color.Brown)
			.overlay("显示动画", { align: Alignment.Center })
			.onClick(() => {
				animateTo({
					duration: 3000, // 动画时间
					tempo: 1, // 动画播放速度,数值越大,动画越快
					curve: Curve.EaseInOut, // 动画曲线
					delay: 100, // 动画延迟时长
					iterations: 3, // 播放次数 取值范围[-1, +∞], -1时无限次
					playMode: PlayMode.Alternate, // 动画播放模式
					onFinish: () => {
						// 动画播放完成 状态回调
					}
				}, () => {
					this.flag_1 = !this.flag_1;
				});
			})
		}
		.width("100%")
		.height(150)
		.backgroundColor("#eee")
		.justifyContent(FlexAlign.Center)
		.alignItems(HorizontalAlign.Center)
	}
}

@Component
struct sideAnimation {
	@Prop flag: boolean; // 侧边栏动画

	build() {
		Column() {
			Row() {
				Text("side")
					.width("100%")
					.fontSize(30)
					.textAlign(TextAlign.Center)
					.fontColor(Color.White)
			}
			.width("100%")
			.height("100%")
			.backgroundColor(Color.Green)
			.translate({
				x: this.flag ? 0 : -100
			})
			.animation({
				duration: 500, // 动画时间
				tempo: 1, // 动画播放速度,数值越大,动画越快
				curve: Curve.EaseInOut, // 动画曲线
				delay: 100, // 动画延迟时长
				iterations: 1, // 播放次数 取值范围[-1, +∞], -1时无限次
				playMode: PlayMode.Alternate, // 动画播放模式
				onFinish: () => {
					// 动画播放完成 状态回调
				}
			})
		}.width(100)
	}
}