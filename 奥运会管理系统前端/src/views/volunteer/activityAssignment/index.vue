<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="志愿者" prop="volunteerId">
          <el-select v-model="queryParams.volunteerId" clearable style="width: 200px">
              <el-option v-for="item in volunteerNameList" :key="item.value" :value="item.value" :label="item.label" />
          </el-select>
      </el-form-item>
      <el-form-item label="赛事" prop="eventId">
          <el-select v-model="queryParams.eventId" clearable style="width: 200px">
              
          </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          
          v-hasPermi="['volunteer:activityAssignment:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['volunteer:activityAssignment:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['volunteer:activityAssignment:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="Download"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['volunteer:activityAssignment:export']"-->
<!--        >导出</el-button>-->
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="activityAssignmentList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="zho" />
<!--      <el-table-column label="备注" align="center" prop="remark" />-->
      <el-table-column label="志愿者" align="center" prop="volunteerId" :formatter="handleVolunteerName" />
      <el-table-column label="赛事" align="center" prop="eventId" :formatter="handleEventName" />
      <el-table-column label="工作分配详情" align="center" prop="assignmentDetail" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['volunteer:activityAssignment:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['volunteer:activityAssignment:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改志愿者管理-活动分配对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="activityAssignmentRef" :model="form" :rules="rules" label-width="80px">
<!--        <el-form-item label="备注" prop="remark">-->
<!--          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />-->
<!--        </el-form-item>-->
        <el-form-item label="志愿者" prop="volunteerId">
            <el-select v-model="form.volunteerId" clearable style="width: 200px">
                <el-option v-for="item in volunteerNameList" :key="item.value" :value="item.value" :label="item.label" />
            </el-select>
        </el-form-item>
        <el-form-item label="赛事" prop="eventId">
            <el-select v-model="form.eventId" clearable style="width: 200px">
                <el-option v-for="item in eventNameList" :key="item.value" :value="item.value" :label="item.label" />
            </el-select>
        </el-form-item>
        <el-form-item label="工作分配" prop="assignmentDetail">
          <el-input v-model="form.assignmentDetail" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="ActivityAssignment">
import { listActivityAssignment, getActivityAssignment, delActivityAssignment, addActivityAssignment, updateActivityAssignment } from "@/api/volunteer/activityAssignment";

const { proxy } = getCurrentInstance();

const activityAssignmentList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const eventNameList = ref([])
proxy.getQuerySelect("query_eventName").then(res=>{
    eventNameList.value = res.data
})

const volunteerNameList = ref([])
proxy.getQuerySelect("query_volunteerName").then(res=>{
    volunteerNameList.value = res.data
})
const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    volunteerId: null,
    eventId: null,
    assignmentDetail: null
  },
  rules: {
  }
});

const { queryParams, form, rules } = toRefs(data);
function handleEventName(row){
    for (let valueElement of eventNameList.value) {
        if(valueElement.value == row.eventId){
            return valueElement.label
        }
    }
    return ""
}

function handleVolunteerName(row){
    for (let valueElement of volunteerNameList.value) {
        if(valueElement.value == row.volunteerId){
            return valueElement.label
        }
    }
    return ""
}
/** 查询志愿者管理-活动分配列表 */
function getList() {
  loading.value = true;
  listActivityAssignment(queryParams.value).then(response => {
    activityAssignmentList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

// 取消按钮
function cancel() {
  open.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    zho: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null,
    remark: null,
    volunteerId: null,
    eventId: null,
    assignmentDetail: null
  };
  proxy.resetForm("activityAssignmentRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.zho);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加志愿者管理-活动分配";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _zho = row.zho || ids.value
  getActivityAssignment(_zho).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改志愿者管理-活动分配";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["activityAssignmentRef"].validate(valid => {
    if (valid) {
      if (form.value.zho != null) {
        updateActivityAssignment(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addActivityAssignment(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _zhos = row.zho || ids.value;
  proxy.$modal.confirm('是否确认删除志愿者管理-活动分配编号为"' + _zhos + '"的数据项？').then(function() {
    return delActivityAssignment(_zhos);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}



/** 导出按钮操作 */
function handleExport() {
  proxy.download('volunteer/activityAssignment/export', {
    ...queryParams.value
  }, `activityAssignment_${new Date().getTime()}.xlsx`)
}

getList();
</script>
