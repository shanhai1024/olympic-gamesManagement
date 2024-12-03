<template>
  <div class="content">
    <el-table :data="biddingList" height="450px" style="padding-left: 2em">
      <el-table-column prop="bidTitle" label="标的发布名称">
        <template #default="{row}">
          <div style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" @click="openTo(row.id)">{{ row.bidTitle }}</div>
        </template>
      </el-table-column>

      <el-table-column prop="endDate" label="投标结束时间">
        <template #default="{row}">
          <div style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" @click="openTo(row.id)">{{ row.endDate ? row.endDate : "暂无结束时间" }}</div>
        </template>
      </el-table-column>

      <el-table-column label="操作">
        <template #default="{row}">
          <el-button @click="signUp(row.id)" style="color: #1AD0B6;">报名</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" v-model:page="queryParams.pageNum" v-model:limit="queryParams.limit" :page-sizes="[5]" @pagination="getList" />
  </div>
</template>

<script>
import { listBiddingByNoSignUp } from '@/api/bid/bidding'
import { mapGetters } from 'vuex'
import { addEnterpriseBidding } from '@/api/bid/enterpriseBidding'

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
      }
    }
  },
  async mounted() {
    await this.getList()
  },
  methods: {
    async getList() {
      const res = await listBiddingByNoSignUp(this.queryParams)
		console.log(res)
      this.biddingList = res.rows
      this.total = res.total
    },
    openTo(id) {
      let routeUrl = this.$router.resolve({
        path: "/bid/biddingInfo",
        query: {id}
      });
      window.open(routeUrl .href, '_blank');
    },
    signUp(bidId) {
      this.$confirm('您确定报名该投标吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(async () => {
        await addEnterpriseBidding({
          enterpriseId: this.userId,
          bidId,
          status: 0,
        })
        await this.getList()

        this.$alert("报名成功", {type: "success"})

        this.confirmDialogOpenState = false
      })
    },
  },
  computed: {
    ...mapGetters(["userId"])
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
