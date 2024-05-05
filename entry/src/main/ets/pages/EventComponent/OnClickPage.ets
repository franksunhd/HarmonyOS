interface clickItem {
	screenX?: string,
	screenY?: string,
	width?: string,
	height?: string
}

@Entry
@Component
struct OnClickPage {
	@State message: string = "";
	@State itemObj: clickItem = {
		screenX: "",
		screenY: "",
		width: "",
		height: ""
	};

	build() {
		Column({ space: 30 }) {
			Button() {
				Text("onClick")
					.textAlign(TextAlign.Center)
					.fontSize(20)
					.width(100)
					.height(40)
					.fontColor(Color.White)
			}.onClick((e) => {
				this.message = JSON.stringify(e);
				this.itemObj.screenX = e.screenX.toString();
				this.itemObj.screenY = e.screenY.toString();
				this.itemObj.width = e.target.area.width.toString();
				this.itemObj.height = e.target.area.height.toString();
			})

			Text(this.message).fontSize(20);

			Divider();

			Text(`screenX=${this.itemObj.screenX},screenY=${this.itemObj.screenY},width=${this.itemObj.width},height=${this.itemObj.height}`)
				.fontSize(20)
		}
		.justifyContent(FlexAlign.Start)
		.width('100%')
		.height('100%')
		.padding(20)
	}
}