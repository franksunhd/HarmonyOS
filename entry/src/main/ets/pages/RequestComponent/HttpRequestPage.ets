import http from "@ohos.net.http";

@Entry
@Component
struct HttpRequestPage {
	@State params: string = "暂无接口信息~~";
	@State listData: string[] = [];

	async aboutToAppear() {
		await this.getArticleList();
	}

	// 请求文章数据
	async getArticleList() {
		// let apiUrl: string = "https://www.phonegap100.com/appapi.php?a=getPortalList&catid=20";
		let apiUrl: string = "https://svc-drcn.developer.huawei.com/community/servlet/consumer/cn/documentPortal/getCatalogTree";
		let params: any = await this.httpRequest(apiUrl, "POST", {
			catalogName: "harmonyos-references-V2",
			language: "cn"
		});
		if (typeof params === "string") {
			params = JSON.parse(params);
		}
		if (!!params.code && params.code === "00000") {
			console.warn("--value--", JSON.stringify(params.value.catalogTreeList))
			let listData: string[] = [];
			params.value.catalogTreeList.forEach((val) => {
				if (!!val.children) {
					val.children.forEach((v) => {
						listData.push(v.nodeName)
					})
				}
			});
			console.warn("--listData--", listData);
			this.listData = listData;
		}
	}

	httpRequest(apiUrl: string, methods: string, data?: object) {
		console.warn("--methods--", methods, "--data--", JSON.stringify(data));
		let httpReq: http.HttpRequest = http.createHttp();
		return new Promise((resolve, reject) => {
			httpReq.request(apiUrl, {
				method: http.RequestMethod[methods], // 请求方法
				header: {
					contentType: "application/json"
				},
				extraData: data || {}, // 请求参数
				expectDataType: http.HttpDataType.OBJECT, // 返回参数类型
				readTimeout: 60000, // 读取超时 默认60s
				connectTimeout: 60000, // 连接超时 默认60s
			}).then((res) => {
				resolve(res.result);
			}).catch((err) => {
				console.error("--httpRequest--", JSON.stringify(err));
				reject(err);
			})
		})
	}

	// get请求
	async httpGet() {
		let apiUrl: string = "https://xiaomi.itying.com/api/httpGet";
		let params = await this.httpRequest(apiUrl, "GET", {
			username: "FrankSun",
			address: "北京市",
			age: 18
		});
		this.params = JSON.stringify(params);
		console.warn(this.params);
	}

	// post请求
	async httpPost() {
		let apiUrl: string = "https://xiaomi.itying.com/api/httpPost";
		let params = await this.httpRequest(apiUrl, "POST", {
			username: "FrankSun",
			address: "北京市",
			age: 18,
			uid: 12
		});
		this.params = JSON.stringify(params);
		console.warn(this.params);
	}

	// put请求
	async httpPut() {
		let apiUrl: string = "https://xiaomi.itying.com/api/httpPut";
		let params = await this.httpRequest(apiUrl, "PUT", {
			username: "FrankSun",
			address: "北京市",
			age: 18,
			uid: 12
		});
		this.params = JSON.stringify(params);
		console.warn(this.params);
	}

	// delete请求
	async httpDelete() {
		let apiUrl: string = "https://xiaomi.itying.com/api/httpDelete";
		let params = await this.httpRequest(apiUrl, "DELETE", {
			uid: 12
		});
		this.params = JSON.stringify(params);
		console.warn(this.params);
	}

	build() {
		Scroll() {
			Column({ space: 30 }) {
				HttpButton({ btnText: "GET请求" }).onClick(() => {
					this.httpGet();
				});

				HttpButton({ btnText: "POST请求" }).onClick(() => {
					this.httpPost();
				});

				HttpButton({ btnText: "PUT请求" }).onClick(() => {
					this.httpPut();
				});

				HttpButton({ btnText: "DELETE请求" }).onClick(() => {
					this.httpDelete();
				});

				Text(this.params).fontSize(20)
					.backgroundImageSize(ImageSize.Cover)

				List({ space: 20 }) {
					ForEach(this.listData, (item) => {
						ListItem() {
							Text(item).fontSize(20)
								.width("100%")
								.lineHeight(30)
						}.width("100%")
					}, (item: string) => {
						return item
					});
				}.divider({
					strokeWidth: 1,
					color: Color.Brown
				})
			}
			.width("100%")
			.padding(20)
		}.scrollBar(BarState.Auto)
	}
}

@Component
struct HttpButton {
	@Prop btnText: string;

	build() {
		Button() {
			Text(this.btnText)
				.fontSize(20)
				.textAlign(TextAlign.Center)
				.fontColor(Color.White)
				.size({
					width: "100%",
					height: "100%"
				})
		}.width("90%")
		.height(40)
	}
}