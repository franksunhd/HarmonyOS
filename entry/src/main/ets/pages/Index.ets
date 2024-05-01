import router from '@ohos.router';

interface menuItem {
	title: string,
	pathName?: string,
	children?: menuItem[]
}

@Entry // @Entry 装饰器 表示把 当前组件 定义为 当前页面 的入口组件
@Component // @Component 装饰器 表示 自定义组件的装饰器
struct Index {
	@State menuList: menuItem[] = [
		{
			title: "基础组件",
			children: [
				{ title: "日期组件(datePicker)", pathName: "pages/BaseComponent/DatePickerPage" },
				{ title: "表单组件(radio/checkBox)", pathName: "pages/BaseComponent/DatePickerPage" },
				{ title: "图片组件(Image)", pathName: "pages/BaseComponent/ImagePage" },
				{ title: "输入框组件(textInput/textArea)", pathName: "pages/BaseComponent/TextInputPage" },
			]
		},
		{
			title: "容器组件",
			children: [
				{ title: "数组组件(array)", pathName: "pages/BoxComponent/ArrayPage" },
				{ title: "Flex组件", pathName: "pages/BoxComponent/FlexPage" },
				{ title: "Grid组件", pathName: "pages/BoxComponent/GridPage" },
				{ title: "List组件", pathName: "pages/BoxComponent/ListPage" },
				{ title: "ListGroup组件", pathName: "pages/BoxComponent/ListGroupPage" },
				{ title: "List组件(scroller控制器)", pathName: "pages/BoxComponent/ListScrollerPage" },
				{ title: "布局组件(relativeContainer)", pathName: "pages/BoxComponent/RelativeContainerPage" },
				{ title: "stack组件", pathName: "pages/BoxComponent/StackPage" },
				{ title: "tabs组件", pathName: "pages/BoxComponent/TabsPage" },
			]
		},
		{
			title: "UI界面(API)",
			children: [
				{ title: "页面路由(router)", pathName: "pages/UIApi/RouterPage" },
				{ title: "弹窗(promptAction)", pathName: "pages/UIApi/PromptActionPage" },
			]
		},
		{
			title: "其他",
			children: [
				{ title: "数据类型", pathName: "pages/OtherPage/DataPage" },
				{ title: "自定义组件", pathName: "pages/OtherPage/LayoutPage" },
				{ title: "layoutWeight", pathName: "pages/OtherPage/LayoutWeight" },
			]
		}
	];

	build() {
		Scroll() {
			List() {
				ForEach(this.menuList, (item: menuItem, key: number) => {
					ListItem() {
						Column() {
							Text(item.title)
								.width("100%")
								.fontWeight(FontWeight.Bold)
								.fontSize(20)
							Flex({
								direction: FlexDirection.Row,
								justifyContent: FlexAlign.Start, // 配置主轴
								wrap: FlexWrap.Wrap, //
								alignContent: FlexAlign.Center, // 配置纵轴 注意：只有在wrap的值为Wrap或者WrapReverse时才生效
								alignItems: ItemAlign.Center
							}) {
								ForEach(item.children, (val: menuItem, i: number) => {
									Text(val.title)
										.fontSize(16)
										.fontColor(Color.Blue)
										.padding({ right: 10, bottom: 5 })
										.onClick(() => {
											router.pushUrl({
												url: val.pathName
											});
										})
								});
							}.width("100%")
							.margin({ top: 10 })
						}.width("100%")
						.justifyContent(FlexAlign.Start)
					}.width("100%")
					.margin({ bottom: 10 })
				}, item => item);
			}.size({
				width: "100%",
				height: "100%"
			})
			.padding(15)
		}.width("100%")
	}
}