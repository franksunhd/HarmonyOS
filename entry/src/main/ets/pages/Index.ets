// 数字类型 (全局变量-组件中使用时不再需要使用this)
let num_1: number = 123; // 整型--十进制
let num_2: number = 12.3; // 浮点型
let num_3: number = 0x1f; // 十六进制
let num_4: number = 0o12; // 八进制
let num_5: number = 18;

// 字符串类型
let string_1: string = "你好 李焕英";
let string_2: string = `我今年${num_5}岁了`;

// 布尔类型
let bool_1: boolean = true;
let bool_2: boolean = false;

// 联合类型
let a: string | number | boolean;
a = "my name is frank sun";
a = 1;
a = true;

// 枚举类型
enum myColor {
	RED = "red",
	BLUE = "blue",
	GREEN = "green"
}

let content: myColor = myColor.RED;

// unknown any 任意类型:放弃类型检查
let c: any;
let d: unknown;
c = d = 11;
c = d = "string";
c = d = false;


@Entry // @Entry 装饰器 表示把 当前组件 定义为 当前页面 的入口组件
@Component // @Component 装饰器 表示 自定义组件的装饰器
struct Index {
	@State message: string = "你好 孙思研"; // @State 装饰器 表示变量为响应式数据
	// 这里不再需要使用 let 定义
	string_3: string = "我是鸿蒙(HarmonyOS)";

	build() {
		// 行
		Row() {
			// 列
			Column() {
				// 文本
				Text(this.message)
					.fontSize(50)
					.fontWeight(FontWeight.Bold)
					.margin(10)

				Divider(); // 分割线

				Button("点击我").margin(10).onClick(() => {
					this.message = "您好 段琼";
				});

				Divider(); // 分割线

				// 数字类型
				Text(num_1.toString()).fontSize(40).margin(10);
				Divider(); // 分割线
				Text(`${num_2}`).fontSize(40).margin(10);

				Divider(); // 分割线

				// 字符串类型
				Text(string_1).fontSize(40).margin(10);
				Divider(); // 分割线
				Text(string_2).fontSize(40).margin(10);

				Divider(); // 分割线
				Text(`注意：访问属性时需要使用this，即this.string=${this.string_3}`)
					.fontSize(20).margin(10);

				Divider(); // 分割线
				Text(`使用枚举类型访问颜色是${content}`)
					.fontSize(20).margin(10).fontColor(content);
			}.width("100%")
		}.height("100%")
	}
}