<template>
  <div class="feedback">
    <el-image style="width: 100%" :src="feedbackBgUrl" fit="fill" />
    <div class="feedback_nav">
        <div class="breadcrumb">
            <el-breadcrumb separator="/">
                <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
                <el-breadcrumb-item>
                    用户反馈
                </el-breadcrumb-item>
            </el-breadcrumb>
        </div>
    </div>
    <div class="feedback_body">
        <div class="com_btn">
            <el-button round color="#07CBD1" size="large" style="width: 100px;" @click="handleAdd">
                <span style="color: #ffffff">去投诉</span>
            </el-button>
        </div>

        <el-card v-if="feedbackList.length" class="feedback_list" shadow="always" v-for="item in feedbackList" :key="item.id" @click="handleDetail(item.id)">
          <div class="item_left">
            <div class="item_left_title">{{item.title}}</div>
            <div style="display: flex;align-items: center;gap: 8px">
                <img src="../../assets/time.png"  alt=""/>
                <span style="color: #818382;font-size: 14px">{{proxy.parseTime(item.createTime, "{y}-{m}-{d}")}}</span>
            </div>
          </div>
          <div class="item_right">
            <div style="display: flex;flex-direction: column; gap: 18px">
                <div style="font-size: 16px;color: #FF9C00">{{ item.status == 1 ? "处理完成" : "正在处理中"}}</div>
                <div style="font-size: 14px;color: #818382">当前状态</div>
            </div>
            <div style="">
                <el-button round color="#22CDB5" style="width: 80px;" plain @click="handleDetail(item.id)">查看</el-button>
            </div>
          </div>
        </el-card>

        <div v-else>
        <img style="width: 200px;margin-top: 100px;" src="@/assets/images/nodata.png" alt="">
        <div style="font-size: 14px;color: #999999;margin-top: 10px;">暂无内容</div>
        </div>

        <div style="display: flex;justify-content: center">
            <pagination style="background: transparent" v-show="total>0" :total="total" v-model:page="queryParams.pageNum" v-model:limit="queryParams.limit" :page-sizes="[5]" @pagination="getList" />
        </div>
    </div>

    <el-dialog v-model="open" :title="title" width="500px" append-to-body @close="cancel">
        <el-form ref="feedbackRef" :model="form" :rules="rules" label-width="80px">
            <el-form-item label="标题" prop="title">
                <el-input v-if="form.id == null" v-model="form.title" placeholder="请输入标题" />
                <span v-else>{{form.title}}</span>
            </el-form-item>
            <el-form-item label="内容" prop="content">
                <el-input  v-if="form.id == null"  type="textarea" v-model="form.content" placeholder="请输入内容" />
                <span v-else>{{form.content}}</span>
            </el-form-item>
            <el-form-item label="联系人" prop="contacts">
                <el-input v-if="form.id == null" v-model="form.contacts" placeholder="请输入联系人" />
                <span v-else>{{form.contacts}}</span>
            </el-form-item>
            <el-form-item label="联系电话" prop="contactPhone">
                <el-input v-if="form.id == null" v-model="form.contactPhone" placeholder="请输入联系电话" />
                <span v-else>{{form.contactPhone}}</span>
            </el-form-item>
            <el-form-item v-if="form.id != null" label="当前状态" >
                <span style="color: #FF9C00;font-size: 14px">{{form.status == 1 ? "处理完成" : "正在处理中"}}</span>
            </el-form-item>
        </el-form>
        <template #footer>
            <div class="dialog-footer">
                <el-button @click="cancel">{{ form.id != null ? "关闭" : "取消"}}</el-button>
                <el-button v-show="form.id == null" type="primary" @click="submitForm">保存</el-button>
            </div>
        </template>
    </el-dialog>
  </div>

</template>

<script setup>
import feedbackBgUrl from "@/assets/feedback.png";
import { listFeedback, addFeedback, getFeedback } from "@/api/feedback/feedback"
import {getCurrentInstance, reactive, ref, toRefs} from "vue";


const { proxy } = getCurrentInstance();

const total = ref(0)
const open = ref(false)
const title = ref("")
const feedbackList = ref([])


const data = reactive({
    queryParams:{
        pageNum: 1,
        limit: 5,
        pageSize: 5,
    },
    form: {},
    rules: {
        title: [{required: true,message:'标题不能为空',trigger: 'blur'}],
        content: [{required: true,message:'内容不能为空',trigger: 'blur'}],
        contacts: [{required: true,message:'联系人不能为空',trigger: 'blur'}],
        contactPhone: [{required: true,message:'联系电话不能为空',trigger: 'blur'}],
    }
})

const { queryParams,form,rules } = toRefs(data)

function getList(){
    listFeedback(queryParams.value).then(res=>{
        feedbackList.value = res.rows
        total.value = res.total
    })
}

function handleAdd(){
    open.value = true
    title.value = "创建反馈"
}

function cancel(){
    open.value = false
    form.value = {}
    proxy.resetForm("feedbackRef");
}

function handleDetail(id){
    getFeedback(id).then(res=>{
        form.value = res.data
        open.value = true
        title.value = "查看反馈详情"
    })
}

function submitForm() {
    console.log(form.value)
    proxy.$refs["feedbackRef"].validate(valid => {
        if (valid) {
            addFeedback(form.value).then(response => {
                proxy.$modal.msgSuccess("新增成功");
                open.value = false;
                getList();
            });
        }
    })
}

getList()
</script>

<style lang="scss" scoped>
.feedback{
    display: flex;
    flex-direction: column;
    align-items: center;
}
.feedback_nav {
    width: 100%;
    height: 50px;
    background: #fff;
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
.feedback_body{
    width: 1150px;
}
.com_btn{
    display: flex;
    width: 100px;
    margin-top: 30px;
}
.feedback_list{
    width: 100%;
    margin-top: 20px;
    height: 120px;
    list-style: none;
    border-radius: 20px;
    background: #ffffff;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border: 1px solid transparent;
    cursor: pointer;
}

.feedback_list:hover{
    border: 1px solid #01c3c9;
    box-shadow: 0 0 4px #01c3c9;
}

.item_left{
    flex: 1;
    min-width: 0;
    max-width: 100%;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 20px
}
.item_left_title{
    max-width: 100%;
    font-family: '微软雅黑',serif;
    font-weight: bold;
    color: #000000;
    font-size: 20px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    text-align: left;
}
.item_left_title:hover{
    color: #01c3c9;
}
.item_right{
    display: flex;
    gap: 70px;
    align-items: center;
}
:deep(.el-card__body) {
    display: flex;
    align-items: center;
    width: 100%;
  }
</style>