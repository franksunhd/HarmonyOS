import promptAction from "@ohos.promptAction";

@Entry
@Component
struct PatternLockPage {
	@State message: string = "请输入密码";
	@State passwordText:string = "";
	LockController: PatternLockController = new PatternLockController();

	build() {
		Column() {
			Text(this.message)
				.fontSize(20)
				.margin({ top: 20 })
				.textAlign(TextAlign.Center)
			PatternLock(this.LockController)
				.sideLength(300) // 设置 宽高
				.circleRadius(12) // 设置 图案点的大小
				.regularColor(Color.Brown) // 图案点 在未选中时的 填充颜色
				.selectedColor(Color.Red) // 图案点 在选中时的 填充颜色
				.activeColor(Color.Brown) // 图案点 在激活时的 填充颜色
				.pathColor(Color.Green) // 连线的颜色
				.pathStrokeWidth(20) // 连线的宽度
				.onPatternComplete((input) => {
					if (!input || input.length < 5) {
						promptAction.showToast({
							message: "密码长度不能小于5位！",
							duration: 3000,
							bottom: 200
						});
						this.LockController.reset();
						this.passwordText = "";
						return false;
					}
					console.warn("--密码为--", JSON.stringify(input));
					this.passwordText = input.join(",");
				});

			Text(this.passwordText)
				.fontSize(20)
				.margin({ top: 20 })
				.textAlign(TextAlign.Center)
		}
		.width('100%')
		.height('100%')
	}
}