import router from '@ohos.router';
import curves from '@ohos.curves';

interface listInterface {
	uniId: string,
	imageUrl: string
}

@Entry
@Component
struct ImagePreviewPage {
	@State listData: listInterface[] = [
		{ uniId: "one", imageUrl: "https://www.itying.com/images/flutter/1.png" },
		{ uniId: "two", imageUrl: "https://www.itying.com/images/flutter/2.png" },
		{ uniId: "three", imageUrl: "https://www.itying.com/images/flutter/3.png" },
		{ uniId: "four", imageUrl: "https://www.itying.com/images/flutter/4.png" },
		{ uniId: "five", imageUrl: "https://www.itying.com/images/flutter/5.png" },
		{ uniId: "six", imageUrl: "https://www.itying.com/images/flutter/6.png" },
		{ uniId: "seven", imageUrl: "https://www.itying.com/images/flutter/7.png" }
	]
	@State uniId: string = "";
	@State imageUrl: string = "";
	@State imageIndex: number = 0;

	// build 方法创建前执行
	aboutToAppear() {
		let params = router.getParams();
		this.uniId = params["uniId"] || "";
		this.imageUrl = params["imageUrl"] || "";
		this.listData.forEach((val, index) => {
			if (val.uniId === this.uniId) {
				this.imageIndex = index;
			}
		});
	}

	build() {
		Column() {
			Swiper() {
				ForEach(this.listData, (item: listInterface) => {
					Image(item.imageUrl).objectFit(ImageFit.Auto)
						.sharedTransition(item.uniId, {
							duration: 500,
							type: SharedTransitionEffectType.Exchange // 默认: 共享元素转场
						})
				}, (item: listInterface) => {
					return item.uniId
				})
			}.index(this.imageIndex)
		}
		.width('100%')
		.height('100%')
		.backgroundColor(Color.Black)
		.justifyContent(FlexAlign.Center)
		.sharedTransition("bg", {
			duration: 500,
			curve: Curve.Linear,
			type: SharedTransitionEffectType.Static
		})
		.onClick(() => {
			router.back();
		})
	}

	// 禁用转场动画
	pageTransition() {
		PageTransitionEnter({ type: RouteType.None, duration: 0 });
		PageTransitionExit({ type: RouteType.None, duration: 0 });
	}
}