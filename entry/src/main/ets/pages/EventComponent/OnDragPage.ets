@Observed
class DragModel {
	name: string;
	flag: boolean;

	constructor(name: string, flag: boolean) {
		this.name = name;
		this.flag = flag;
	}
}

@Entry
@Component
struct OnDragPage {
	@State dragList: DragModel[] = [
		new DragModel("A", true),
		new DragModel("B", true),
		new DragModel("C", true),
		new DragModel("D", true),
		new DragModel("E", true),
	];
	@State changeIndex: number = 0;

	// 数组元素交换位置
	changeIndexFun(index_1: number, index_2: number) {
		[this.dragList[index_1], this.dragList[index_2]] = [this.dragList[index_2], this.dragList[index_1]];
	}

	build() {
		Column() {
			List({ space: 30 }) {
				ForEach(this.dragList, (item: DragModel, key: number) => {
					ListItem() {
						Column() {
							DrugChild({ item: this.dragList[key] })
						}.width("100%")
						.alignItems(HorizontalAlign.Center)
					}.onTouch((e) => {
						// 1、记录下标
						if (e.type === TouchType.Down) {
							this.changeIndex = key;
						}
					})
				}, (item: DragModel) => {
					return item.name;
				})
			}
			// 绑定此事件的组件可作为拖拽释放目标，当在本组件范围内停止拖拽行为时，触发回调。
			.onDrop((e: DragEvent, extraParams: string) => {
				let jsonString = JSON.parse(extraParams);
				console.warn(this.changeIndex.toString(), jsonString.insertIndex.toString());
				this.changeIndexFun(this.changeIndex, jsonString.insertIndex);
			})
		}
		.width("100%")
		.height("100%")
		.padding(20)
		.justifyContent(FlexAlign.Start)
	}
}

@Component
struct DrugChild {
	@ObjectLink item: DragModel;

	@Builder
	DrugText(item: DragModel) {
		Text(item.name)
			.fontSize(30)
			.fontWeight(FontWeight.Bold)
			.width("80%")
			.height(50)
			.textAlign(TextAlign.Center)
			.fontColor(Color.White)
			.backgroundColor("#AFEEEE")
	}

	build() {
		Text(this.item.name)
			.fontSize(30)
			.fontWeight(FontWeight.Bold)
			.width("80%")
			.height(50)
			.textAlign(TextAlign.Center)
			.fontColor(Color.White)
			.visibility(this.item.flag ? Visibility.Visible : Visibility.Hidden)
			.backgroundColor("#AFEEEE")
			.onDragStart(() => {
				console.warn("__121__")
				// 2、定义拖拽时候的元素
				this.item.flag = false; // 拖拽开始 隐藏元素
				return this.DrugText(this.item);
			})
			.onTouch((e) => {
				if (e.type === TouchType.Up) {
					this.item.flag = true;
				}
			})
	}
}