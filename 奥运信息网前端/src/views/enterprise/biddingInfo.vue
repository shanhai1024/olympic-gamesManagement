<template>
	<div v-if="biddingData">
		<el-breadcrumb separator="/" class="breadcrumb">
			<el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
			<el-breadcrumb-item :to="`/bid/list?category=${biddingData.category}`">投标列表页</el-breadcrumb-item>
			<el-breadcrumb-item>投标详情页</el-breadcrumb-item>
		</el-breadcrumb>

		<div style="text-align: right;">
			<el-button @click="handlePrint()">打印</el-button>
			<el-button @click="changeFont(40)">大</el-button>
			<el-button @click="changeFont(30)">中</el-button>
			<el-button @click="changeFont(20)">小</el-button>
		</div>

		<div :style="{fontSize}" class="print-element">
			<div style="font-weight: 600; line-height: 2em; text-align: center;"> {{ biddingData.bidTitle }}</div>
			<div style="line-height: 2em; text-align: center;">
				<span style="color: #333333; padding-right: 3em;">发布企业：<span style="color: #666666"
				>{{ biddingData.bidPublisher }}</span></span>
				<span style="color: #333333; padding-right: 3em;">创建时间：<span style="color: #666666"
				>{{ biddingData.bidPublishDatetime }}</span></span>
				<span style="color: #333333">浏览次数：<span style="color: #666666"
				>{{ biddingData.viewCount ? biddingData.viewCount : 0 }}</span></span>
			</div>
			<div class="bidContent"
				 style="line-height: 2em; width: max(70%, 540px); margin: auto; white-space: pre-line; text-align: left;"
				 v-html="biddingData.bidContent"
			/>
			<!-- 没这字段 -->
			<!--      <div>联系方式：</div>-->

			<div style="text-align: left; padding-left: 200px;">
				标书附件:
				<ul>
					<li v-for="file in biddingData.filesList">
						<span @click="sliderCaptchaOpenState = true; downloadFile = file;" style="cursor: pointer;"
						>{{ file.fileName }}</span>
					</li>
				</ul>
				<div v-if="biddingData.filesList.length === 0">
					暂无附件
				</div>
			</div>

			<el-dialog v-model="sliderCaptchaOpenState">
				<SliderCaptcha v-if="sliderCaptchaOpenState" @pass="handlePass"></SliderCaptcha>
			</el-dialog>

			<el-button @click="signUp(biddingData.id)" :type="isSignUp ? 'info' : 'success'" :disabled="isSignUp">报名</el-button>
		</div>
	</div>

</template>

<script>
import { getBidding, viewBidding } from '@/api/bid/bidding'
import SliderCaptcha from '@/components/SliderCaptcha/SliderCaptcha.vue'
import { addEnterpriseBidding, listEnterpriseBidding } from '@/api/bid/enterpriseBidding'
import { mapGetters } from 'vuex'
import { saveAs } from 'file-saver'

export default {
	name: 'detail',
	components: { SliderCaptcha },
	data() {
		return {
			biddingData: undefined,
			fontSize: '20px',

			sliderCaptchaOpenState: false,
			downloadFile: undefined,

			isSignUp: false,
		}
	},
	async mounted() {
		await this.getData()
		if (this.biddingData) {
			await viewBidding(this.biddingData.id)
		}
	},
	methods: {
		async getData() {
			this.biddingData = (await getBidding(this.$route.query.id)).data
			this.isSignUp = (await listEnterpriseBidding({
				enterpriseId: this.userId,
				bidId: this.$route.query.id
			})).rows.length > 0
		},

		handlePrint() {
			print()
		},
		changeFont(size) {
			this.fontSize = size + 'px'
		},

		handlePass() {
			saveAs(this.downloadFile.filePath, this.downloadFile.fileName)

			this.downloadFile = undefined
			this.sliderCaptchaOpenState = false
		},

		signUp(bidId) {
			this.$confirm('您确定报名该投标吗？', '提示', {
				confirmButtonText: '确定',
				cancelButtonText: '取消',
				type: 'warning'
			}).then(async() => {
				await addEnterpriseBidding({
					enterpriseId: this.userId,
					bidId,
					status: 0
				})
				await this.getData()

				await this.$alert('报名成功', { type: 'success' })
			})
		}
	},
	computed: {
		...mapGetters(['userId'])
	}
}
</script>
