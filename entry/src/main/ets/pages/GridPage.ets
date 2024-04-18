@Entry
@Component
struct GridPage {
	@State arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
	@State list: string[] = ["直播", "积分", "卡券", "构建", "运行", "文件", "目录", "窗口", "工具", "试图"];
	@State color: Array<Color> = [Color.Red, Color.Green, Color.Gray, Color.Blue, Color.Brown, Color.Pink,
	Color.Orange, Color.Yellow];

	@Builder defaultGrid() {
		Column() {
			Text("固定行列网格布局")
				.fontSize(26)
				.fontColor(Color.Black)
			Grid() {
				ForEach(this.arr, (item: number, key) => {
					GridItem() {
						Text(item.toString())
							.fontSize(26)
							.fontColor(Color.Black)
							.width("100%")
							.height("100%")
							.textAlign(TextAlign.Center)
							.backgroundColor(key > this.color.length - 1 ? this.color[key - this.color.length] : this.color[key])
					}
				}, item => item);
			}
			.columnsTemplate("1fr 2fr 1fr")
			.rowsTemplate("1fr 2fr 1fr")
			.rowsGap(10)
			.columnsGap(10)
			.height(200)
		}.height(250).padding(10)
	}

	@Builder columnGrid() {
		Column() {
			Text("纵向滚动网格布局")
				.fontSize(26)
				.fontColor(Color.Black)
			Grid() {
				ForEach(this.arr, (item: number, key) => {
					GridItem() {
						Text(item.toString())
							.fontSize(26)
							.fontColor(Color.Black)
							.width("100%")
							.height(100)
							.textAlign(TextAlign.Center)
							.backgroundColor(key > this.color.length - 1 ? this.color[key - this.color.length] : this.color[key])
					}
				}, item => item);
			}.columnsTemplate("1fr 2fr 1fr")
			.rowsGap(10)
			.columnsGap(10)
			.height(200)
		}.height(250).padding(10)
	}

	@Builder rowGrid() {
		Column() {
			Text("横向滚动网格布局")
				.fontSize(26)
				.fontColor(Color.Black)
			Grid() {
				ForEach(this.arr, (item: number, key) => {
					GridItem() {
						Text(item.toString())
							.fontSize(26)
							.fontColor(Color.Black)
							.borderRadius(100)
							.width(100)
							.height(100)
							.textAlign(TextAlign.Center)
							.backgroundColor(key > this.color.length - 1 ? this.color[key - this.color.length] : this.color[key])
					}
				}, item => item);
			}.rowsTemplate("1fr 1fr")
			.rowsGap(20)
			.columnsGap(20)
			.height(250)
		}.height(300).padding(10)
	}

	@Builder randomGrid() {
		Column() {
			Text("不均匀的网格布局")
				.fontSize(26)
				.fontColor(Color.Black)
			Grid() {
				ForEach(this.arr, (item: number, key) => {
					if (key === 2 || key === 4 || key === 6) {
						GridItem() {
							this.textContainer(item, key);
						}.columnStart(key === 2 ? 3 : 2)
						.columnEnd((key === 2 || key === 6) ? 4 : 3)
					} else if (key === 3) {
						GridItem() {
							this.textContainer(item, key);
						}.rowStart(2)
						.rowEnd(3)
					} else {
						GridItem() {
							this.textContainer(item, key);
						}
					}
				}, item => item);
			}
			.columnsTemplate("1fr 1fr 1fr 1fr")
			.rowsTemplate("1fr 1fr 1fr")
			.rowsGap(10)
			.columnsGap(10)
			.height(200)
		}.height(250).padding(10)
	}

	@Builder textContainer(item, key) {
		Text(item.toString())
			.fontSize(26)
			.fontColor(Color.Black)
			.width("100%")
			.height("100%")
			.textAlign(TextAlign.Center)
			.backgroundColor(key > this.color.length - 1 ? this.color[key - this.color.length] : this.color[key])
	}

	build() {
		List() {
			ListItem() {
				Column() {
					// 固定行列的网格布局
					this.defaultGrid();

					// 固定列纵向滚动的网格布局
					this.columnGrid();

					// 固定行横向滚动的网格布局
					this.rowGrid();

					// 不均匀的网格布局
					this.randomGrid();
				}
			}
		}.width('100%')
		.height('100%')
	}
}