@Entry
@Component
struct QrCodePage {
	@State message: string = "Hello World";
	@State link: string = "https://www.baidu.com";

	build() {
		Column({ space: 50 }) {
			QRCode(this.message)
				.width(200)
				.height(200)
				.color(Color.Black)
				.backgroundColor(Color.Pink)
				.overlay(this.message, { align: Alignment.Bottom, offset: { x: 0, y: 30 } })


			QRCode(this.link)
				.width(200)
				.height(200)
				.color(0xF7CE00)
				.overlay(this.link, { align: Alignment.Bottom, offset: { x: 0, y: 30 } })
		}
		.width('100%')
		.height('100%')
	}
}