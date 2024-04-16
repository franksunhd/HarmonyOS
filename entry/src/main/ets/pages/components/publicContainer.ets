@Component
export struct publicContainer {
	text: string | number = "text";
	w?: string | number = 80;
	h?: string | number = 80;
	color: Color | string | number = Color.White;
	bgColor: Color | string | number = Color.Red;
	flexG?: number = 1;
	fs?: number = 32;

	build() {
		Row() {
			Text(`${this.text}`).fontSize(this.fs).fontColor(this.color)
		}
		.backgroundColor(this.bgColor)
		.size({
			width: this.w,
			height: this.h
		})
		.justifyContent(FlexAlign.Center)
		.alignItems(VerticalAlign.Center)
		.flexGrow(this.flexG)
	}
}