// 数组类型
let arr_1: Array<string> = ["鸿蒙OS", "Android", "MacOS"];
let arr_2: number[] = [1, 2, 3, 4];
let arr_6: object[] = [
	{ id: "1", title: "鸿蒙OS" },
	{ id: "2", title: "Android" },
	{ id: "3", title: "MacOS" },
];

@Entry
@Component
struct ArrayPage {
	@State arr_3: any[] = [1, "string", true];
	arr_4: object[] = [
		{ id: "1", title: "鸿蒙OS" },
		{ id: "2", title: "Android" },
		{ id: "3", title: "MacOS" },
	];
	// 元组类型
	arr_5: [string, number, boolean] = ["我是字符串", 18, false];
	@State flag: boolean = false;

	build() {
		Column() {
			Button("改变Flag").onClick(() => {
				this.flag = !this.flag;
			});

			Divider(); // 分割线

			List({ space: 10 }) { // 间距为 10px
				if (this.flag) {
					ListItem() {
						Text(`${this.arr_3[1]}`)
							.width("100%")
							.height(60)
							.borderRadius(20)
							.backgroundColor("#111")
							.textAlign(TextAlign.Center)
							.fontSize(20)
							.padding(0)
							.fontColor("#fff")
					}
				}

				// 遍历访问 string类型 数组
				ForEach(arr_1, (item, key) => {
					ListItem() {
						Text(`${item}--${key}`)
							.width("100%")
							.height(60)
							.borderRadius(20)
							.backgroundColor("#eee")
							.textAlign(TextAlign.Center)
							.fontSize(20)
							.padding(0)
					}
				}, item => item);

				// 遍历访问 object类型 数组
				ForEach(this.arr_4, (item, key) => {
					ListItem() {
						Text(`title--${item.title}--id=${item.id}--key=${key}`)
							.width("100%")
							.height(60)
							.borderRadius(20)
							.backgroundColor("#333")
							.textAlign(TextAlign.Center)
							.fontSize(20)
							.padding(0)
							.fontColor("#fff")
					}
				}, item => item);

				// 遍历访问 元组类型 数组
				ForEach(this.arr_5, (item, key) => {
					ListItem() {
						Text(`${item}--typeof=${typeof item}--key=${key}`)
							.width("100%")
							.height(60)
							.borderRadius(20)
							.backgroundColor("#666")
							.textAlign(TextAlign.Center)
							.fontSize(20)
							.padding(0)
							.fontColor("#fff")
					}
				}, item => item);
			}
		}.width("100%").height("100%")
	}
}