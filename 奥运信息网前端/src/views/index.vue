<template>
  <div class="main">
    <el-image style="width: 100%" :src="mainUrl" fit="fill" />
    <el-image style="width: 500px; margin: 25px 0" :src="newsUrl" fit="fill" />
    <div class="card-box" v-if="list.length">
      <el-card
        class="card"
        shadow="always"
        v-for="(item, index) in list"
        :key="index"
        @click="handleDetail(item.id)"
      >
        <div class="title">{{ item.title }}</div>
        <div class="footer">
          <div class="left">{{ item.createBy || "暂无" }}</div>
          <div class="right">
            {{ proxy.parseTime(item.createTime, "{y}-{m}-{d}") }}
          </div>
        </div>
      </el-card>
    </div>
    <div v-else>
      <img style="width: 200px;margin-top: 100px;" src="@/assets/images/nodata.png" alt="">
      <div style="font-size: 14px;color: #999999;margin-top: 10px;">暂无内容</div>
    </div>
    <div v-if="list.length">
      <el-button class="more" round color="#22CDB5" plain @click="handleMore"
        >查看更多</el-button
      >
    </div>
  </div>
</template>

<script setup>
import mainUrl from "@/assets/images/main-bg.png";
import newsUrl from "@/assets/images/news.png";
import { getNewsList } from "@/api/news/news";

const { proxy } = getCurrentInstance();
const router = useRouter();

const list = ref([]);
const params = {
  pageNum: 1,
  limit: 9,
};

onMounted(() => {
  getList();
});

// 获取新闻公告列表
const getList = () => {
  getNewsList(params).then((res) => {
    list.value = res.rows;
  });
};

// 查看更多
const handleMore = () => {
  router.push(`/news/list`);
};

// 查看详情
const handleDetail = (id = "") => {
  router.push(`/news/detail?id=${id}`);
};
</script>

<style lang="scss" scoped>
.main {
  display: flex;
  flex-direction: column;
  align-items: center;
  .card-box {
    width: 1150px;
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    .card {
      width: 372px;
      height: 100px;
      border-radius: 10px;
      margin-bottom: 20px;
      cursor: pointer;
      &:hover {
        border: 1px solid #01c3c9;
        box-shadow: 0 0 4px #01c3c9;
      }
      .title {
        font-size: 14px;
        color: #3d3d3d;
        font-weight: bold;
        text-align: left;
        display: -webkit-box;
        overflow: hidden;
        -webkit-box-orient: vertical;
        line-clamp: 2;
        -webkit-line-clamp: 2;
        &:hover {
          color: #01c3c9;
        }
      }
      .footer {
        display: flex;
        justify-content: space-between;
        font-size: 12px;
        color: #8a9090;
        margin-top: 10px;
      }
    }
  }
  .more {
    width: 150px;
    height: 34px;
    margin: 20px;
  }
  :deep(.el-card__body) {
    height: 100%;
    padding: 15px 20px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  }
}
</style>
