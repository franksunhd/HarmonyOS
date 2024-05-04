import router from '@ohos.router';

interface listInterface {
	uniId: string,
	imageUrl: string
}

@Entry
@Component
struct SharedTransitionPage {
	@State listData: listInterface[] = [
		{ uniId: "one", imageUrl: "https://www.itying.com/images/flutter/1.png" },
		{ uniId: "two", imageUrl: "https://www.itying.com/images/flutter/2.png" },
		{ uniId: "three", imageUrl: "https://www.itying.com/images/flutter/3.png" },
		{ uniId: "four", imageUrl: "https://www.itying.com/images/flutter/4.png" },
		{ uniId: "five", imageUrl: "https://www.itying.com/images/flutter/5.png" },
		{ uniId: "six", imageUrl: "https://www.itying.com/images/flutter/6.png" },
		{ uniId: "seven", imageUrl: "https://www.itying.com/images/flutter/7.png" }
	]

	build() {
		Column() {
			Grid() {
				ForEach(this.listData, (item: listInterface) => {
					GridItem() {
						Image(item.imageUrl).objectFit(ImageFit.Auto)
							.sharedTransition(item.uniId, {
								duration: 500,
								type: SharedTransitionEffectType.Exchange // 默认: 共享元素转场
							})
					}.onClick(() => {
						router.pushUrl({
							url: "pages/demo/ImagePreviewPage",
							params: <listInterface> {
								uniId: item.uniId,
								imageUrl: item.imageUrl
							}
						})
					})
				}, (item: listInterface) => {
					return item.uniId
				});
			}
			.columnsTemplate("1fr 1fr")
			.columnsGap(10)
			.rowsGap(10)
		}
		.width('100%')
		.height('100%')
		.padding(10)
	}

	// 禁用转场动画
	pageTransition() {
		PageTransitionEnter({ type: RouteType.None, duration: 0 })
			.slide(SlideEffect.Bottom) // 方向
			.opacity(1) // 透明度为1 页面不动没有动画
			.onEnter((type: RouteType, progress: number) => {
				console.warn("--onEnter--", progress.toString());
			})
		PageTransitionExit({ type: RouteType.None, duration: 0 })
			.slide(SlideEffect.Bottom) // 方向
			.opacity(1) // 透明度为1 页面不动没有动画
			.onExit((type: RouteType, progress: number) => {
				console.warn("--onExit--", progress.toString());
			})
	}
}