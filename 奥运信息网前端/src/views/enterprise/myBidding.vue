<template>
  <div class="content">
    <el-table :data="biddingList" height="450px" style="padding-left: 2em">
      <el-table-column type="index" label="编号"></el-table-column>

      <el-table-column label="投标状态" align="center" prop="status">
        <template #default="{row}">
          <span v-if="row.enterpriseBidding.filesList.length > 0" style="color: #1AD0B6">
            已投标
          </span>
          <span v-else style="color: red">
            未投标
          </span>
        </template>
      </el-table-column>

      <el-table-column prop="bidTitle" label="标的发布名称">
        <template #default="{row}">
          <span style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">{{ row.bidTitle }}</span>
        </template>
      </el-table-column>

      <el-table-column label="中标结果">
        <template #default="{row}">
          <!-- 项目中未有相关状态，采用投标状态进行映射 -->
          <span>{{ row.status !== null ? formatBidStatus(row.status) : '待开标' }}</span>
        </template>
      </el-table-column>

      <el-table-column prop="endDate" label="投标结束时间">
        <template #default="{row}">
          <div style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">{{ row.endDate ? row.endDate : "暂无结束时间" }}</div>
        </template>
      </el-table-column>

      <el-table-column label="报名状态">
        <template #default="{row}">
          <!-- 项目中未有相关状态，采用投标状态进行映射 -->
          <span>{{ row.enterpriseBidding.status !== null ? formatSignStatus(row.enterpriseBidding.status) : '未报名' }}</span>
        </template>
      </el-table-column>

      <el-table-column label="操作">
        <template #default="{row}">
          <el-button v-if="row.enterpriseBidding.filesList.length > 0" style="color: #1AD0B6;" @click="jumpToInfo(row.id)">{{  '查看中标结果' }}</el-button>
          <el-button v-else style="color: #1AD0B6;" @click="jumpToDetail(row.enterpriseBidding.id)">{{  '提交资料' }}</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" v-model:page="queryParams.pageNum" v-model:limit="queryParams.limit" :page-sizes="[5]" @pagination="getList" />
  </div>
</template>

<script>
import { listBiddingBySignUp } from '@/api/bid/bidding'

export default {
  name: "list",
  data() {
    return {
      biddingList: [],
      total: 0,
      queryParams: {
        pageNum: 1,
        limit: 5,
        pageSize: 5,
      },

      bidStatus: [],
      signStatus: [],
    }
  },
  async mounted() {
    await this.getList()
    this.getDicts('bid_status').then(response => {
      this.bidStatus = response.data
    })
    this.getDicts('sign_status').then(response => {
      this.signStatus = response.data
    })
  },
  methods: {
    async getList() {
      const res = await listBiddingBySignUp(this.queryParams)
      this.biddingList = res.rows
      this.total = res.total
    },
    formatBidStatus(status) {
      const dictItem = this.bidStatus.filter(it => it.dictValue === status)
      if (dictItem && dictItem.length > 0) {
        return dictItem[0].dictLabel
      }
      return ''
    },
    formatSignStatus(status) {
      const dictItem = this.signStatus.filter(it => it.dictValue === status)
      if (dictItem && dictItem.length > 0) {
        return dictItem[0].dictLabel
      }
      return ''
    },
    jumpToDetail(id) {
      this.$router.push({
        path: "/enterprise/myBidding/detail",
        query: {id}
      });
    },
    jumpToInfo(id) {
      this.$router.push({
        path: "/bid/detail",
        query: {id}
      });
    }
  }
}
</script>

<style scoped>
.content {
  background: #FFFFFF;
  border-radius: 10px;
  width: 90%;
  padding: 20px;
  margin-left: 20px;
}

@media screen and (max-width: 540px) {
  .content {
    margin-left: 15px;
    padding: 10px;
  }
}

:deep(.pagination-container){
  margin: 0;
}

:deep(.el-pagination){
  float: right;
}
</style>
