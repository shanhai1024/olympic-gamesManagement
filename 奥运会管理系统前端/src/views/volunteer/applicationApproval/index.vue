<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="志愿者" prop="volunteerName">
        <el-input
          v-model="queryParams.volunteerName"
          placeholder="请输入志愿者姓名"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="申请状态" prop="applicationStatus">
        <el-select v-model="queryParams.applicationStatus" clearable style="width: 200px;">
            <el-option v-for="item in application_status" :key="item.value" :value="item.value" :label="item.label" />
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
          @click="handleAdd"
          v-hasPermi="['volunteer:applicationApproval:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['volunteer:applicationApproval:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['volunteer:applicationApproval:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="Download"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['volunteer:applicationApproval:export']"-->
<!--        >导出</el-button>-->
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="applicationApprovalList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="id" />
<!--      <el-table-column label="备注" align="center" prop="remark" />-->
      <el-table-column label="志愿者姓名" align="center" prop="volunteerName" />
        <el-table-column label="申请状态" align="center" prop="applicationStatus">
            <template #default="scope">
                <dict-tag :options="application_status" :value="scope.row.applicationStatus" />
            </template>
        </el-table-column>
      <el-table-column label="资格审查" align="center" prop="qualificationReview" />
      <el-table-column label="分配信息" align="center" prop="assignmentInfo" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['volunteer:applicationApproval:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['volunteer:applicationApproval:remove']">删除</el-button>
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

    <!-- 添加或修改志愿者管理-申请与审批对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="applicationApprovalRef" :model="form" :rules="rules" label-width="80px">
<!--        <el-form-item label="备注" prop="remark">-->
<!--          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />-->
<!--        </el-form-item>-->
        <el-form-item label="志愿者姓名" prop="volunteerName" label-width="90px">
          <el-input v-model="form.volunteerName" placeholder="请输入志愿者姓名" />
        </el-form-item>
        <el-form-item label="资格审查" prop="qualificationReview">
          <el-input v-model="form.qualificationReview"  placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="分配信息" prop="assignmentInfo">
          <el-input v-model="form.assignmentInfo" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="申请状态" prop="applicationStatus" v-if="form.id != null">
            <el-select v-model="form.applicationStatus" clearable style="width: 200px;">
                <el-option v-for="item in application_status" :key="item.value" :value="item.value" :label="item.label" />
            </el-select>
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

<script setup name="ApplicationApproval">
import { listApplicationApproval, getApplicationApproval, delApplicationApproval, addApplicationApproval, updateApplicationApproval } from "@/api/volunteer/applicationApproval";
import DictTag from "@/components/DictTag/index.vue";

const { proxy } = getCurrentInstance();

const applicationApprovalList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    volunteerName: null,
    applicationStatus: null,
    qualificationReview: null,
    assignmentInfo: null
  },
  rules: {
  }
});

const { application_status } = proxy.useDict("application_status")

const { queryParams, form, rules } = toRefs(data);

/** 查询志愿者管理-申请与审批列表 */
function getList() {
  loading.value = true;
  listApplicationApproval(queryParams.value).then(response => {
    applicationApprovalList.value = response.rows;
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
    id: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null,
    remark: null,
    volunteerName: null,
    applicationStatus: null,
    qualificationReview: null,
    assignmentInfo: null
  };
  proxy.resetForm("applicationApprovalRef");
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
  ids.value = selection.map(item => item.id);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加志愿者管理-申请与审批";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getApplicationApproval(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改志愿者管理-申请与审批";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["applicationApprovalRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateApplicationApproval(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addApplicationApproval(form.value).then(response => {
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
  const _ids = row.id || ids.value;
  proxy.$modal.confirm('是否确认删除志愿者管理-申请与审批编号为"' + _ids + '"的数据项？').then(function() {
    return delApplicationApproval(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}



/** 导出按钮操作 */
function handleExport() {
  proxy.download('volunteer/applicationApproval/export', {
    ...queryParams.value
  }, `applicationApproval_${new Date().getTime()}.xlsx`)
}

getList();
</script>
