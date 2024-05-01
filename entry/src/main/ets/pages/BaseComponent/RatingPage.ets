@Entry
@Component
struct RatingPage {
	@State rate: number = 8

	build() {
		Column({ space: 20 }) {
			Rating({
				rating: this.rate,
				indicator: false
			})
				.stars(10) // 满分分值
				.stepSize(0.5) // 分值步长
				// .starStyle({
				// 	backgroundUri: "", // 未选
				// 	secondaryUri: "", // 半选
				// 	foregroundUri: "", // 全选
				// })
				.onChange((val) => {
					this.rate = val;
				})

			Text(`当前评分为${this.rate}分！`)
				.fontSize(20)
				.fontWeight(FontWeight.Bold)
		}
		.width('100%')
		.height('100%')
		.padding(20)
	}
}