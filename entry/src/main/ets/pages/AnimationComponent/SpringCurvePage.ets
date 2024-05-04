import curves from '@ohos.curves';

@Entry
@Component
struct SpringCurvePage {
	@State translateX: number = 0; // 刚开始显示的位置
	@State flag: boolean = true;

	jumpSpeedFunction(velocity: number) {
		this.translateX = -10; // 开始运动时的起始位置
		animateTo({
			duration: 1500,
			// springCurve:构造弹簧曲线 velocity:初始速度, mass:质量, stiffness:刚度, damping:阻尼
			curve: curves.springCurve(velocity, 1, 1, 1)
		}, () => {
			this.translateX = 0;
		})
	}

	build() {
		Column() {
			Text("登陆框")
				.width(200)
				.height(200)
				.textAlign(TextAlign.Center)
				.backgroundColor("#efefef")
				.fontSize(30)
				.translate({
					x: this.translateX
				})

			Row() {
				Button("jump 10")
					.fontSize(20)
					.onClick(() => {
						this.jumpSpeedFunction(10);
					})

				Button("jump 200")
					.fontSize(20)
					.onClick(() => {
						this.jumpSpeedFunction(200);
					})
			}.margin({ top: 50 })
			.width("100%")
			.justifyContent(FlexAlign.SpaceAround)

			// 路径曲线动画
			Column() {
				Row() {
					Text("路径曲线")
						.width(100)
						.height(100)
						.textAlign(TextAlign.Center)
						.fontSize(20)
				}
				.width(100)
				.height(100)
				.backgroundColor(Color.Orange)
				// 路径动画：path路径 from起始位置 to终止位置 rotatable是否跟随路径旋转
				.motionPath({
					path: "Mstart.x start.y L100 -300 L250 500 L300 50 L200 0 Lend.x end.y",
					from: 0.0,
					to: 1.0,
					rotatable: true // 是否跟随路径旋转
				})
				.onClick(() => {
					animateTo({
						duration: 4000
					}, () => {
						this.flag = !this.flag;
					})
				})
			}
			.width("100%")
			.padding({ top: 20 })
			.layoutWeight(1)
			.justifyContent(FlexAlign.Start)
			.alignItems(this.flag ? HorizontalAlign.Start : HorizontalAlign.End)
		}
		.width('100%')
		.height('100%')
		.padding(20)
		.justifyContent(FlexAlign.Start)
	}
}