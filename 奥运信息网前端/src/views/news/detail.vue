<template>
  <div class="main">
    <div class="breadcrumb-box">
      <div class="breadcrumb">
        <el-breadcrumb separator="/">
          <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
          <el-breadcrumb-item
            ><a href="/news/list">新闻公告</a></el-breadcrumb-item
          >
          <el-breadcrumb-item>新闻详情</el-breadcrumb-item>
        </el-breadcrumb>
      </div>
    </div>
    <div class="content-box">
      <div class="title">{{ detail.title }}</div>
      <div class="info">
        <div style="margin-right: 30px">
          发布单位：{{ detail.createBy || "暂无" }}
        </div>
        <div style="margin-right: 30px">
          发布时间：{{ proxy.parseTime(detail.createTime, "{y}-{m}-{d}") }}
        </div>
        <div>浏览量：{{ detail.views }}</div>
      </div>
      <el-divider />
      <div class="content" v-html="detail.content"></div>
    </div>
  </div>
</template>

<script setup>


const { proxy } = getCurrentInstance();
const route = useRoute();

const id = Number(route.query.id); // 获取传递过来的参数
const detail = ref({});

onMounted(() => {
  getDetail();
  viewFun();
});

// 获取新闻公告详情
const getDetail = () => {
  getNewsDetail(id).then((res) => {
    detail.value = res.data;
  });
};

// 新增新闻公告次数
const viewFun = () => {
  viewNews({id}).then((res) => {
    console.log('浏览了');
  });
};
</script>

<style lang="scss" scoped>
.main {
  display: flex;
  flex-direction: column;
  align-items: center;
  .breadcrumb-box {
    width: 100%;
    height: 50px;
    display: flex;
    justify-content: center;
    .breadcrumb {
      width: 1150px;
      height: 100%;
      display: flex;
      justify-content: flex-start;
      align-items: center;
    }
  }
  .content-box {
    flex: 1;
    width: 1150px;
    padding: 30px 40px;
    border-radius: 10px;
    background: #fff;
    display: flex;
    flex-direction: column;
    align-items: center;
    .title {
      font-size: 20px;
      font-weight: bold;
      color: #3d3d3d;
      margin-bottom: 30px;
    }
    .info {
      font-size: 14px;
      color: #999999;
      display: flex;
    }
  }
}
</style>
