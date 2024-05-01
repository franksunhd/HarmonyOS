import promptAction from '@ohos.promptAction';

@Entry
@Component
struct PromptActionPage {
	private fontArr: string[] = ["超大号", "特大号", "大号", "中号", "小号", "超小号"];

	// 显示Toast
	showToast(msg = "") {
		promptAction.showToast({
			message: msg || "您好，我是showToast！",
			duration: 3000,
			bottom: 400
		})
	}

	// 显示Dialog
	showDialog() {
		promptAction.showDialog({
			title: "提示",
			message: "您好，我是showDialog！\t\r",
			buttons: [
				{ text: "取消", color: "#616777" },
				{ text: "确定", color: "red" }
			]
		}).then((val) => {
			console.warn("--showDialog then--", JSON.stringify(val));
			if (val.index === 0) {
				this.showToast("点击了取消");
			} else {
				this.showToast("点击了确定");
			}
		}).catch((err) => {
			console.error("--showDialog catch--", err);
		});
	}

	// 显示showActionMenu
	showActionMenu(msg = "") {
		promptAction.showActionMenu({
			title: "选择字体",
			buttons: [
				{ text: this.fontArr[0], color: "#333" },
				{ text: this.fontArr[1], color: "#333" },
				{ text: this.fontArr[2], color: "#333" },
				{ text: this.fontArr[3], color: "#333" },
				{ text: this.fontArr[4], color: "#333" },
				{ text: this.fontArr[5], color: "#333" }
			]
		}).then((val) => {
			console.warn("--showActionMenu then--", JSON.stringify(val));
			this.showToast(`选择了${this.fontArr[val.index]}`);
		}).catch((err) => {
			console.warn("--showActionMenu catch--" + JSON.stringify(err));
		});
	}

	build() {
		Column({ space: 40 }) {
			Button("showToast")
				.type(ButtonType.Capsule)
				.width("100%")
				.height(40)
				.onClick(() => {
					this.showToast();
				})

			Button("showDialog")
				.type(ButtonType.Capsule)
				.width("100%")
				.height(40)
				.onClick(() => {
					this.showDialog();
				})

			Button("showActionMenu")
				.type(ButtonType.Capsule)
				.width("100%")
				.height(40)
				.onClick(() => {
					this.showActionMenu();
				})
		}
		.width('100%')
		.height('100%')
		.padding(20)
	}
}