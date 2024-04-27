@Entry
@Component
struct TextInputPage {
	@State message: string = 'Hello World'
	textController: TextInputController = new TextInputController()

	build() {
		Scroll() {
			Column({ space: 30 }) {
				TextInput({ placeholder: "请输入内容...", text: "" })
					.type(InputType.Normal) // 正常文本输入框
					.overlay("正常文本--支持输入数字/字母/下划线/空格/特殊字符", {
						align: Alignment.TopStart,
						offset: { x: 10, y: -20 }
					})
					.defaultFocus(false)


				TextInput({ placeholder: "请输入内容...", text: "正在输入中...", controller: this.textController })
					.type(InputType.Normal) // 正常文本输入框
					.placeholderColor(Color.Red)
					.placeholderFont({
						size: 20
					})
					.fontColor(Color.Blue) // 字体颜色
					.backgroundColor(Color.Pink) // 背景颜色
					.enterKeyType(EnterKeyType.Search) // 设置回车键类型 Go:开始 Search:搜索 Send:发送 Next:下一个 Done:完成
					.caretColor(Color.Green) // 光标颜色
					.maxLength(100) // 最大可输入字符
					.overlay("正常文本--带默认内容", {
						align: Alignment.TopStart,
						offset: { x: 10, y: -20 }
					})
					.copyOption(CopyOptions.None) // 禁止复制 只能粘贴
						// 正则表达式
					.inputFilter('[a-z]', (e) => {
						console.log(JSON.stringify(e))
					})
					.defaultFocus(true) // 是否自动获取焦点

				TextInput({ placeholder: "请输入内容...", text: "" })
					.type(InputType.Number)
					.overlay("数字键盘--纯数字模式", {
						align: Alignment.TopStart,
						offset: { x: 10, y: -20 }
					})

				TextInput({ placeholder: "请输入内容...", text: "" })
					.type(InputType.PhoneNumber)
					.overlay("电话号输入--支持输入数字、+ 、-、*、#，长度不限", {
						align: Alignment.TopStart,
						offset: { x: 10, y: -20 }
					})

				TextInput({ placeholder: "请输入内容...", text: "" })
					.type(InputType.Email)
					.overlay("邮箱输入--支持数字/字母/下划线/@符(只能1个@符)", {
						align: Alignment.TopStart,
						offset: { x: 10, y: -20 }
					})

				TextInput({ placeholder: "请输入内容...", text: "" })
					.type(InputType.Password)
					.overlay("密码输入--支持输入数字/字母/下划线/空格/特殊字符.密码显示小眼睛图标并且默认会将文字变成圆点", {
						align: Alignment.TopStart,
						offset: { x: 10, y: -20 }
					})
					.showPasswordIcon(true) // 是否显示密码输入框尾部 小眼睛
					.style(TextInputStyle.Inline) // 设置输入框为默认风格或内联输入风格
					.textAlign(TextAlign.Center)

				Button("点击触发光标").onClick(() => {
					this.textController.caretPosition(2); //
				});

				Divider();

				TextArea({placeholder: "请输入多行文本...", text: ""})
					.placeholderColor(Color.Green)
					.placeholderFont({
						size: 20,
						weight: FontWeight.Bold
					})
					.caretColor(Color.Red) // 光标颜色
					.defaultFocus(true) // 是否自动获取焦点
					.copyOption(CopyOptions.None) // 禁止复制 仅粘贴
					// .height(40) // 设置高度后 内容区域滚动


			}.justifyContent(FlexAlign.Start)
			.width('100%')
			.height('100%')
			.padding({ top: 40 })
		}
		.width('100%')
		.height('100%')
		.padding({ left: 10, right: 10 })
		.scrollBar(BarState.Auto)
	}
}