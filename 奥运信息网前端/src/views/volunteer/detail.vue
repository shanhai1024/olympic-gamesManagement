<template>

  <h1>{{data.title}}</h1>
  <span>发布者{{data.createBy}}</span>
  <span>发布时间{{data.createTime}}</span>
  <span>浏览量{{data.views}}</span>
<div>
  <h2>{{data.content}}</h2>
</div>

</template>

<script setup>
import {ref} from "vue";
import router from "@/router";

let data =ref({
  "createBy": "管理员A",
  "createTime": "2024-06-18 09:23:18",
  "deleted": null,
  "updateBy": "管理员A",
  "updateTime": "2024-06-18 09:23:18",
  "remark": null,
  "id": 2,
  "title": "志愿者招募通知",
  "content": "奥运会志愿者招募工作即将开始，请有意愿的人员密切关注。",
  "views": 1001
},)

</script>

<style lang="scss" scoped>

</style>

