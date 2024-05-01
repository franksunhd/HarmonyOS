@Entry
@Component
struct TogglePage {
	build() {
		Column({space : 20}) {
			Row() {
				Text("Switch")
					.fontSize(20)
				Toggle({
					type: ToggleType.Switch,
					isOn: true
				})
					.height(40)
					.width(100)
					.selectedColor(Color.Orange)
					.switchPointColor(Color.Green)
					.onChange((val) => {
						console.warn("--onChange--", val);
					})
			}


			Row({ space: 20 }) {
				Text("Button")
					.fontSize(20)
				Toggle({
					type: ToggleType.Button,
					isOn: true
				})
					.height(40)
					.width(100)
					.selectedColor(Color.Orange)
					.onChange((val) => {
						console.warn("--onChange--", val);
					})
			}

			Row({ space: 20 }) {
				Text("Checkbox")
					.fontSize(20)
				Toggle({
					type: ToggleType.Checkbox,
					isOn: true
				})
					.height(40)
					.width(100)
					.selectedColor(Color.Orange)
					.onChange((val) => {
						console.warn("--onChange--", val);
					})
			}

		}
		.width('100%')
		.height('100%')
	}
}