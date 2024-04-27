@Entry
@Component
struct TextInputPage {
	@State message: string = 'Hello World'

	build() {
		Scroll() {
			TextInput({placeholder: "请输入内容...",text: "正在输入中..."})
				.type(InputType.Normal) // 正常文本输入框
				.placeholderColor(Color.Red)
				.placeholderFont({
					size: 20
				})
				.fontColor(Color.Blue) // 字体颜色
				.backgroundColor(Color.Pink) // 背景颜色
				.enterKeyType(EnterKeyType.Go) // 设置回车键类型


		}
		.width('100%')
		.height('100%')
		.scrollBar(BarState.Auto)
	}
}