<template>
  <div class="main">
    <el-image style="width: 100%" :src="newsBgUrl" fit="fill" />
    <div class="breadcrumb-box">
      注：选手自行编写、设计服务接口部分（pojo、mapper、service、controller）、用户前端界面。
    </div>
    <div class="card-box" v-if="list.length">
    </div>
    <div v-else>
      <img style="width: 200px;margin-top: 100px;" src="@/assets/images/nodata.png" alt="">
      <div style="font-size: 14px;color: #999999;margin-top: 10px;">暂无内容</div>
    </div>
  </div>
</template>

<script setup>
import newsBgUrl from "@/assets/images/news-bg.png";


const list = ref([]);

</script>

<style lang="scss" scoped>
</style>
