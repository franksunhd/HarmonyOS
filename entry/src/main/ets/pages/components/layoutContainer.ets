@Component
export struct layoutContainer {
	text: string | number = "text";
	w?: string | number = 80;
	h?: string | number = 80;
	color: Color | string | number = Color.White;
	bgColor: Color | string | number = Color.Red;
	f?: number = 1;

	build() {
		Row() {
			Text(`${this.text}`).fontSize(32).fontColor(this.color)
		}
		.backgroundColor(this.bgColor)
		.justifyContent(FlexAlign.Center)
		.alignItems(VerticalAlign.Center)
		.height(this.h)
		.width(this.w)
		.flexGrow(this.f)
	}
}