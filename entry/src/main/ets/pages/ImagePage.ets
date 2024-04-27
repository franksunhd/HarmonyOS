@Entry
@Component
struct ImagePage {
	build() {
		Column() {
			List({ space: 20 }) {
				ListItem() {
					Column({ space: 20 }) {
						// 请求网络资源图片
						Image("https://www.itying.com/images/listimg/article/01.png")
							.width(200)
						// 请求本地资源图片
						Image($r("app.media.app_icon")).width(100)
						// 请求rawfile的图片
						Image($rawfile("icon.png"))
							.width("25%")
							.borderWidth(1)
							.objectFit(ImageFit.ScaleDown)
							.aspectRatio(1)
								// sourceSize：设置图片解码尺寸，降低图片的分辨率
								// 仅在目标尺寸小于图源尺寸时生效。
								// svg类型图源不支持该属性。
								// PixelMap资源不支持该属性。
							.sourceSize({
								width: 50,
								height: 50
							})

						// 请求SVG图片 矢量图
						Image("images/user.svg").width(100).fillColor(Color.Blue)
							.interpolation(ImageInterpolation.High) // 图片插值 None: 正常原图 Low:低分辨率 Medium:中分辨率 High:高分辨率

						Image("https://www.itying.com/images/listimg/article/01.png")
							.width(200)
							.height(200)
							.borderWidth(1)
							.objectFit(ImageFit.Contain)
							.renderMode(ImageRenderMode.Template) // 渲染模式:黑白

						Image($rawfile("icon.png"))
							.alt("123")
							.width(200)
							.height(200)
							.borderWidth(1)
							.autoResize(true) // 设置图片解码过程中是否对图源自动缩放 默认:true
							.objectFit(ImageFit.ScaleDown)
							.objectRepeat(ImageRepeat.XY) // 图片重复
							.copyOption(CopyOptions.InApp) // InApp:应用内 LocalDevice:设备内
							.overlay('图片重复', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })

						Image("https://www.itying.com/images/listimg/article/01.png")
							.width(200)
							.borderWidth(1)
								// 添加滤镜效果
							.colorFilter([1, 1, 1, 1, 1,
								0, 1, 0, 0, 0,
								0, 0, 1, 0, 0,
								0, 0, 0, 1, 0])
							.syncLoad(true) // 是否同步加载图片
					}
				}
			}.alignListItem(ListItemAlign.Center)
		}
		.width("100%")
		.height("100%")
	}
}