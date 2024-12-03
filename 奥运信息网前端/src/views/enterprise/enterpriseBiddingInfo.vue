<template>
  <div class="detail" v-if="biddingData">
    <el-breadcrumb separator="/" class="breadcrumb">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item :to="`/enterprise/myBidding`">参标项目</el-breadcrumb-item>
      <el-breadcrumb-item>参标项目详情</el-breadcrumb-item>
    </el-breadcrumb>

    <div>
      <div>
        <span v-if="endDate > 0">距离招投标结束</span>
        <span v-else>投标结束</span>
        <CountDown :target-time="endDate"></CountDown>
      </div>

      <div class="title">投标进度</div>
      <div style="width: 200px; margin: auto; padding-top: 20px;">
        <el-timeline>
          <el-timeline-item
            v-for="(activity, index) in bidTimeline"
            :key="index"
            color="#48D1CC"
            :timestamp="activity.timestamp"
          >
            {{ activity.content }}
          </el-timeline-item>
        </el-timeline>
      </div>

      <div class="title">项目信息</div>
      <div @click="openTo(biddingData.id)" style="cursor: pointer;">
        <div style="font-weight: 600; line-height: 2em; text-align: center;">{{ biddingData.bidTitle }}</div>
        <div style="line-height: 2em; text-align: center;">
          <span style="color: #333333; padding-right: 3em;">发布企业：<span style="color: #666666"
          >{{ biddingData.bidPublisher }}</span></span>
          <span style="color: #333333">创建时间：<span style="color: #666666">{{
              biddingData.bidPublishDatetime
            }}</span></span>
        </div>
        <div class="bidContent"
             style="line-height: 2em; width: max(70%, 540px); margin: auto; white-space: pre-line; text-align: left; height: 300px; overflow-y: scroll; text-overflow: ellipsis;"
             v-html="biddingData.bidContent"
        />
      </div>

      <div class="title">上传身份证</div>
      <div
        style="display: grid; grid-template-columns: repeat(3, 1fr); grid-template-rows: 300px; padding-top: 20px; padding-bottom: 20px;"
      >
        <div>
          <ImageUpload :value="tempIdCardUrl" @input="(value) => tempIdCardUrl = value" style="margin: auto;"
                       :width="428" :height="270"
          ></ImageUpload>
        </div>
        <div>
          <SignBoard style="margin: auto;" :width="428" :height="270" @confirm="handleConfirm"></SignBoard>
        </div>
        <div style="width: 428px; height: 270px;">
          <img style="margin: auto;" :src="enterpriseBiddingData.idCard"/>
        </div>
      </div>

      <div class="title">资料上传</div>
      <FileUpload @input="handleFileUpload" :limit="3"></FileUpload>

      <el-button @click="handleSubmit" style="margin-top: 50px;">提交</el-button>
    </div>
  </div>

</template>

<script>
import { getEnterpriseBidding, updateEnterpriseBidding } from '@/api/bid/enterpriseBidding'
import CountDown from '@/components/CountDown/CountDown.vue'
import SignBoard from '@/components/SignBoard/SignBoard.vue'
import FileUpload from '@/components/FileUpload/index.vue'
import ImageUpload from '@/components/ImageUpload/index.vue'
import { getBaseUrl } from '@/utils/env'
import request from '@/utils/request'

export default {
  name: 'detail',
  components: { ImageUpload, SignBoard, CountDown, FileUpload },
  data() {
    return {
      enterpriseBiddingData: undefined,
      biddingData: undefined,

      bidTimeline: [],
      tempIdCardUrl: undefined
    }
  },
  async mounted() {
    const data = (await getEnterpriseBidding(this.$route.query.id)).data
    this.enterpriseBiddingData = data
    this.biddingData = data.bidBidding

    this.bidTimeline = [
      {
        content: '报名',
        timestamp: this.biddingData.bidPulishDatetime
      }, {
        content: '提交材料',
        timestamp: this.biddingData.beginDate
      }, {
        content: '开标结果',
        timestamp: this.biddingData.endDate
      }
    ]
  },
  methods: {
    openTo(id) {
      let routeUrl = this.$router.resolve({
        path: '/bid/detail',
        query: { id }
      })
      window.open(routeUrl.href, '_blank')
    },

    handleConfirm({ canvas, context }) {
      const width = 428
      const height = 270

      if (this.tempIdCardUrl) {
        let newCanvas = document.createElement('canvas')
        let newContext = newCanvas.getContext('2d')
        newCanvas.width = width // 你可以根据需要修改
        newCanvas.height = height // 你可以根据需要修改

        const idCardImage = new Image()

        idCardImage.src = getBaseUrl() + this.tempIdCardUrl

        idCardImage.onload = () => {
          newContext.drawImage(idCardImage, 0, 0, width, height)
          newContext.drawImage(canvas, 0, 0, width, height)

          newCanvas.toBlob(blob => {
            let formData = new FormData();
            formData.append('file', blob, `idCardWithSign${new Date().getTime()}.png` );

            request({
              url: '/common/upload',
              method: 'post',
              data: formData
            }).then(res => {
              this.enterpriseBiddingData.idCard = getBaseUrl() + res.url
            })
          })
        }
      } else {
        this.$alert('请上传身份证图片并再次提交')
      }
    },

    handleFileUpload(fileList) {
      this.enterpriseBiddingData.filesList = fileList.map(file => {
        return {
          fileName: file.originalFileName,
          filePath: file.url
        }
      })
    },

    handleSubmit() {
      if (!this.enterpriseBiddingData.idCard) {
        this.$alert('请上传身份证照片并签名')
        return
      }

      if (this.enterpriseBiddingData.filesList.length === 0) {
        this.$alert('请上传资料')
        return
      }

      this.enterpriseBiddingData.bidId = this.biddingData.id

      updateEnterpriseBidding(this.enterpriseBiddingData).then(res => {
        alert('提交成功')
        this.$router.push('/enterprise/myBidding')
      })
    }
  },
  computed: {
    endDate() {
      if (!this.biddingData.endDate) return 0
      return (new Date(this.biddingData.endDate).getTime()) / 1000 - new Date().getTime() / 1000
    }
  }
}
</script>

<style scoped>
.title {
  font-size: 24px;
  font-weight: 600;
  margin-top: 60px;
}
</style>
