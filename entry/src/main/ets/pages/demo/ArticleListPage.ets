// 模型类约束数组
import { Article } from "../model/Article";

@Entry
@Component
struct ArticleListPage {
	@State ArticleList: Article[] = [
		new Article(1, "新手攻略|开启关怀模式，与家人更亲近~", "https://www.itying.com/images/listimg/article/01.png", "国家电网", "2024-12-2"),
		new Article(2, "反诈课堂|光伏骗局套路多，听我给您细细说！", "https://www.itying.com/images/listimg/article/02.png", "国家电网", "2024-4-2"),
		new Article(3, "新手攻略|联合版，与家人更亲近~", "https://www.itying.com/images/listimg/article/03.png", "国家电网", "2023-11-12"),
		new Article(4, "新手攻略|轻一点，与家人更亲近~", "https://www.itying.com/images/listimg/article/04.png", "国家电网", "2023-7-24"),
		new Article(5, "关注|局部降温超16℃，与家人更亲近~", "https://www.itying.com/images/listimg/article/05.png", "国家电网", "2023-2-18"),
	]

	build() {
		Column() {
			List() {
				ForEach(this.ArticleList, (item: Article) => {
					ListItem() {
						Row() {
							Column() {
								Text(item.title).fontWeight(FontWeight.Bold).fontSize(16)
								Text(`${item.author} ${item.date}`).fontSize(14)
							}
							.width("100%")
							.height(68)
							.layoutWeight(1)
							.alignItems(HorizontalAlign.Start)
							.justifyContent(FlexAlign.SpaceBetween);

							Image(item.img)
								.width(100)
								.height(68)
								.objectFit(ImageFit.Cover)
								.margin({ left: 8 })
								.borderRadius(10)
						}.width("100%").padding(6)
					}.padding({ top: 6, bottom: 6 })
				}, (item: Article) => {
					return item.id.toString()
				});
			}
			.width("100%")
			.backgroundColor("#fff")
			.padding(10)
			.borderRadius(10)
			.divider({
				strokeWidth: 1,
				color: "#eee"
			})
		}
		.width('100%')
		.height('100%')
		.padding(10)
		.backgroundColor("#eee")
	}
}