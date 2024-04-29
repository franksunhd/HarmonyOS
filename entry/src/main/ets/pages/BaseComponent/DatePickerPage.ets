@Entry
@Component
struct DatePickerPage {
	@State isLunar: boolean = false;
	private selectedDate: Date = new Date("2021-08-08");

	build() {
		Column() {
			Button("切换公历农历")
				.margin({ top: 30, bottom: 30 })
				.onClick(() => {
					this.isLunar = !this.isLunar;
				})
			DatePicker({
				start: new Date("2020-01-01"),
				end: new Date("2030-01-01"),
				selected: this.selectedDate
			})
				.lunar(this.isLunar) // 是否显示农历
				.onChange((value: DatePickerResult) => {
					this.selectedDate.setFullYear(value.year, value.month, value.day)
					console.info(`当前选中日期:${JSON.stringify(value)}`);
				})

			Column() {
				Button("公历日期弹窗")
					.margin(20)
					.onClick(() => {
						DatePickerDialog.show({
							start: new Date("2000-1-1"),
							end: new Date("2100-12-31"),
							selected: this.selectedDate,
							lunar: this.isLunar, // 是否显示农历
							onAccept: (value: DatePickerResult) => {
								// 点击弹窗的确定按钮
								this.selectedDate.setFullYear(value.year, value.month, value.day)
								console.info("DatePickerDialog:onAccept()" + JSON.stringify(value))
							},
							onCancel: () => {
								// 点击弹窗的取消按钮
								console.info("DatePickerDialog:onCancel()")
							},
							onChange: (value: DatePickerResult) => {
								// 数据改变时
								console.info("DatePickerDialog:onChange()" + JSON.stringify(value))
							}
						})
					})
			}.width('100%')
		}.width('100%')
	}
}