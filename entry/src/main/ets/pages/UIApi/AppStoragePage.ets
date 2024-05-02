import router from '@ohos.router';
@Entry
@Component
struct AppStoragePage {
	build() {
		Scroll() {
			Column() {
				// @StorageProp 单向数据流
				storageProp();

				Divider().margin({ top: 30, bottom: 30 });

				// @storageLink 双向数据流
				storageLink();

				Divider().margin({ top: 30, bottom: 30 });

				// PersistentStorage.PersistProp
				persistentProp();
			}.width('100%')
			.padding(20)
			.justifyContent(FlexAlign.Start)
		}
		.width('100%')
		.scrollBar(BarState.Auto)
	}
}

@Component
struct storageProp {
	@StorageProp("count") count: number = 1;
	@State isShowTemp: string = "";

	build() {
		Column() {
			Text(`@StorageProp count=${this.count}`)
				.fontSize(25)

			Button() {
				Text("设置count的值+1")
					.fontSize(20)
					.fontColor(Color.White)
			}.padding({ top: 10, bottom: 10, left: 20, right: 20 })
			.margin({ top: 20 })
			.onClick(() => {
				AppStorage.Set<number>("count", AppStorage.Get<number>("count") + 1);
			})

			Button() {
				Text("this.count+1")
					.fontSize(20)
					.fontColor(Color.White)
			}.padding({ top: 10, bottom: 10, left: 20, right: 20 })
			.margin({ top: 20 })
			.onClick(() => {
				++this.count;
			})

			Button() {
				Text(`获取缓存中的count=${!!this.isShowTemp ? this.isShowTemp : ""}`)
					.fontSize(20)
					.fontColor(Color.White)
			}.padding({ top: 10, bottom: 10, left: 20, right: 20 })
			.margin({ top: 20 })
			.onClick(() => {
				let isShowTemp = AppStorage.Get<number>("count");
				this.isShowTemp = isShowTemp.toString();
			})
		}
	}
}

@Component
struct storageLink {
	@StorageLink("num") count: number = 1;
	@State isShowTemp: string = "";

	build() {
		Column() {
			Text(`@StorageLink count=${this.count}`)
				.fontSize(25)

			Button() {
				Text("设置count的值+1")
					.fontSize(20)
					.fontColor(Color.White)
			}.padding({ top: 10, bottom: 10, left: 20, right: 20 })
			.margin({ top: 20 })
			.onClick(() => {
				AppStorage.Set<number>("num", AppStorage.Get<number>("num") + 1);
			})

			Button() {
				Text("this.count+1")
					.fontSize(20)
					.fontColor(Color.White)
			}.padding({ top: 10, bottom: 10, left: 20, right: 20 })
			.margin({ top: 20 })
			.onClick(() => {
				++this.count;
			})

			Button() {
				Text(`获取缓存中的count=${!!this.isShowTemp ? this.isShowTemp : ""}`)
					.fontSize(20)
					.fontColor(Color.White)
			}.padding({ top: 10, bottom: 10, left: 20, right: 20 })
			.margin({ top: 20 })
			.onClick(() => {
				let isShowTemp = AppStorage.Get<number>("num");
				this.isShowTemp = isShowTemp.toString();
			})
		}
	}
}

@Component
struct persistentProp {
	@StorageLink("idNo") idNo:number = 1;
	@State isShowTemp: string = "";

	build() {
		Column() {
			Text(`PersistentStorage.PersistProp idNo=${this.idNo}`)
				.fontSize(18)

			Button() {
				Text("设置idNo的值+1")
					.fontSize(20)
					.fontColor(Color.White)
			}.padding({ top: 10, bottom: 10, left: 20, right: 20 })
			.margin({ top: 20 })
			.onClick(() => {
				this.idNo++;
				PersistentStorage.PersistProp<number>("idNo", this.idNo);
			})

			Button() {
				Text(`获取缓存中的count=${!!this.isShowTemp ? this.isShowTemp : ""}`)
					.fontSize(20)
					.fontColor(Color.White)
			}.padding({ top: 10, bottom: 10, left: 20, right: 20 })
			.margin({ top: 20 })
			.onClick(() => {
				let isShowTemp = AppStorage.Get<number>("idNo");
				this.isShowTemp = isShowTemp.toString();
			})

			Button() {
				Text("跳转路由页面")
					.fontSize(20)
					.fontColor(Color.White)
			}.padding({ top: 10, bottom: 10, left: 20, right: 20 })
			.margin({ top: 20 })
			.onClick(() => {
				router.pushUrl({
					url: "pages/UIApi/RouterPage"
				})
			})
		}
	}
}