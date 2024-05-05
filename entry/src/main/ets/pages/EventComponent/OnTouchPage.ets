interface touchItem {
	screenX?: string,
	screenY?: string,
	touchType?: string,
}

@Entry
@Component
struct OnTouchPage {
	@State message: string = "";
	@State itemObj: touchItem = {
		screenX: "",
		screenY: "",
		touchType: "",
	};

	build() {
		Column({ space: 30 }) {
			Button() {
				Text("onTouch")
					.textAlign(TextAlign.Center)
					.fontSize(20)
					.width(100)
					.height(40)
					.fontColor(Color.White)
			}.onTouch((e) => {
				if (e.type === TouchType.Down) {
					this.itemObj.touchType = "Down";
				} else if (e.type === TouchType.Move) {
					this.itemObj.touchType = "Move";
				} else if (e.type === TouchType.Up) {
					this.itemObj.touchType = "Up";
				} else if (e.type === TouchType.Cancel) {
					this.itemObj.touchType = "Cancel";
				}
				this.itemObj.screenX = e.touches[0].screenX.toString();
				this.itemObj.screenY = e.touches[0].screenY.toString();
				this.message = JSON.stringify(e);
			})

			Text(this.message).fontSize(20);

			Divider();

			Text(`screenX=${this.itemObj.screenX},screenY=${this.itemObj.screenY},touchType=${this.itemObj.touchType}`)
				.fontSize(20)
		}
		.justifyContent(FlexAlign.Start)
		.width('100%')
		.height('100%')
		.padding(20)
	}
}